# HanaNote STATUS

## 当前轮次: Round 42
## 当前阶段: Inventory 热修 + 趋势图真实化 + 布局收尾
## 产品完成度: 99%
## 数据绑定完成度: 5/5

## 已完成功能
| 功能 | 状态 | 说明 |
|------|------|------|
| Medication feature | ✅ | Clean Architecture + Today Tab 数据绑定 |
| Journal feature | ✅ | Clean Architecture + RecordBloc 聚合 |
| BloodTest feature | ✅ | Clean Architecture + Data Tab 数据绑定 |
| Settings feature | ✅ | UserProfile / AppSettings + Profile Tab 数据绑定 |
| Timeline feature | ✅ | 跨 feature 聚合 + TimelineBloc |
| Notification system | ✅ | Medication reminders + Today countdown |
| Simulator feature | ✅ | V2 PK engine + MAP calibration + Simulator UI |
| Hana-PK experimental engine | ✅ | Weibull β>1 + kEl=0.05 修正 |
| Measurement feature | ✅ | Clean Architecture + SQLCipher + MeasurementBloc + Record Tab 聚合 |
| Photo feature | ✅ | 加密存储管线 + PhotoBloc + Grid/View UI + Record Tab 聚合 |
| Record Tab UI | ✅ | Journal / Measurement / Photo 三入口整合 |
| 5-Tab shell | ✅ | MainShell + 路由导航 |
| SecureDatabase | ✅ | SQLCipher + feature tables + migration |
| CryptoEngine / KeyManager | ✅ | AES-256-GCM + Argon2id + 会话密钥缓存 |
| Error Boundary | ✅ | FlutterError + ErrorWidget fallback UI |
| App Icon | ✅ | 占位 icon + flutter_launcher_icons 配置 |

## 待开发
| 功能 | 优先级 | 说明 |
|------|--------|------|
| AI 辅助 PK | P4 | Phase 5 探索性，不阻塞发布 |
| 云同步 / 导出 | P4 | Phase 6，当前未进入实现 |

## 5-Tab 数据绑定
| Tab | 路由 | Feature | 状态 |
|-----|------|---------|------|
| Today | /today | medication | ✅ |
| Record | /record | journal + measurement + photo | ✅ |
| Timeline | /timeline | timeline | ✅ |
| Data | /data | blood_test + simulator | ✅ |
| Profile | /profile | settings | ✅ |

## R40 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| ScheduleEditor `loadForDrug` | ✅ | 编辑页进入前预载 drug 的 route / unit / 现有 schedule |
| `/edit_schedule/:drugId` 路由修复 | ✅ | Router 改为调用 `loadForDrug` |
| DrugCard locale-aware enum | ✅ | category / route 文案切到 `localizedName(l10n)` |
| ai-cto 记忆文件同步 | ✅ | STATUS / REVIEW-BACKLOG / DECISIONS 更新至 Round 40 |

## R41 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| Timeline 事件详情底部卡片 | ✅ | 点击事件卡显示详情 bottom sheet |
| Timeline 筛选条交互 | ✅ | 本地选中态可点击切换 |
| 底部导航毛玻璃恢复 | ✅ | `bottomNavigationBar` 自身 BackdropFilter，不再依赖 `extendBody` |
| Inventory 路由接入 | ✅ | Profile 库存卡片接入 `/inventory` |
| InventoryPage i18n | ✅ | 更新库存对话框 hint 迁移到 ARB |
| 动态 top padding | ✅ | `MediaQuery.padding.top + kToolbarHeight + 16` |
| 删除确认 / 日期 / 星期显示 | ✅ | 删除弹窗、日期格式、周几显示全部 locale-aware |
| Today 空状态 CTA | ✅ | 空状态增加“添加你的第一种药物”入口 |

## R42 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| InventoryCubit / CheckInventory DI 热修 | ✅ | `/inventory` 不再因 GetIt 缺注册而 crash |
| 数据页趋势图真实化 | ✅ | 假柱状图替换为 fl_chart 折线图，按真实报告绘制 |
| Timeline FAB 动态底部间距 | ✅ | FAB 底部间距适配导航栏高度和 SafeArea |
