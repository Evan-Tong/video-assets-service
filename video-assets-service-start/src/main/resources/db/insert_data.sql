-- ============================================
-- Data Import SQL for Video Assets System
-- Generated from embedded Excel workbooks in doc
-- ============================================

BEGIN;

-- ============================================
-- 插入素材数据
-- ============================================

INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0001', '素材_001_冬季', '李四', '2024-09-05 00:00:00', 66857205, 'pending', '{"reviewer": null, "city": "上海", "notes": "背景音乐问题", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0002', '素材_002_夏日', '赵六', '2024-06-12 00:00:00', 69614960, 'pending', '{"reviewer": null, "city": "武汉", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0003', '素材_003_新品', '陈七', '2024-06-23 00:00:00', 212860928, 'rejected', '{"reviewer": "周九", "city": "广州", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0004', '素材_004_新品', '张三', '2024-10-23 00:00:00', 111379742, 'approved', '{"reviewer": "刘八", "city": "西安", "notes": "背景音乐问题", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0005', '素材_005_夏日', '张三', '2024-02-18 00:00:00', 97874083, 'approved', '{"reviewer": "赵六", "city": "深圳", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0006', '素材_006_新品', '王五', '2024-01-31 00:00:00', 552148664, 'pending', '{"reviewer": null, "city": "成都", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0007', '素材_007_冬季', '王五', '2024-03-22 00:00:00', 206401699, 'rejected', '{"reviewer": "王五", "city": "西安", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0008', '素材_008_冬季', '张三', '2024-04-14 00:00:00', 449304330, 'rejected', '{"reviewer": "张三", "city": "成都", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0009', '素材_009_限定', '周九', '2024-04-13 00:00:00', 174105559, 'pending', '{"reviewer": null, "city": "西安", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0010', '素材_010_限定', '周九', '2024-04-12 00:00:00', 194668134, 'pending', '{"reviewer": null, "city": "成都", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0011', '素材_011_冬季', '周九', '2024-02-23 00:00:00', 337043783, 'rejected', '{"reviewer": "王五", "city": "上海", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0012', '素材_012_新品', '刘八', '2024-05-28 00:00:00', 626912133, 'rejected', '{"reviewer": "李四", "city": "上海", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0013', '素材_013_夏日', '陈七', '2024-06-17 00:00:00', 314100940, 'pending', '{"reviewer": null, "city": "深圳", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0014', '素材_014_限定', '张三', '2024-05-25 00:00:00', 363499356, 'pending', '{"reviewer": null, "city": "上海", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0015', '素材_015_限定', '李四', '2024-12-07 00:00:00', 190526259, 'approved', '{"reviewer": "李四", "city": "广州", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0016', '素材_016_冬季', '赵六', '2024-09-13 00:00:00', 598495723, 'approved', '{"reviewer": "周九", "city": "杭州", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0017', '素材_017_夏日', '刘八', '2024-09-17 00:00:00', 267785338, 'rejected', '{"reviewer": "赵六", "city": "北京", "notes": "背景音乐问题", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0018', '素材_018_夏日', '赵六', '2024-08-03 00:00:00', 391789936, 'pending', '{"reviewer": null, "city": "上海", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0019', '素材_019_冬季', '王五', '2024-11-29 00:00:00', 93291806, 'approved', '{"reviewer": "吴十", "city": "西安", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0020', '素材_020_限定', '刘八', '2024-10-31 00:00:00', 518122373, 'approved', '{"reviewer": "李四", "city": "武汉", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0021', '素材_021_夏日', '赵六', '2024-06-30 00:00:00', 83665879, 'rejected', '{"reviewer": "刘八", "city": "深圳", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0022', '素材_022_冬季', '李四', '2024-07-27 00:00:00', 133274009, 'approved', '{"reviewer": "吴十", "city": "西安", "notes": "背景音乐问题", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0023', '素材_023_冬季', '周九', '2024-02-08 00:00:00', 428532039, 'pending', '{"reviewer": null, "city": "西安", "notes": "重新剪辑", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0024', '素材_024_限定', '陈七', '2024-03-24 00:00:00', 572879011, 'approved', '{"reviewer": "张三", "city": "西安", "notes": null, "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('A0025', '素材_025_冬季', '张三', '2024-06-13 00:00:00', 604525035, 'rejected', '{"reviewer": "陈七", "city": "北京", "notes": "字幕缺失", "source": "dataset_a"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_001', 'creative_001', '王五', '2024-05-01 19:00:31', 106268720, 'pending', '{"city": "北京", "spend": "N/A", "platform": "千川", "resolution": "720x1280", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_002', 'creative_002', '赵六', '2024-01-27 14:39:54', 125401220, 'rejected', '{"city": "北京", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_003', 'creative_003', '刘八', '2024-09-12 07:09:43', 613762469, 'rejected', '{"city": "深圳", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_004', 'creative_004', '李四', '2024-02-20 19:52:26', 374548208, 'rejected', '{"city": "北京", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_005', 'creative_005', '李四', '2024-01-29 10:50:21', 281301498, 'rejected', '{"city": "深圳", "spend": "N/A", "platform": "千川", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_006', 'creative_006', '李四', '2024-03-02 06:18:25', 377254105, 'approved', '{"city": "广州", "spend": 14968.94, "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_007', 'creative_007', '赵六', '2024-12-11 12:43:24', 219339722, 'pending', '{"city": "成都", "spend": "N/A", "platform": "巨量引擎", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_008', 'creative_008', '陈七', '2024-07-15 06:45:13', 322068188, 'approved', '{"city": "北京", "spend": 31714.22, "platform": "千川", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_009', 'creative_009', '周九', '2024-10-26 11:21:07', 333701127, 'pending', '{"city": "北京", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_010', 'creative_010', '王五', '2024-12-08 23:08:53', 212474622, 'rejected', '{"city": "武汉", "spend": "N/A", "platform": "巨量引擎", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_006', 'creative_011', '李四', '2024-04-29 17:10:33', 95265593, 'approved', '{"city": "成都", "spend": 12476.49, "platform": "千川", "resolution": "720x1280", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_012', 'creative_012', '张三', '2024-12-25 12:44:39', 226913741, 'pending', '{"city": "广州", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_013', 'creative_013', '李四', '2024-11-07 13:22:24', 318896344, 'rejected', '{"city": "武汉", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_014', 'creative_014', '赵六', '2024-03-27 09:13:57', 546675637, 'pending', '{"city": "深圳", "spend": "N/A", "platform": "千川", "resolution": "720x1280", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_015', 'creative_015', '周九', '2024-06-03 17:58:19', 351576554, 'approved', '{"city": "成都", "spend": 17557.31, "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_016', 'creative_016', '刘八', '2024-12-06 14:35:25', 244164534, 'approved', '{"city": "成都", "spend": 29828.56, "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_017', 'creative_017', '周九', '2024-05-29 14:16:53', 256524331, 'rejected', '{"city": "北京", "spend": "N/A", "platform": "巨量引擎", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_018', 'creative_018', '陈七', '2024-06-16 11:58:59', 406978387, 'pending', '{"city": "杭州", "spend": "N/A", "platform": "千川", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_019', 'creative_019', '周九', '2024-06-05 06:38:36', 369886152, 'rejected', '{"city": "广州", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_020', 'creative_020', '刘八', '2024-07-31 19:08:41', 378712045, 'pending', '{"city": "西安", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_016', 'creative_021', '李四', '2024-09-19 09:18:08', 601297699, 'pending', '{"city": "杭州", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_022', 'creative_022', '王五', '2024-11-13 20:15:34', 385739161, 'pending', '{"city": "北京", "spend": "N/A", "platform": "千川", "resolution": "720x1280", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_023', 'creative_023', '赵六', '2024-07-03 12:35:30', 130627516, 'rejected', '{"city": "武汉", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_024', 'creative_024', '赵六', '2024-04-04 18:05:59', 58382497, 'pending', '{"city": "广州", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_025', 'creative_025', '吴十', '2024-08-04 11:23:54', 182736605, 'pending', '{"city": "成都", "spend": "N/A", "platform": "千川", "resolution": "1080x1920", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_026', 'creative_026', '吴十', '2024-11-18 13:27:56', 531224889, 'rejected', '{"city": "杭州", "spend": "N/A", "platform": "巨量引擎", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('asset_027', 'creative_027', '李四', '2024-10-24 09:54:03', 572760886, 'rejected', '{"city": "杭州", "spend": "N/A", "platform": "巨量引擎", "resolution": "NULL", "source": "dataset_b"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0001', '投放素材001', '赵六', '2024-05-10 18:19:33', 567489331, 'pending', '{"city": "深圳", "duration_sec": 26.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0002', '投放素材002', '周九', '2024-06-07 15:06:05', 365323878, 'pending', '{"city": "北京", "duration_sec": 157.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0003', '投放素材003', '赵六', '2024-07-04 13:46:24', 582144, 'approved', '{"city": "西安", "duration_sec": 17.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0004', '投放素材004', '王五', '2024-05-10 20:57:15', 444071936, '通过', '{"city": "武汉", "duration_sec": 161.0, "platform": "千川", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0005', '投放素材005', '陈七', '2024-02-02 22:26:49', 299578163, '通过', '{"city": "成都", "duration_sec": 96.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0006', '投放素材006', '张三', '2024-04-18 09:32:22', 197866291, 'PENDING', '{"city": "上海", "duration_sec": 176.0, "platform": "千川", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0007', '投放素材007', '赵六', '2024-10-20 05:57:46', 600100044, 'approved', '{"city": "未知", "duration_sec": 65.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0008', 'Untitled_vid0008', '陈七', '2024-09-28 23:29:09', 494718156, 'Reject', '{"city": "杭州", "duration_sec": 157.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0009', '投放素材009', '李四', '2024-06-03 09:05:14', 96259276, 'rejected', '{"city": "北京", "duration_sec": 98.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0010', '投放素材010', '吴十', '2024-09-14 05:49:32', 90009, 'pending', '{"city": "西安", "duration_sec": 49.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0011', '投放素材011', '陈七', '2024-03-09 17:42:55', 594944, '已通过', '{"city": "上海", "duration_sec": 81.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0012', '投放素材012', '刘八', '2024-04-05 00:58:19', 381052518, '待审核', '{"city": "杭州", "duration_sec": 97.0, "platform": null, "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0013', '投放素材013', '李四', '2024-12-08 05:10:36', 446156, '已拒绝', '{"city": null, "duration_sec": 71.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0014', '投放素材014', '赵六', '2024-09-08 04:15:04', 310902784, '待审核', '{"city": "未知", "duration_sec": 104.0, "platform": "qianchuan", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0015', 'Untitled_vid0015', '陈七', '2024-08-03 06:44:30', 244838, '已通过', '{"city": "深圳", "duration_sec": 90.0, "platform": "千川", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0016', '投放素材016', '吴十', '2024-10-15 20:09:12', 600834048, '已通过', '{"city": null, "duration_sec": 162.0, "platform": null, "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0017', 'Untitled_vid0017', '张三', '2024-02-09 08:58:16', 218009, 'rejected', '{"city": "北京", "duration_sec": 23.0, "platform": null, "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0018', '投放素材018', '陈七', '2024-09-28 04:24:04', 420269260, 'APPROVED', '{"city": "广州", "duration_sec": 23.0, "platform": null, "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0019', '投放素材019', '张三', '2024-11-30 23:50:24', 118174515, '待审核', '{"city": "杭州", "duration_sec": 31.0, "platform": "巨量引擎", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0020', '投放素材020', '陈七', '2024-02-16 08:02:54', 493250150, '已通过', '{"city": "杭州", "duration_sec": 155.0, "platform": "千川", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0021', '投放素材021', '李四', '2024-08-25 02:10:18', 598946611, 'Approved', '{"city": "上海", "duration_sec": 50.0, "platform": "千川", "source": "dataset_c"}');
INSERT INTO assets (asset_id, title, uploader, uploaded_at, file_size, status, metadata)
VALUES ('vid0022', '投放素材022', '陈七', '2024-06-07 23:39:35', 450048819, '待审核', '{"city": "西安", "duration_sec": 28.0, "platform": "巨量引擎", "source": "dataset_c"}');

-- ============================================
-- 插入标签数据
-- ============================================

INSERT INTO tags (name) VALUES ('促销') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('剧情') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('品牌') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('搞笑') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('测评') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('生活') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('种草') ON CONFLICT (name) DO NOTHING;
INSERT INTO tags (name) VALUES ('节日') ON CONFLICT (name) DO NOTHING;

-- ============================================
-- 插入素材标签关联
-- ============================================

DO $$
DECLARE
    v_asset_id INTEGER;
    v_tag_id INTEGER;
BEGIN
    -- 遍历所有素材建立标签关联
    FOR v_asset_id_val IN SELECT id, asset_id FROM assets LOOP
        CASE v_asset_id_val.asset_id
            WHEN 'A0001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0002' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0003' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0008' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0009' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0009' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0009' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0011' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0015' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0016' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0018' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0022' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0023' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0023' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0023' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0024' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0025' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0025' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'A0025' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_002' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_002' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_002' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_003' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_003' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_008' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_009' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_015' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_016' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_016' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_018' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_018' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_018' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_022' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_023' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_023' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_024' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_025' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_025' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_026' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_027' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_027' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'asset_027' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0001' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0002' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0003' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0003' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0004' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0005' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0006' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0007' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0008' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0008' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0008' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0009' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0010' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0011' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0011' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0011' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0012' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0013' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0014' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0015' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0015' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0016' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0017' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '搞笑';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0018' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0019' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '测评';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0020' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '生活';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '节日';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '品牌';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0021' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '剧情';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0022' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '种草';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            WHEN 'vid0022' THEN
                SELECT id INTO v_tag_id FROM tags WHERE name = '促销';
                IF v_tag_id IS NOT NULL THEN
                    INSERT INTO asset_tags (asset_id, tag_id) VALUES (v_asset_id_val.id, v_tag_id) ON CONFLICT DO NOTHING;
                END IF;
            ELSE NULL;
        END CASE;
    END LOOP;
END $$;

COMMIT;

-- 导入完成! 共导入 74 条素材, 8 个标签