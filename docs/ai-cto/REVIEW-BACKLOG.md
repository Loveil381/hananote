# 审核问题 Backlog
> 最后更新: 2026-04-02 | 会话轮次: #45

## Critical
| # | 文件 | 问题 | 产品影响 | 状态 |
|---|---|---|---|---|
| C-1 | app.dart + auth_wrapper_page.dart | SettingsBloc 未在 auth 后加载 | blur overlay / greeting 状态异常 | ✅ 已修复 |
| C-2 | key_manager.dart | 存储实际密钥而非验证 hash | root 场景下存在安全风险 | ⏳ Pending |
| C-3 | secure_database.dart | `open()` 语义上残留无效 password | API 含义混乱 | ✅ 已修复 |
| C-4 | simulator_page.dart + schedule_editor_page.dart | DropdownButtonFormField 参数历史不一致 | SDK 升级时有编译风险 | ✅ 已修复 |
| C-5 | schedule_editor_cubit.dart | 验证消息未接入 i18n | locale 切换后仍出现固定文案 | ✅ 已修复 |
| C-6 | medication schedule edit route | 编辑页缺少 route / unit 预载 | 新建/编辑药物方案时单位下拉缺失 | ✅ 已修复 |
| C-7 | inventory_page.dart | 更新库存 hint 曾为英文硬编码 | Inventory 页面出现混合语言 | ✅ 已修复 |
| C-8 | timeline_page.dart | Timeline 事件卡点击无反馈 | 用户无法查看事件详情 | ✅ 已修复 |
| C-9 | inventory route DI | InventoryCubit / CheckInventory 未注册 DI | 打开库存页立即 crash | ✅ 已修复 |

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
| M-17 | onboarding / empty states | 基础设置页和通知设置页已就绪 | 首次使用理解成本高 | 🔄 部分完成 |
| M-29 | Profile 导入备份 placeholder | 现有 Snackbar 已升级为美观 BottomSheet | dead-end 友好化 | ⏳ Pending |
| M-30 | PDF 报告生成 | 逻辑待实现，UI 已有美学占位 | 医疗汇报能力 | ⏳ Pending |
| M-18 | drug_list_page.dart | 删除确认文案过弱 | 误删风险高 | ✅ 已修复 |
| M-19 | schedule_editor_page.dart | 日期 / 星期显示不 locale-aware | 编辑页可读性不稳定 | ✅ 已修复 |
| M-20 | data_page.dart | 趋势图曾为假数据 | Data Tab 缺少真实参考价值 | ✅ 已修复 |
| M-21 | timeline_page.dart | 筛选条不可交互 | 时间轴筛选无反馈 | ✅ 已修复 |
| M-22 | timeline_page.dart | FAB 底部间距硬编码 | 不同设备上会压住导航栏 | ✅ 已修复 |
| M-23 | inventory_page.dart | Inventory 页面未接通路由 | Profile 入口不可用 | ✅ 已修复 |
| M-24 | 多个页面 | `extendBodyBehindAppBar` + 硬编码 top padding | 刘海屏 / 状态栏设备布局漂移 | ✅ 已修复 |
| M-25 | main_shell.dart | 毛玻璃导航实现曾依赖 `extendBody` | 容易和内容遮挡互相打架 | ✅ 已修复 |

## Minor
| # | 文件 | 问题 | 状态 |
|---|---|---|---|
| m-1 | auth_cubit.dart | 错误信息英文 | ✅ 已修复 |
| m-2 | error_fallback_page.dart | fallback 文案英文 | ✅ 已修复 |
| m-3 | auth_repository_impl.dart | localizedReason / 权限提示未完全统一 | ✅ 已修复 |
| m-4 | profile_page.dart | 清除数据按钮视觉仍可再调 | ⏳ Pending |
| m-5 | main_shell.dart | PlusJakartaSans 字体声明链路待最终收口 | ⏳ Pending |
| m-6 | today_page.dart | QuoteCard 后续应接 CMS/内容管理 | ⏳ Pending |
| m-7 | STATUS.md | 轮次交付标记不同步 | ✅ 已修复 |
| m-8 | measurement_edit_page.dart | Measurement 新建 ID 一致性 | ✅ 已修复 |
