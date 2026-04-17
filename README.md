# video-assets-service

视频素材数据存储与查询服务，支持多数据源的统一存储、灵活的查询过滤、以及高效的统计聚合能力。

## 技术栈

- **Java 17** + **Spring Boot 3.2.5**
- **PostgreSQL** — 主数据库，支持 JSONB 半结构化数据
- **Redis** — 缓存层，用于素材详情与统计缓存，内置防穿透、防雪崩、延迟双删策略
- **MyBatis-Plus 3.5.6** — ORM 框架，统计查询使用原生 SQL（XML Mapper）
- **MapStruct 1.5.5** — 对象转换
- **Knife4j 4.4.0** — API 文档（基于 OpenAPI 3）
- **Lombok** — 简化代码

> 📖 **技术选型详细说明**：关于为什么选择 PostgreSQL 而非 ElasticSearch、Redis 缓存策略设计、数据库 Schema 设计决策、索引策略等详细分析，请参阅 [技术设计决策文档](design.md)。

## 工程结构

```
video-assets-service/
├── pom.xml                                    # 父 POM，统一依赖管理
├── video-assets-service-start/                # 启动模块 - SpringBoot 启动入口
│   ├── pom.xml
│   └── src/main/
│       ├── java/.../VideoAssetsApplication.java
│       └── resources/
│           ├── application.yml                # 应用配置
│           ├── logback-spring.xml             # 日志配置
│           └── db/init.sql                    # 数据库初始化脚本
├── video-assets-service-api/                  # API 层 - Controller、服务接口、VO、Request
│   ├── pom.xml
│   └── src/main/java/.../api/
│       ├── controller/                        # REST Controller
│       ├── service/                           # 服务接口定义
│       ├── vo/                                # 视图对象（VO）
│       └── request/                           # 请求参数
├── video-assets-service-core/                 # 核心业务层 - 服务实现、对象转换
│   ├── pom.xml
│   └── src/main/java/.../core/
│       ├── service/impl/                      # 服务实现
│       ├── convert/                           # 对象转换器（MapStruct）
│       ├── util/                              # 工具类
│       └── handle/                            # 全局异常处理
├── video-assets-service-business-domain/      # 领域层 - DO、DTO、Repository 接口、缓存接口
│   ├── pom.xml
│   └── src/main/java/.../domain/
│       ├── dataobject/                        # 数据对象（DO）
│       ├── dto/                               # 数据传输对象（DTO）
│       ├── repository/                        # Repository 接口
│       ├── cache/                             # 缓存服务接口（CacheService）
│       ├── manager/                           # Manager（领域编排，仅保留有业务价值的方法）
│       ├── constants/                         # 常量
│       └── util/                              # 工具类
├── video-assets-service-infrastructure/       # 基础设施层 - Mapper、Repository 实现、缓存实现
│   ├── pom.xml
│   └── src/main/
│       ├── java/.../infrastructure/
│       │   ├── mapper/                        # MyBatis Mapper 接口
│       │   ├── cache/                         # 缓存实现（RedisCacheService）
│       │   └── repository/impl/              # Repository 实现
│       └── resources/mapper/                  # MyBatis XML（原生 SQL）
└── video-assets-service-shared-model/         # 共享模型 - 通用实体、常量
    ├── pom.xml
    └── src/main/java/.../shared/
        ├── entity/                            # 通用实体（Result、PageResult）
        ├── request/                           # 通用请求基类
        └── constants/                         # 通用常量
```

### 分层依赖关系

```
┌─────────────────────────────────────────────────────────┐
│                    start（启动层）                        │
│  依赖: api, core, infrastructure                        │
└────────────────────────┬────────────────────────────────┘
                         │
        ┌────────────────┼────────────────┐
        ▼                ▼                ▼
┌──────────────┐ ┌──────────────┐ ┌────────────────────┐
│  api（接口层） │ │ core（核心层） │ │infrastructure（基础│
│              │ │              │ │    设施层）         │
│ 依赖: core,  │ │ 依赖:        │ │ 依赖:              │
│  shared-model│ │  api,        │ │  business-domain   │
│              │ │  business-   │ │                    │
│              │ │  domain      │ │                    │
└──────┬───────┘ └──────┬───────┘ └─────────┬──────────┘
       │                │                    │
       ▼                ▼                    ▼
┌──────────────────────────────────┐ ┌────────────────────┐
│        shared-model              │ │  business-domain   │
│       （共享模型层）               │ │   （领域层）        │
│                                  │ │                    │
│  无外部模块依赖                    │ │ 依赖: shared-model │
└──────────────────────────────────┘ └─────────┬──────────┘
                                               │
                                               ▼
                                    ┌────────────────────┐
                                    │    shared-model     │
                                    └────────────────────┘
```

**依赖方向说明**（严格自上而下，禁止反向依赖）：

| 层级 | 模块 | 职责 | 依赖 |
|------|------|------|------|
| 启动层 | `start` | SpringBoot 启动入口、配置文件 | api, core, infrastructure |
| 接口层 | `api` | Controller、服务接口、VO、Request | core, shared-model |
| 核心层 | `core` | 服务实现、DTO↔VO 转换、异常处理、缓存编排 | api, business-domain |
| 领域层 | `business-domain` | DO、DTO、Repository 接口、缓存接口、Manager（领域编排） | shared-model |
| 基础设施层 | `infrastructure` | Mapper、Repository 实现、缓存实现、SQL | business-domain |
| 共享模型层 | `shared-model` | Result、PageResult 等通用实体 | 无 |

## 快速启动

### 环境要求

- **JDK 17+**
- **Maven 3.8+**
- **PostgreSQL 14+**
- **Redis 6.0+**

### 1. 初始化数据库

```bash
# 创建数据库
createdb -U postgres video_assets

# 执行初始化脚本
psql -U postgres -d video_assets -f video-assets-service-start/src/main/resources/db/init.sql
```

### 2. 修改配置

编辑 `video-assets-service-start/src/main/resources/application.yml`，修改数据库和 Redis 连接信息：

```yaml
spring:
  data:
    redis:
      host: localhost
      port: 6379
      database: 0
      timeout: 3000ms
  datasource:
    url: jdbc:postgresql://localhost:5432/video_assets
    username: your_username
    password: your_password
```

### 3. 编译 & 启动

```bash
# 编译项目
mvn clean install -DskipTests

# 启动服务
cd video-assets-service-start
mvn spring-boot:run
```

服务启动后默认监听 **8080** 端口。

## API 接口

### 基础查询

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | `/assets` | 分页查询素材列表，支持过滤、排序 |
| GET | `/assets/{assetId}` | 查询素材详情 |

### 统计查询

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | `/assets/stats/uploader-avg-size` | 各上传人平均文件大小（已审核素材） |
| GET | `/assets/stats/top-tags?limit=5` | 热门标签统计（默认 Top 5） |
| GET | `/assets/stats/upload-trend` | 近 30 天上传趋势分析 |

### API 文档

启动服务后访问：

- **Knife4j UI**（推荐）：[http://localhost:8080/doc.html](http://localhost:8080/doc.html)
- **Swagger UI**：[http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)

## 查询参数说明

### 分页查询 `GET /assets`

| 参数 | 类型 | 说明 |
|------|------|------|
| `status` | String | 审核状态过滤（如 `approved`） |
| `uploader` | String | 上传人过滤 |
| `fileSizeMin` | Long | 文件大小下限（字节） |
| `fileSizeMax` | Long | 文件大小上限（字节） |
| `uploadedAtStart` | String | 上传时间起始 |
| `uploadedAtEnd` | String | 上传时间截止 |
| `pageNum` | Integer | 页码（默认 1） |
| `pageSize` | Integer | 每页条数（默认 10） |
| `sort` | String | 排序规则，格式：`字段名:排序方向`，多个用逗号分隔。示例：`uploaded_at:desc,file_size:asc`。支持的排序字段：`uploaded_at`、`file_size`、`title`、`status`、`uploader` |
| `fields` | String | 稀疏字段集，逗号分隔的字段名，仅返回指定字段（`assetId` 始终保留）。示例：`title,status,uploader` |

### 素材详情 `GET /assets/{assetId}`

| 参数 | 类型 | 说明 |
|------|------|------|
| `fields` | String | 稀疏字段集，逗号分隔的字段名，仅返回指定字段（`assetId` 始终保留）。示例：`title,status,uploader` |

### 稀疏字段集示例

请求：
```
GET /assets/VID001?fields=title,status,uploader
```

响应（未指定的字段不会出现在 JSON 中）：
```json
{
  "code": 200,
  "data": {
    "assetId": "VID001",
    "title": "春季新品发布会",
    "status": "approved",
    "uploader": "张三"
  }
}
```
