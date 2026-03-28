# 审核问题 Backlog
> 最后更新: 2026-03-29 | 会话轮次: #36

## 🔴 Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper_page.dart | SettingsBloc 未在 auth 后加载 | blur overlay / greeting 依赖状态异常 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | root 环境下存在额外安全风险 | ⏳ R36+ |
| C-3 | secure_database.dart | open() 的 password 参数被忽略 | API 语义混乱，误导调用方 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数与 Flutter SDK 不一致 | 新版 SDK 下容易触发编译或 lint 风险 | ✅ 已修复 |

## 🟠 Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-1 | today_page.dart | 问候语和 HRT 天数写死 | 首页显示假数据 | ✅ 已修复 |
| M-2 | today_page.dart | 问候语不分时段 | 体验粗糙 | ✅ 已修复 |
| M-3 | profile_page.dart | 版本号写死 v0.1.0 | 与实际版本不符 | ✅ 已修复 |
| M-4 | simulator_page.dart | Dropdown 参数错误 | SDK 升级后有不稳定风险 | ✅ 已修复 |
| M-5 | setup_page.dart | PIN 校验反馈仍缺少进一步打磨 | 极端输入场景下仍有可用性空间 | ⏳ R37 |
| M-6 | docs/ai-cto/ | 缺少产品愿景与审查积压文件 | 会话恢复信息不完整 | ✅ 已修复 |
| M-7 | schedule_editor_page.dart | 中文标签曾被错误替换为空字符串 | 用药方案页出现空白标签 | ✅ 已修复 |
| M-8 | add_drug_page.dart | 直接暴露 enum.name | 用户可见英文技术名词 | ✅ 已修复 |
| M-9 | today_schedule_bloc.dart | late 判定未按具体 scheduledDateTime 计算 | 多次用药时完成状态不准 | ✅ 已修复 |
| M-10 | profile_page.dart / data_page.dart / timeline_page.dart | 多个核心入口原先不可点击或无路由 | 关键功能入口不可达 | ✅ 已修复 |

## 🟡 Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误提示为英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案为英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason 中文化已完成，但仍未接入统一 l10n | 🔄 R36 |
| m-4 | profile_page.dart | 部分占位能力仍以 SnackBar 说明“即将上线” | 🔄 R36 |
| m-5 | main_shell.dart | PlusJakartaSans 字体声明未完全确认 | ⏳ |
| m-6 | today_page.dart | QuoteCard 仍是本地静态轮播，不支持个性化 | 🔄 R36 |
| m-7 | STATUS.md | 轮次与交付状态未及时同步 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 与其他 feature 不一致 | ✅ 已修复 |
