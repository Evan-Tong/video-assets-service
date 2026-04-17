-- 素材主表
CREATE TABLE IF NOT EXISTS assets (
    id SERIAL PRIMARY KEY,
    asset_id VARCHAR(64) UNIQUE NOT NULL,
    title VARCHAR(500) NOT NULL,
    description TEXT,
    file_url VARCHAR(1000),
    file_size BIGINT,
    file_format VARCHAR(20),
    status VARCHAR(20) DEFAULT 'pending',
    uploader VARCHAR(100) NOT NULL,
    uploaded_at TIMESTAMPTZ DEFAULT NOW(),
    metadata JSONB DEFAULT '{}'
);

-- 标签表
CREATE TABLE IF NOT EXISTS tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- 素材标签关联表
CREATE TABLE IF NOT EXISTS asset_tags (
    asset_id INTEGER REFERENCES assets(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (asset_id, tag_id)
);

-- 索引
CREATE INDEX IF NOT EXISTS idx_assets_status ON assets(status);
CREATE INDEX IF NOT EXISTS idx_assets_uploader ON assets(uploader);
CREATE INDEX IF NOT EXISTS idx_assets_uploaded_at ON assets(uploaded_at);
CREATE INDEX IF NOT EXISTS idx_assets_file_size ON assets(file_size);
CREATE INDEX IF NOT EXISTS idx_assets_asset_id ON assets(asset_id);

-- 注意：metadata 字段的 GIN 索引（idx_assets_metadata）暂未创建。
-- 当前无基于 metadata 的 JSONB 查询需求，GIN 索引会增加写入开销（每次 INSERT/UPDATE 需拆解 JSONB 键值对并更新倒排索引）。
-- 后续如有 metadata 查询需求（如 metadata @> '{"city":"上海"}'），可执行：
-- CREATE INDEX IF NOT EXISTS idx_assets_metadata ON assets USING GIN(metadata);
