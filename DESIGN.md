# 视频素材数据存储与查询服务

## 技术设计决策文档

---

## 1. 项目概述

本项目旨在设计并实现一套视频素材数据的存储与查询服务，包含数据库设计和只读 API 两个核心部分。系统需要支持多数据源的统一存储、灵活的查询过滤、以及高效的统计聚合能力。

---

## 2. 技术选型决策

### 2.1 数据库选型：PostgreSQL

经过对 ElasticSearch 和 PostgreSQL 的深入对比分析，本项目选择 PostgreSQL 作为主要数据存储方案。以下是详细的选型依据：

#### 2.1.1 PostgreSQL vs ElasticSearch 对比分析

| 对比维度 | PostgreSQL | ElasticSearch |
|---------|-----------|---------------|
| 数据模型 | 关系型模型，支持结构化表、JSONB 半结构化数据，Schema 严格但灵活 | 文档型模型，Schema-less，天然支持异构数据结构 |
| 查询能力 | SQL 标准支持，复杂 JOIN、聚合、窗口函数，事务一致性保证 | 全文搜索、模糊匹配、相关性排序优秀，聚合查询通过 DSL 实现 |
| 事务支持 | ACID 完全支持，强一致性，适合关键业务数据 | 最终一致性，无传统事务支持，通过乐观并发控制实现 |
| 扩展性 | 垂直扩展为主，读写分离、分区表支持水平扩展 | 原生分布式架构，水平扩展能力强，自动分片 |
| 运维复杂度 | 单节点部署简单，成熟生态，丰富的监控工具 | 集群配置复杂，需要管理节点、数据节点，内存要求高 |
| 适用场景 | 结构化数据、复杂事务、强一致性要求的业务系统 | 日志分析、全文搜索、实时大数据分析、非结构化数据 |

#### 2.1.2 选择 PostgreSQL 的核心原因

1. **数据结构化程度高**：素材数据具有明确的字段结构（标题、文件大小、上传人、审核状态等），关系型模型更契合
2. **复杂统计需求**：作业要求的聚合查询（平均文件大小、标签统计）使用 SQL 更直观高效
3. **JSONB 灵活性**：PostgreSQL 的 JSONB 类型可优雅处理三份数据集的字段差异
4. **事务一致性**：素材元数据需要 ACID 保证，避免数据不一致
5. **部署简便**：单节点 PostgreSQL 更适合作业场景，评审者可一键启动

---

## 3. 数据库 Schema 设计

### 3.1 核心表结构

#### 3.1.1 assets 素材主表

| 字段名 | 类型 | 约束 | 说明 |
|--------|------|------|------|
| id | SERIAL | PRIMARY KEY | 自增主键 |
| asset_id | VARCHAR(64) | UNIQUE, NOT NULL | 业务唯一ID |
| title | VARCHAR(500) | NOT NULL | 素材标题 |
| description | TEXT | - | 描述信息 |
| file_url | VARCHAR(1000) | - | 文件存储路径 |
| file_size | BIGINT | - | 文件大小(字节) |
| file_format | VARCHAR(20) | - | 文件格式 |
| status | VARCHAR(20) | DEFAULT 'pending' | 审核状态 |
| uploader | VARCHAR(100) | NOT NULL | 上传人 |
| uploaded_at | TIMESTAMPTZ | DEFAULT NOW() | 上传时间 |
| metadata | JSONB | DEFAULT '{}' | 扩展字段 |

#### 3.1.2 tags 标签表

| 字段名 | 类型 | 约束 | 说明 |
|--------|------|------|------|
| id | SERIAL | PRIMARY KEY | 自增主键 |
| name | VARCHAR(50) | UNIQUE, NOT NULL | 标签名称 |

#### 3.1.3 asset_tags 关联表

| 字段名 | 类型 | 约束 | 说明 |
|--------|------|------|------|
| asset_id | INTEGER | REFERENCES assets(id) ON DELETE CASCADE | 素材ID |
| tag_id | INTEGER | REFERENCES tags(id) ON DELETE CASCADE | 标签ID |
| | | PRIMARY KEY (asset_id, tag_id) | 复合主键 |

#### 3.1.4 索引策略

基于查询需求设计以下索引，索引类型的选择遵循 PostgreSQL 最佳实践：

> **B-tree 索引**：PostgreSQL 默认索引类型，适用于等值查询（`=`）和范围查询（`<`、`>`、`BETWEEN`、`ORDER BY`），数据按有序树结构存储，查询时间复杂度为 O(log n)。
>
> **GIN 索引**（Generalized Inverted Index，通用倒排索引）：专为复合值类型设计（如 JSONB、数组、全文搜索），将复合值拆解为多个键并建立倒排映射，支持对内部元素的高效检索。

- **idx_assets_status**: status 字段 B-tree 索引 — 状态为有限枚举值，等值匹配场景，B-tree 最高效
- **idx_assets_uploader**: uploader 字段 B-tree 索引 — 按上传人精确查询和 GROUP BY 聚合，B-tree 支持有序扫描
- **idx_assets_uploaded_at**: uploaded_at 字段 B-tree 索引 — 时间范围过滤和 ORDER BY 排序，B-tree 天然支持有序遍历
- **idx_assets_file_size**: file_size 字段 B-tree 索引 — 文件大小范围查询（`BETWEEN`），B-tree 的有序结构可快速定位范围边界
- **idx_assets_metadata**（暂未创建）: metadata 字段 GIN 索引 — 当前无基于 metadata 的 JSONB 查询需求，故暂不创建。GIN 索引会增加写入开销（每次 INSERT/UPDATE 需拆解 JSONB 键值对并更新倒排索引），在无查询收益时属于纯性能负担。后续如需支持 JSONB 查询（如 `metadata @> '{"city":"上海"}'`、`metadata->>'resolution'` 等），可按需创建：`CREATE INDEX idx_assets_metadata ON assets USING GIN(metadata);`

---

## 4. API 设计

### 4.1 接口规范

| 接口 | 方法 | 说明 |
|------|------|------|
| /assets | GET | 列表查询，支持过滤、排序、分页 |
| /assets/:id | GET | 单条记录查询，支持字段筛选 |

### 4.2 查询参数设计

**分页参数**：

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `pageNum` | Integer | 1 | 页码，最小值为 1 |
| `pageSize` | Integer | 20 | 每页条数，范围 1~100 |

**过滤参数**：支持精确匹配和范围查询

- `status=approved` — 精确匹配，按审核状态过滤
- `uploader=张三` — 精确匹配，按上传人过滤
- `fileSizeMin=0&fileSizeMax=524288000` — 文件大小范围查询（单位：字节）
- `uploadedAtStart=2024-01-01&uploadedAtEnd=2024-12-31` — 上传时间范围查询

**排序参数**：支持多字段排序

- `sort=uploaded_at:desc,file_size:asc`

---

## 5. 验证查询示例

### 5.1 查询一：各上传人平均文件大小

**业务意义**：识别高容量上传者，优化存储配额分配策略

```sql
SELECT uploader, AVG(file_size) as avg_size 
FROM assets 
WHERE status = 'approved' 
GROUP BY uploader;
```

**查询结果**：

```json
[
  { "uploader": "赵六", "avg_size": 598237074.33 },
  { "uploader": "王五", "avg_size": 268681871.00 },
  { "uploader": "刘八", "avg_size": 381143453.50 },
  { "uploader": "周九", "avg_size": 351576554.00 },
  { "uploader": "陈七", "avg_size": 423997421.29 },
  { "uploader": "张三", "avg_size": 104626912.50 },
  { "uploader": "吴十", "avg_size": 600834048.00 },
  { "uploader": "李四", "avg_size": 325000246.00 }
]
```

### 5.2 查询二：热门标签统计

**业务意义**：发现热门内容分类，指导内容运营策略

```sql
SELECT t.name, COUNT(*) as count 
FROM tags t 
JOIN asset_tags at ON t.id = at.tag_id 
GROUP BY t.id 
ORDER BY count DESC 
LIMIT 5;
```

**查询结果**：

```json
[
  { "name": "搞笑", "count": 23 },
  { "name": "促销", "count": 20 },
  { "name": "生活", "count": 20 },
  { "name": "测评", "count": 18 },
  { "name": "种草", "count": 18 }
]
```

### 5.3 查询三：上传趋势分析

**业务意义**：监控内容生产活跃度，预测存储增长趋势

```sql
SELECT DATE(uploaded_at) as date, COUNT(*) as count 
FROM assets 
WHERE uploaded_at >= NOW() - INTERVAL '30 days' 
GROUP BY date 
ORDER BY date;
```
**查询结果**：

> 注：当前测试数据的 `uploaded_at` 均为 2024 年，不在最近 30 天范围内，因此该查询返回空结果。生产环境中持续有新素材上传时，此查询将按日期聚合展示每日上传量趋势。

```json
[]
```

---

## 6. 缓存策略设计

### 6.1 缓存架构

系统引入 **Redis** 作为缓存层，采用 **Cache-Aside（旁路缓存）** 模式，对素材详情查询进行缓存加速。

**分层设计**：缓存接口 `CacheService` 定义在领域层（business-domain），具体实现位于基础设施层（infrastructure），上层业务代码仅依赖抽象接口，底层缓存组件可替换，无需修改业务逻辑。

**缓存开关设计**：通过 `cache.enabled` 配置项 + 策略模式 + Spring 条件化装配，实现缓存的可插拔：

```text
CacheService（领域层接口）
    │
    ├── RedisCacheService     ← cache.enabled=true 时加载（@ConditionalOnProperty）
    │   真正操作 Redis，内置 try-catch 故障降级
    │
    └── NoOpCacheService      ← cache.enabled=false 时加载（@ConditionalOnProperty）
        所有方法空实现，服务降级为直查数据库
```

| 配置值 | 加载的实现类 | Redis 依赖 | 行为 |
|--------|------------|-----------|------|
| `cache.enabled=true` | `RedisCacheService` | 需要 Redis | 正常缓存加速，Redis 异常时自动降级 |
| `cache.enabled=false` | `NoOpCacheService` | **无需安装 Redis** | 排除 Redis 自动配置（`RedisConditionalConfig`），所有查询直达数据库 |

**设计要点**：
- **策略模式**：`CacheService` 接口定义缓存操作契约，两个实现类分别对应"启用"和"禁用"策略，Service 层通过接口调用，无需感知具体实现
- **Spring 条件化装配**：通过 `@ConditionalOnProperty` 注解，Spring 容器根据配置自动选择加载哪个实现，零代码切换
- **零依赖启动**：`cache.enabled=false` 时，`RedisConditionalConfig` 通过 `@EnableAutoConfiguration(exclude = RedisAutoConfiguration.class)` 排除 Redis 自动配置，即使环境中没有 Redis 服务也能正常启动
- **Redis 是加速层而非依赖层**：无论开关状态如何，核心业务功能始终可用

### 6.2 缓存 Key 设计

| Key 格式 | 示例 | 说明 |
|----------|------|------|
| `asset:detail:{assetId}` | `asset:detail:VID001` | 素材详情缓存，Value 为完整 `AssetDetailVO` 的 JSON 序列化字符串 |

**Key 设计规范**：
- **前缀**：统一使用 `asset:detail:` 前缀，便于按业务维度管理和批量操作
- **业务标识**：使用 `assetId`（业务唯一 ID）作为 Key 后缀，而非数据库自增 ID
- **缓存内容**：缓存完整的 `AssetDetailVO` 对象（包含标签信息），稀疏字段过滤在返回前执行，避免不同 `fields` 参数导致缓存碎片化

### 6.3 缓存过期时间（TTL）

| 参数 | 值 | 说明 |
|------|-----|------|
| **默认 TTL** | 30 分钟 | 正常素材详情的缓存过期时间 |
| **TTL 随机偏移范围** | ±5 分钟 | 实际 TTL 为 25~35 分钟之间的随机值（防雪崩） |
| **空值 TTL** | 1 分钟 | 不存在的素材 ID 的空值缓存过期时间（防穿透） |
| **延迟双删等待时间** | 500 毫秒 | 写操作后异步等待的时间，确保主从同步完成后再次删除缓存 |

### 6.4 读取流程（素材详情查询 `GET /assets/{assetId}`）

```
客户端请求 GET /assets/{assetId}
    │
    ▼
查 Redis: GET asset:detail:{assetId}
    │
    ├── 命中且值为 "@@NULL@@" → 直接返回"素材不存在"（防穿透，无需查库）
    │
    ├── 命中且为正常 JSON → 反序列化为 AssetDetailVO
    │                        → 按 fields 参数过滤字段
    │                        → 返回结果（跳过数据库）
    │
    ├── 命中但反序列化失败 → 删除该缓存 key → 走缓存未命中流程
    │
    └── 未命中 → 查 PostgreSQL 数据库
                    │
                    ├── 数据库存在 → 转换为 AssetDetailVO
                    │                → 序列化为 JSON 写入 Redis（TTL: 25~35 分钟随机）
                    │                → 按 fields 参数过滤字段 → 返回
                    │
                    └── 数据库不存在 → 缓存空值标记 "@@NULL@@"（TTL: 1 分钟）
                                      → 返回"素材不存在"
```

### 6.5 写入流程（素材创建 `POST /assets`）

采用 **延迟双删** 策略保证缓存与数据库的一致性：

```
创建请求 POST /assets
    │
    ▼
① 第一次删除缓存: DEL asset:detail:{assetId}
    │   （防止旧缓存残留）
    ▼
② 写入 PostgreSQL 数据库
    │
    ▼
③ 异步延迟双删（@Async）:
       等待 500ms → DEL asset:detail:{assetId}
       （确保数据库主从同步完成后，清除可能被并发读请求写入的旧缓存）
```

**为什么需要延迟双删**：在步骤 ① 删除缓存和步骤 ② 写入数据库之间，可能有并发读请求查到旧数据并写入缓存。步骤 ③ 的延迟删除确保这种"脏缓存"被清理。

### 6.6 缓存防护策略详解

#### 6.6.1 防缓存穿透

**问题**：恶意或异常请求大量查询不存在的 `assetId`，每次都穿透到数据库，造成数据库压力。

**方案**：空值缓存（Null Object Pattern）

- 当数据库查询结果为空时，在 Redis 中缓存一个特殊标记 `@@NULL@@`
- 后续相同 `assetId` 的请求命中该标记后，直接返回"素材不存在"，不再查库
- 空值缓存的 TTL 设为 **1 分钟**（远小于正常缓存的 30 分钟），避免数据新增后长时间无法查到

```
// 空值缓存写入
cacheService.setNull(cacheKey);  // SET asset:detail:VID999 "@@NULL@@" EX 60

// 空值判断
if (cacheService.isNullPlaceholder(cachedJson)) {
    return Result.fail("素材不存在");
}
```

#### 6.6.2 防缓存雪崩

**问题**：大量缓存 key 在同一时刻过期，导致瞬间大量请求涌入数据库。

**方案**：TTL 随机偏移（Jitter）

- 默认 TTL 为 30 分钟，在写入缓存时加上 **±5 分钟的随机偏移**
- 实际过期时间分散在 **25~35 分钟** 之间，避免集中过期

```
// TTL 计算逻辑
long jitter = ThreadLocalRandom.current().nextLong(-5, 6);  // [-5, +5] 分钟
long ttl = 30 + jitter;  // 实际 TTL: 25~35 分钟
stringRedisTemplate.opsForValue().set(key, value, ttl, TimeUnit.MINUTES);
```

#### 6.6.3 延迟双删保证一致性

**问题**：写操作后缓存与数据库数据不一致。

**方案**：延迟双删（Delayed Double Deletion）

| 步骤 | 操作 | 目的 |
|------|------|------|
| ① | `DELETE` 缓存 | 清除旧缓存，防止后续读到过期数据 |
| ② | 写入数据库 | 持久化新数据 |
| ③ | 异步等待 500ms 后再次 `DELETE` 缓存 | 清除步骤 ①~② 之间并发读请求可能写入的旧缓存 |

- 第二次删除通过 Spring `@Async` 异步执行，不阻塞主线程
- 延迟时间 500ms 是经验值，需大于一次数据库主从同步延迟 + 一次读请求耗时

#### 6.6.4 Redis 故障降级

**问题**：Redis 宕机或网络异常时，服务不应不可用。

**方案**：全链路 try-catch 降级

- `RedisCacheService` 中所有 Redis 操作（`get`、`set`、`setNull`、`delete`、`delayedDelete`）均包裹在 try-catch 中
- Redis 异常时仅打印 warn 日志，不抛出异常，服务自动降级为直查 PostgreSQL
- 保证 **Redis 是加速层而非依赖层**，Redis 不可用不影响核心功能

### 6.7 缓存配置

```yaml
spring:
  data:
    redis:
      host: localhost
      port: 6379
      database: 0
      timeout: 3000ms    # Redis 连接超时时间
```

### 6.8 缓存参数汇总

| 参数 | 值 | 定义位置 | 说明 |
|------|-----|----------|------|
| `CACHE_KEY_PREFIX` | `asset:detail:` | `AssetServiceImpl` | 素材详情缓存 Key 前缀 |
| `CACHE_KEY_UPLOADER_AVG` | `stats:uploader-avg-size` | `AssetServiceImpl` | 上传人平均文件大小统计缓存 Key |
| `CACHE_KEY_TOP_TAGS_PREFIX` | `stats:top-tags:` | `AssetServiceImpl` | 热门标签统计缓存 Key 前缀（拼接 limit 参数） |
| `CACHE_KEY_UPLOAD_TREND` | `stats:upload-trend` | `AssetServiceImpl` | 上传趋势统计缓存 Key |
| `STATS_CACHE_TTL_MINUTES` | 10 | `AssetServiceImpl` | 统计缓存过期时间（分钟） |
| `DEFAULT_TTL_MINUTES` | 30 | `RedisCacheService` | 默认缓存过期时间（分钟） |
| `TTL_JITTER_MINUTES` | 5 | `RedisCacheService` | TTL 随机偏移范围（±分钟） |
| `NULL_VALUE_TTL_MINUTES` | 1 | `RedisCacheService` | 空值缓存过期时间（分钟） |
| `DELAY_DELETE_MS` | 500 | `RedisCacheService` | 延迟双删等待时间（毫秒） |
| `NULL_PLACEHOLDER` | `@@NULL@@` | `RedisCacheService` | 空值占位标记 |

---

## 7. 架构设计

### 7.1 分层模型

系统采用经典的四层架构（接口层 → 核心层 → 领域层 → 基础设施层），各层职责明确：

```text
┌───────────────────────────────────────────────────┐
│             Controller（接口层）                     │
│  接收 HTTP 请求、参数校验、返回统一响应格式          │
└──────────────────────┬────────────────────────────┘
                       ▼
┌───────────────────────────────────────────────────┐
│             Service（核心层）                       │
│  用例编排：缓存管理、DTO↔VO 转换、字段过滤、排序解析  │
│  简单查询 → 直调 Repository                         │
│  复杂领域操作 → 委托 Manager                        │
└───────┬───────────────────────┬───────────────────┘
        │                       │
        ▼                       ▼
┌───────────────────┐   ┌───────────────────────────┐
│  Repository（领域层）│   │  Manager（领域编排层）       │
│  数据存取接口        │   │  领域内多步操作 + 事务边界    │
│  无业务逻辑          │   │  示例：createAsset          │
└───────┬───────────┘   └─────────────┬─────────────┘
        │                             │
        ▼                             ▼
┌───────────────────────────────────────────────────┐
│          Repository Impl（基础设施层）               │
│  MyBatis-Plus 数据访问、SQL 执行                     │
└───────────────────────────────────────────────────┘
```

### 7.2 分层职责规则

| 层级 | 职责 | 示例 |
|------|------|------|
| **Controller** | 参数接收、`@Valid` 校验、返回 `Result<T>` 统一响应 | `AssetController` |
| **Service** | 用例编排：缓存读写、对象转换、字段过滤、批量查询优化 | `AssetServiceImpl` |
| **Manager** | 领域内编排：多步聚合操作 + 事务边界 | `AssetManagerImpl.createAsset()` |
| **Repository** | 数据存取接口，无业务逻辑 | `AssetRepository.findPage()` |
| **Repository Impl** | MyBatis-Plus 具体实现 | `AssetRepositoryImpl` |

**Manager 存在原则**：仅在需要领域内多步操作、事务控制、领域规则时才保留。如果方法只是一行 `return repository.xxx()`，则删除该方法，Service 直调 Repository。

### 7.3 Service 与 Manager 的区别

Service 和 Manager 虽然都包含业务逻辑，但职责边界不同：

| 对比维度 | Service（核心层） | Manager（领域编排层） |
|---------|------------------|---------------------|
| **所在模块** | `core` | `business-domain` |
| **核心职责** | 用例编排：串联缓存、转换、过滤等横切关注点 | 领域编排：聚合多步数据操作 + 事务边界 |
| **是否感知缓存** | ✅ 是，负责缓存读写、防穿透、延迟双删 | ❌ 否，纯领域逻辑，不关心缓存 |
| **是否感知 VO** | ✅ 是，负责 DO/DTO → VO 转换、字段过滤 | ❌ 否，只操作 DO/DTO |
| **事务控制** | 不加事务注解 | `@Transactional`，保证多步操作的原子性 |
| **调用关系** | 调用 Manager 或直调 Repository | 只调用 Repository |

**以素材创建为例**：

```text
AssetServiceImpl.createAsset()                    ← Service 层
│  ① 构建 AssetDO、处理 metadata 序列化
│  ② 缓存启用时，先删除旧缓存（延迟双删第一步）
│  ③ 调用 Manager 写入数据库 ──────────────────→  AssetManagerImpl.createAsset()  ← Manager 层
│                                                   │  ① 插入素材记录
│                                                   │  ② 遍历标签：查找或创建标签 → 插入关联关系
│                                                   │  （以上步骤在同一个 @Transactional 事务中）
│  ④ 缓存启用时，异步延迟双删（等 500ms 再删一次）
│  ⑤ DO → VO 转换，返回结果
```

**简单查询（如分页查询）则跳过 Manager，Service 直调 Repository**：

```text
AssetServiceImpl.queryAssetPage()                 ← Service 层
│  ① 解析排序参数（白名单校验）
│  ② 构建查询条件
│  ③ 直调 assetRepository.findPage()  ──────────→  AssetRepository（无需 Manager）
│  ④ 批量查询标签
│  ⑤ DO → VO 转换、字段过滤
│  ⑥ 返回分页结果
```

**设计原则**：Manager 不是必须的中间层，而是按需存在。只有当操作涉及多步数据写入且需要事务保证时，才通过 Manager 编排；单步查询由 Service 直达 Repository，避免无意义的转发。

---

## 8. 方案局限性与改进方向

### 8.1 当前局限

1. **全文搜索能力有限**：PostgreSQL 的全文搜索不如 ElasticSearch 强大，标题/描述的模糊查询性能受限
2. **水平扩展瓶颈**：单机 PostgreSQL 在数据量超过千万级时可能遇到性能瓶颈
3. **标签查询效率**：多标签联合查询需要 JOIN 操作，复杂标签过滤性能待优化


### 8.2 后续改进方向

1. **分布式锁**：扩展素材修改/编辑功能时，引入 Redis 分布式锁（如 Redisson）防止并发修改同一素材导致数据覆盖，可复用现有 Redis 基础设施，锁粒度为 `asset:lock:{assetId}`
2. **混合架构**：引入 ElasticSearch 作为搜索补充，实现 PG + ES 双写架构
3. **读写分离**：配置主从复制，将统计查询路由到只读副本
4. **分区表**：按时间分区存储素材数据，优化历史数据查询

### 8.3 ElasticSearch 混合架构扩展方案

当前系统采用 **Repository 接口与实现分离** 的架构设计（依赖倒置原则），天然支持引入 ElasticSearch 作为搜索补充，无需重构现有代码。

**现有架构基础**：

```text
AssetService（core 层）
    │  只依赖接口
    ▼
AssetRepository（domain 层）        ← 接口定义
    │  实现
    ▼
AssetRepositoryImpl（infrastructure 层）  ← 当前：MyBatis-Plus + PostgreSQL
```

**引入 ES 后的架构**：

```text
AssetService（core 层）
    │  根据查询类型路由
    ├──────────────────────────┐
    ▼                          ▼
AssetRepository               AssetSearchRepository（新增接口）
    │                              │
    ▼                              ▼
AssetRepositoryImpl            AssetEsRepositoryImpl（新增实现）
（PostgreSQL：写入 + 统计）     （ElasticSearch：全文搜索 + 列表查询）
```

**扩展步骤**：

| 步骤 | 操作 | 改动范围 |
|------|------|---------|
| 1 | 添加 `spring-data-elasticsearch` 依赖 | `infrastructure/pom.xml` |
| 2 | 在 domain 层新增 `AssetSearchRepository` 搜索接口 | domain 层（新增文件） |
| 3 | 在 infrastructure 层新增 `AssetEsRepositoryImpl` 实现 | infrastructure 层（新增文件） |
| 4 | 在 `AssetManagerImpl.createAsset()` 中增加 ES 同步写入 | Manager 层（小改动） |
| 5 | Service 层按查询类型路由：列表/搜索走 ES，统计/详情走 PG | Service 层（小改动） |

**关键设计优势**：
- **上层无感知**：`AssetService` 仅依赖接口，不关心底层是 PG 还是 ES
- **渐进式迁移**：可以先将列表查询迁移到 ES，统计查询仍走 PG，逐步过渡
- **现有代码零改动**：新增 ES 实现不影响已有的 PostgreSQL 查询逻辑
- **与缓存策略兼容**：现有的 Redis 缓存层（`CacheService` 接口 + 条件化加载）可继续复用

---

## 9. 总结

本方案选择 PostgreSQL 作为核心数据库，基于其强大的 SQL 支持、JSONB 灵活性和成熟生态，能够满足视频素材存储与查询的核心需求。同时引入 Redis 作为缓存层，通过 Cache-Aside 模式加速素材详情与统计查询，并内置防穿透（空值缓存）、防雪崩（TTL 随机偏移）、延迟双删等策略保障缓存可靠性。架构上采用四层模型，Manager 层仅保留领域编排职责，简单查询由 Service 直调 Repository，分层清晰且无冗余转发。Schema 设计兼顾规范化与查询性能，API 设计遵循 RESTful 原则，支持灵活的过滤和排序。虽然在全文搜索和水平扩展方面存在一定局限，但通过合理的索引策略、缓存优化和未来的架构演进，可以支撑业务的持续发展。
