# 审核问题 Backlog
> 最后更新: 2026-03-29 | 会话轮次: #39

## Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper_page.dart | SettingsBloc 未在 auth 后加载 | blur overlay / greeting 状态异常 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | root 场景下存在额外密钥暴露风险 | ⏳ R36+ |
| C-3 | secure_database.dart | `open()` 的 password 参数被忽略 | API 语义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数使用不一致 | SDK 升级时易产生警告或编译问题 | ✅ 已修复 |
| C-5 | schedule_editor_cubit.dart | 验证消息硬编码英文 | 表单错误提示无法跟随语言切换 | ✅ 已修复 |
| C-6 | medication schedule edit route | 编辑场景的 initEdit 仍依赖额外数据流 | 路由直达编辑页时初始化不够稳定 | ⏳ R40 |

## Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-5 | setup_page.dart | PIN 校验反馈仍有进一步打磨空间 | 极端键盘场景下可读性仍可优化 | 🔄 R35 后续 |
| M-11 | record_page.dart | RecordPage 存在硬编码文案 | 多语言切换不完整 | ✅ 已修复 |
| M-12 | 多个 UI 页面 | enum `displayName` 为硬编码中文 | UI 层无法正确本地化 | ✅ 已修复 |
| M-13 | today_page.dart | 默认用户名为硬编码文案 | fallback 文案不随语言切换 | ✅ 已修复 |
| M-14 | today_page.dart | 每日语录为硬编码中文 | 英文/日文环境体验割裂 | ✅ 已修复 |
| M-15 | 多个页面 | 空回调按钮没有用户反馈 | 造成“按钮失效”的错误感知 | ✅ 已修复 |
| M-16 | data / timeline detail routing | 历史记录与详情流仍有占位跳转 | 深层操作路径不完整 | ⏳ Pending |
| M-17 | onboarding / empty states | 首次使用引导与 CTA 仍然偏弱 | 新用户上手成本偏高 | ⏳ Pending |

## Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason 尚未接入完整 l10n | ✅ 已修复 |
| m-4 | profile_page.dart | 工具型按钮反馈与视觉层级仍可继续统一 | 🔄 R35 后续 |
| m-5 | main_shell.dart | PlusJakartaSans 字体声明策略仍需整理 | ⏳ Pending |
| m-6 | today_page.dart | QuoteCard 内容治理仍未接入 CMS | 🔄 R35 后续 |
| m-7 | STATUS.md | 记忆文件轮次与交付状态未及时同步 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 与其他 feature 一致性不足 | ✅ 已修复 |
