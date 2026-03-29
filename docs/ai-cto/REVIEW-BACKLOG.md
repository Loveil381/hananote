# 审核问题 Backlog
> 最后更新: 2026-03-29 | 会话轮次: #41

## Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper_page.dart | SettingsBloc 未在 auth 后加载 | blur overlay / greeting 状态异常 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | root 场景下存在密钥暴露风险 | ⏳ R42+ |
| C-3 | secure_database.dart | `open()` 暴露无效 password 参数 | API 语义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数兼容性问题 | SDK 升级时存在编译风险 | ✅ 已修复 |
| C-5 | schedule_editor_cubit.dart | 验证消息未接入 i18n | 非中文 locale 下体验断裂 | ✅ 已修复 |
| C-6 | medication schedule edit route | 编辑已有药物方案时未预填 route / 默认单位 | 进入编辑页后单位下拉缺失 | ✅ 已修复 |
| C-7 | inventory_page.dart | 更新库存对话框 hint 为英文硬编码 | Inventory 页面语言不一致 | ✅ 已修复 |
| C-8 | timeline_page.dart | Timeline 事件卡点击无响应 | 详情不可见，时间线信息被截断 | ✅ 已修复 |

## Major
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| M-5 | setup_page.dart | PIN 校验反馈仍可继续优化 | 键盘场景下错误提示易被遮挡 | 🔄 持续观察 |
| M-11 | record_page.dart | RecordPage 曾存在硬编码文案 | 多语言一致性受损 | ✅ 已修复 |
| M-12 | 全局 UI 枚举标签 | enum `displayName` 为硬编码文本 | UI 暴露内部命名，不支持 locale | ✅ 已修复 |
| M-13 | today_page.dart | 默认用户名未国际化 | fallback 文案不一致 | ✅ 已修复 |
| M-14 | today_page.dart | 每日语录未国际化 | 多语言体验不完整 | ✅ 已修复 |
| M-15 | 全局按钮回调 | 空回调按钮缺少反馈 | 用户误以为功能失效 | ✅ 已修复 |
| M-16 | data / timeline detail routing | 部分详情入口仍使用占位路由 | 深链和详情流尚未完善 | ⏳ Pending |
| M-17 | onboarding / empty states | 首次使用引导仍不足 | 新用户理解成本偏高 | ⏳ Pending |
| M-18 | drug_list_page.dart | 删除确认文案过于弱 | 误删风险提示不足 | ✅ 已修复 |
| M-19 | schedule_editor_page.dart | 周频率下拉显示数字而非本地化星期 | 语义不直观 | ✅ 已修复 |
| M-20 | data_page.dart | 趋势图仍为占位假数据 | Data Tab 核心价值未完全体现 | ⏳ Pending |
| M-21 | timeline_page.dart | 筛选条不可交互 | 选中态无反馈 | ✅ 已修复 |
| M-22 | timeline_page.dart | 事件卡无详情预览 | 无法快速查看事件上下文 | ✅ 已修复 |
| M-23 | inventory_page.dart | Inventory 页面未接入路由 | Profile 库存入口无实际页面 | ✅ 已修复 |
| M-24 | 多页面顶部留白 | `extendBodyBehindAppBar` 页面使用硬编码 top padding | 刘海屏 / 状态栏高度下布局不稳定 | ✅ 已修复 |
| M-25 | 底部导航视觉 | 去掉 `extendBody` 后毛玻璃视觉回退 | 设计质感下降 | ✅ 已修复 |

## Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason / 用户提示文案曾为英文 | ✅ 已修复 |
| m-4 | profile_page.dart | 清除数据按钮视觉还可继续打磨 | 🔄 持续观察 |
| m-5 | main_shell.dart | PlusJakartaSans 字体声明仍需统一清点 | ⏳ Pending |
| m-6 | today_page.dart | QuoteCard 内容管理仍依赖静态 ARB | 🔄 待 CMS / 内容系统 |
| m-7 | STATUS.md | 轮次与交付项曾滞后 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 一致性问题 | ✅ 已修复 |
