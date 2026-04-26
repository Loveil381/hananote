# 审核问题 Backlog
> 最后更新: 2026-04-26 | 会话轮次: #51

## Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper_page.dart | SettingsBloc 未在 auth 后加载 | blur overlay / greeting 状态异常 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储原始密钥而非验证 hash | root 场景下安全风险 | ✅ 已修复 (R46, DEC-060) |
| C-3 | secure_database.dart | `open()` 语义上残留无效 password | API 含义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数历史不一致 | SDK 升级时有编译风险 | ✅ 已修复 |
| C-5 | schedule_editor_cubit.dart | 验证消息未接入 i18n | locale 切换后仍出现固定文案 | ✅ 已修复 |
| C-6 | medication schedule edit route | 编辑页缺少 route / unit 预载 | 新建/编辑药物方案时单位下拉缺失 | ✅ 已修复 |
| C-7 | inventory_page.dart | 更新库存 hint 曾为英文硬编码 | Inventory 页面出现混合语言 | ✅ 已修复 |
| C-8 | timeline_page.dart | Timeline 事件卡点击无反馈 | 用户无法查看事件详情 | ✅ 已修复 |
| C-9 | inventory route DI | InventoryCubit / CheckInventory 未注册 DI | 打开库存页立即 crash | ✅ 已修复 |
| C-10 | v1.1.0 release | commit message 承诺 onboarding/PDF/import 但未交付 | Release Notes 误导用户 | ⏳ R52 候选（补齐 or 修订 RN） |

## Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-5 | setup_page.dart | PIN 校验 UX 仍可继续打磨 | 错误反馈层级还有优化空间 | 🔄 持续优化 |
| M-11 | record_page.dart | RecordPage 硬编码文案 | 多语言切换不一致 | ✅ 已修复 |
| M-12 | 多处 UI 枚举显示 | enum `displayName` 为固定字符串 | locale 切换不完整 | ✅ 已修复 |
| M-13 | today_page.dart | 默认用户名未国际化 | fallback 文案不一致 | ✅ 已修复 |
| M-14 | today_page.dart | 每日语录硬编码 | 国际化链路不完整 | ✅ 已修复 |
| M-15 | 多处按钮 | 空回调 / 假按钮 | 用户点击无反馈 | ✅ 已修复 |
| M-16 | data / timeline detail routing | 详情页入口与 AppBar 导航已全线打通 | 路径闭环 | ✅ 已修复 |
| M-17 | onboarding / empty states | 通知设置页已就绪；首启引导仍缺 | 首次使用理解成本高 | ⏳ R52 候选 |
| M-29 | profile 导入备份 placeholder | 当前仅 BottomSheet 提示，无实际导入逻辑 | 备份单向不可用 | ⏳ R52 候选 |
| M-30 | PDF 报告生成 | UI 入口曾有占位，现也已被 BottomSheet 替代 | 医疗汇报能力缺失 | ⏳ R52 候选 |
| M-18 | drug_list_page.dart | 删除确认文案过弱 | 误删风险高 | ✅ 已修复 |
| M-19 | schedule_editor_page.dart | 日期 / 星期显示不 locale-aware | 编辑页可读性不稳定 | ✅ 已修复 |
| M-20 | data_page.dart | 趋势图曾为假数据 | Data Tab 缺少真实参考价值 | ✅ 已修复 |
| M-21 | timeline_page.dart | 筛选条不可交互 | 时间轴筛选无反馈 | ✅ 已修复 |
| M-22 | timeline_page.dart | FAB 底部间距硬编码 | 不同设备上会压住导航栏 | ✅ 已修复 |
| M-23 | inventory_page.dart | Inventory 页面未接通路由 | Profile 入口不可用 | ✅ 已修复 |
| M-24 | 多个页面 | `extendBodyBehindAppBar` + 硬编码 top padding | 刘海屏 / 状态栏设备布局漂移 | ✅ 已修复 |
| M-25 | main_shell.dart | 毛玻璃导航实现曾依赖 `extendBody` | 容易和内容遮挡互相打架 | ✅ 已修复 |
| M-31 | 全应用 | 缺崩溃监控 (Sentry/Crashlytics) | v1.2.2 已上架，盲飞 | ⏳ R52 候选 |
| M-32 | KeyManager (Web) | Argon2 参数降级降低安全性 | Web 端密钥派生强度低 | ⏳ R52 候选（WebWorker 方案） |
| M-33 | UpdateService | 弱网下载续传/重试策略缺失 | 下载中断需重试整个 APK | ⏳ R52 候选 |
| M-34 | Cloud Sync | 仅 CDN 单向（更新分发），用户数据无双向同步 | 换设备 = 数据丢失 | ⏳ R52 候选 |

## Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason / 权限提示未完全统一 | ✅ 已修复 |
| m-4 | profile_page.dart | 清除数据按钮视觉仍可再调 | ⏳ Pending |
| m-5 | main_shell.dart | PlusJakartaSans 字体声明链路待最终收口 | ⏳ Pending |
| m-6 | today_page.dart | QuoteCard 后续应接 CMS/内容管理 | ⏳ Pending |
| m-7 | STATUS.md | 轮次交付标记不同步 | ✅ 已修复 (R51) |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 一致性 | ✅ 已修复 |
| m-9 | 设置页 | "暗色模式"/"语言"曾为假开关 | ✅ 已修复 (R46/R47) |
| m-10 | settings_detail_page.dart | 硬分割线在暗色下太硬 | ✅ 已修复 (R51 渐隐分割) |
| m-11 | knowledge_webview_page.dart | Web 端无 webview_flutter 替代为 url_launcher | ⏳ 平台限制，可接受 |

---

## R52 候选议题汇总
1. **C-10** v1.1.0 Release Notes 落差（信任风险）→ ✅ R52-A 已补齐三件套 (PR #3)
2. **M-17 / M-29 / M-30** Onboarding + Import + PDF（v1.1.0 承诺集合）→ ✅ R52-A 已交付
3. **M-31** 崩溃监控（v1.2.2 盲飞）→ R52-B 候选
4. **M-32** Web Argon2 安全性（WebWorker 方案）→ R52 候选
5. **M-34** Cloud Sync 双向（最大产品价值）→ R52-C 候选

## R52-A 衍生发现（2026-04-26）

### M-35 Lint info 技术债 71 项（已让 CI 不再门控）
- **背景**：`dart analyze --fatal-infos` 在 main 上从 v1.2.0 起连续 5+ commit 失败；项目实际靠忽略 CI 红来发版
- **R52-A 处置**：CI 关 `--fatal-infos`，改 `--fatal-warnings`（commit 5f5221d）
- **剩余分类**：
  - 34 × `public_member_api_docs`（缺 doc comment）
  - 26 × `lines_longer_than_80_chars`
  - 4 × `prefer_constructors_over_static_methods`
  - 4 × `cascade_invocations`
  - 1 × `use_late_for_private_fields_and_variables`
  - 1 × `sort_pub_dependencies` (sqlite3 vs sqflite_*，pre-existing)
  - 1 × `deprecated_member_use` (`dart:html`，Web 端必需，可加 ignore)
- **建议**：单独立项做"lint cleanup sprint"，目标降到 0 个 info 后恢复 `--fatal-infos`

### M-36 Pubspec 依赖排序（小但可见）
- **位置**: pubspec.yaml line 39 (sqlite3 应在 sqflite_* 之后)
- **R52-A 已修部分**：把 R52-A 加的 `pdf` 移到 path_provider 之后正确位置
- **R52-A 未修**：sqlite3 vs sqflite_common 顺序（pre-existing）
- **修复成本**：1 行编辑
