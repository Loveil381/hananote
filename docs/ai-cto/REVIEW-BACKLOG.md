# 审核问题 Backlog
> 最后更新: 2026-03-28 | 会话轮次: #34

## 🔴 Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper | SettingsBloc 未在 auth 后加载，blur overlay 异常 | 切后台闪现模糊遮罩 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | 安全风险（需 root） | ⏳ R35+ |
| C-3 | secure_database.dart | open() password 参数被忽略 | 语义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数使用错误 | 编译兼容性和 SDK 升级风险 | 🔄 R34 |

## 🟠 Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-1 | today_page.dart | 问候语和 HRT 天数写死 | 显示假数据 | ✅ 已修复 |
| M-2 | today_page.dart | 问候语不分时段 | 体验粗糙 | ✅ 已修复 |
| M-3 | profile_page.dart | 版本号写死 v0.1.0 | 与实际版本不符 | ✅ 已修复 |
| M-5 | setup_page.dart | 缺少本地 PIN 校验反馈 | 错误提示被键盘遮挡 | ⏳ R35 |
| M-6 | docs/ai-cto/ | 缺少 PRODUCT-VISION 和 REVIEW-BACKLOG | 会话恢复不完整 | ✅ 已修复 |
| M-7 | schedule_editor_page.dart | 日期/频率编辑仍有英文文案 | 中文用户理解成本高 | 🔄 R34 |
| M-8 | add_drug_page.dart | 直接显示枚举内部 name | 文案生硬且不专业 | 🔄 R34 |
| M-9 | today_schedule_bloc.dart | 多次用药场景的 late 判断不准确 | 会错误标记服药状态 | 🔄 R34 |

## 🟡 Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | notification_service.dart | localizedReason 英文 | ⏳ |
| m-4 | profile_page.dart | 清除数据用 tertiary 色 | ⏳ |
| m-5 | main_shell.dart | PlusJakartaSans 字体未声明 | ⏳ |
| m-6 | today_page.dart | QuoteCard 写死内容 | ⏳ |
| m-7 | STATUS.md | 本轮交付项未更新 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | 新建 measurement 使用时间戳字符串 ID | 🔄 R34 |
