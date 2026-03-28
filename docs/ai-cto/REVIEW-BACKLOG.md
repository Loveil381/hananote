# 审核问题 Backlog
> 最后更新: 2026-03-28 | 会话轮次: #33

## 🔴 Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper | SettingsBloc 未在 auth 后加载，blur overlay 异常 | 切后台闪现模糊遮罩 | 🔄 R33 修复中 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | 安全风险（需 root） | ⏳ R34+ |
| C-3 | secure_database.dart | open() password 参数被忽略 | 语义混乱 | 🔄 R33 修复中 |

## 🟠 Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-1 | today_page.dart | 问候语和 HRT 天数写死 | 显示假数据 | 🔄 R33 修复中 |
| M-2 | today_page.dart | 问候语不分时段 | 体验粗糙 | 🔄 R33 修复中 |
| M-3 | profile_page.dart | 版本号写死 v0.1.0 | 与实际版本不符 | 🔄 R33 修复中 |
| M-4 | simulator_page.dart | initialValue 参数不存在 | 可能编译警告 | 🔄 R33 修复中 |
| M-5 | setup_page.dart | 缺少本地 PIN 校验反馈 | 错误提示被键盘遮挡 | ⏳ R34 |
| M-6 | docs/ai-cto/ | 缺少 PRODUCT-VISION 和 REVIEW-BACKLOG | 会话恢复不完整 | 🔄 R33 修复中 |

## 🟡 Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | 🔄 R33 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | 🔄 R33 |
| m-3 | notification_service.dart | localizedReason 英文 | 🔄 R33 |
| m-4 | profile_page.dart | 清除数据用 tertiary 色 | ⏳ |
| m-5 | main_shell.dart | PlusJakartaSans 字体未声明 | ⏳ |
| m-6 | today_page.dart | QuoteCard 写死内容 | ⏳ |
| m-7 | STATUS.md | 本轮交付项标记未更新 | 🔄 R33 |
