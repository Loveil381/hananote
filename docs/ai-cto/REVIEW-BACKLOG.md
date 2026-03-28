# 审核问题 Backlog
> 最后更新: 2026-03-28 | 会话轮次: #35

## 🔴 Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper | SettingsBloc 未在 auth 后加载，blur overlay 异常 | 切后台闪现模糊遮罩 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | 安全风险（需 root） | ⏳ R36+ |
| C-3 | secure_database.dart | open() password 参数被忽略 | 语义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数错误 | 新 SDK 下存在编译/分析风险 | ✅ 已修复 |

## 🟠 Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-1 | today_page.dart | 问候语和 HRT 天数写死 | 显示假数据 | ✅ 已修复 |
| M-2 | today_page.dart | 问候语不分时段 | 体验粗糙 | ✅ 已修复 |
| M-3 | profile_page.dart | 版本号写死 v0.1.0 | 与实际版本不符 | ✅ 已修复 |
| M-4 | simulator_page.dart | Dropdown 参数错误 | 新 SDK 下存在告警风险 | ✅ 已修复 |
| M-5 | setup_page.dart | 缺少本地 PIN 校验反馈 | 错误提示会被键盘遮挡 | 🔄 R35 |
| M-6 | docs/ai-cto/ | 缺少关键记忆文件同步 | 会话恢复不完整 | ✅ 已修复 |
| M-7 | schedule_editor_page.dart | 空字符串占位导致中文标签缺失 | 用药计划编辑页显示空白 | ✅ 已修复 |
| M-8 | add_drug_page.dart | 直接暴露 enum.name | 中文用户体验差 | ✅ 已修复 |
| M-9 | today_schedule_bloc.dart | late 判断未按具体时间点计算 | 多次用药状态不准确 | ✅ 已修复 |

## 🟡 Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason 文案需要中文化 | 🔄 R35 |
| m-4 | profile_page.dart | 清除数据按钮未使用 error 色 | 🔄 R35 |
| m-5 | main_shell.dart | PlusJakartaSans 字体未声明 | ⏳ |
| m-6 | today_page.dart | QuoteCard 内容写死 | 🔄 R35 |
| m-7 | STATUS.md | 本轮交付项状态未同步 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 仍非 UUID | ✅ 已修复 |
