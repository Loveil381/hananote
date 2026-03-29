# HanaNote STATUS

## 当前轮次: Round 41
## 当前阶段: Timeline / Inventory / 布局稳定性收尾
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
| Record Tab UI | ✅ | Journal / Measurement / Photo 三入口已接通 |
| 5-Tab shell | ✅ | MainShell + 路由导航 |
| SecureDatabase | ✅ | SQLCipher + feature tables + migration |
| CryptoEngine / KeyManager | ✅ | AES-256-GCM + Argon2id + 会话密钥缓存 |
| Error Boundary | ✅ | FlutterError + ErrorWidget fallback UI |
| App Icon | ✅ | 占位 icon + flutter_launcher_icons 配置 |

## 待开发
| 功能 | 优先级 | 说明 |
|------|--------|------|
| AI 辅助 PK | P4 | Phase 5 探索性，不阻塞发布 |
| 云同步 | P4 | Phase 6，发布后规划 |

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
| ScheduleEditor `loadForDrug` | ✅ | 编辑前预加载 drug 的 route / unit / 现有 schedule |
| `/edit_schedule/:drugId` 路由修复 | ✅ | Router 改为调用 `loadForDrug` |
| DrugCard locale-aware enum 文案 | ✅ | category / route 改用 `localizedName(l10n)` |
| ai-cto 记忆同步 | ✅ | STATUS / REVIEW-BACKLOG / DECISIONS 更新至 Round 40 |

## R41 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| Timeline 事件详情预览 | ✅ | 点击事件卡弹出 bottom sheet 详情 |
| Timeline 筛选条交互 | ✅ | 本地选中态可切换，后续再接 Bloc |
| 底部导航毛玻璃恢复 | ✅ | `bottomNavigationBar` 内部 `BackdropFilter`，不使用 `extendBody` |
| Inventory 路由接入 | ✅ | Profile 库存卡片进入 `/inventory` |
| InventoryPage i18n | ✅ | 更新库存对话框 hint 迁移到 ARB |
| 动态 top padding | ✅ | `MediaQuery.padding.top + kToolbarHeight + 16` |
| 删除确认 / 日期 / 星期本地化 | ✅ | 药物删除文案、日期格式、周几显示统一 locale-aware |
| Today 空状态 CTA | ✅ | 无药物时显示引导图标和“添加第一种药物”按钮 |
