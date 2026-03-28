# HanaNote STATUS

## 当前轮次: Round 36
## 当前阶段: 发布前收尾 + 功能入口接通
## 产品完成度: 99%
## 数据绑定完成度: 5/5

## 已完成功能
| 功能 | 状态 | 说明 |
|------|------|------|
| Medication feature | ✅ | Clean Architecture + Today Tab 数据绑定 |
| Journal feature | ✅ | Clean Architecture + RecordBloc 聚合 |
| BloodTest feature | ✅ | Clean Architecture + Data Tab 数据绑定 |
| Settings feature | ✅ | UserProfile/AppSettings + Profile Tab 数据绑定 |
| Timeline feature | ✅ | 跨 feature 聚合 + TimelineBloc |
| Notification system | ✅ | Medication reminders + Today countdown |
| Simulator feature | ✅ | V2 PK engine + MAP calibration + Simulator UI |
| Hana-PK experimental engine | ✅ | Weibull β>1 + kEl=0.05 修正 |
| Measurement feature | ✅ | Clean Architecture + SQLCipher + MeasurementBloc + Record Tab 聚合 |
| Photo feature | ✅ | 加密存储管线 + PhotoBloc + Grid/View UI + Record Tab 聚合 |
| Record Tab UI | ✅ | 3 入口卡片 + Journal/Measurement/Photo 集成 |
| 5-Tab shell | ✅ | MainShell + 路由导航 |
| SecureDatabase | ✅ | SQLCipher + feature tables + migration |
| CryptoEngine / KeyManager | ✅ | AES-256-GCM + Argon2id + 会话密钥缓存 |
| Error Boundary | ✅ | FlutterError + ErrorWidget fallback UI |
| App Icon | ✅ | 占位 icon + flutter_launcher_icons 配置 |

## 待开发
| 功能 | 优先级 | 说明 |
|------|--------|------|
| AI 辅助 PK | P4 | Phase 5 探索性，不阻塞发布 |
| 云同步 | P4 | Phase 6，当前仍未开始 |

## 5-Tab 数据绑定
| Tab | 路由 | Feature | 状态 |
|-----|------|---------|------|
| Today | /today | medication | ✅ |
| Record | /record | journal + measurement + photo | ✅ |
| Timeline | /timeline | timeline | ✅ |
| Data | /data | blood_test + simulator | ✅ |
| Profile | /profile | settings | ✅ |

## R33 交付
| 项目 | 状态 | 说明 |
|------|------|------|
| SettingsBloc auth 后加载 | ✅ | AuthUnlocked 后立即 dispatch LoadSettingsDashboard |
| AppBlurOverlay 逻辑修正 | ✅ | SettingsInitial 不触发 blur |
| TodayPage 真实数据 | ✅ | 问候语 + HRT 天数从 SettingsBloc 获取 |
| 中文化 | ✅ | auth / error / biometric reason 改为中文 |
| SecureDatabase.open 清理 | ✅ | 去掉无用 password 参数 |
| Profile 版本号 | ✅ | v0.1.0 → v1.0.0 |
| Simulator Dropdown 修正 | ✅ | DropdownButtonFormField 参数与当前 SDK 对齐 |
| 记忆文件补全 | ✅ | PRODUCT-VISION.md + REVIEW-BACKLOG.md |

## R34 交付
| 项目 | 状态 | 说明 |
|------|------|------|
| DropdownButtonFormField 参数修正 | ✅ | simulator_page + schedule_editor_page 调整完成 |
| schedule_editor_page 全中文 | ✅ | 表单标签与占位文案补齐 |
| add_drug_page 全中文 + displayName | ✅ | category / route / unit 不再暴露 enum.name |
| _isDoseLate 逻辑修正 | ✅ | 支持按具体 scheduledDateTime 判断 late |
| Measurement ID 统一 UUID | ✅ | measurement_edit_page 改为 IdGenerator.generate() |

## R35 交付
| 项目 | 状态 | 说明 |
|------|------|------|
| 记忆文件同步 | ✅ | STATUS / REVIEW-BACKLOG / DECISIONS 对齐 Round 35 |
| SetupPage PIN 校验 UX | ✅ | 错误提示改为输入框下方文本，不再依赖 SnackBar |
| Profile 危险操作颜色 | ✅ | 清除数据按钮改用 error 色 |
| localizedReason 中文化 | ✅ | 生物识别提示改为中文 |
| QuoteCard 每日语录 | ✅ | TodayPage 改为按日期轮播语录 |

## R36 交付
| 项目 | 状态 | 说明 |
|------|------|------|
| Profile / Data / Timeline 核心入口接通 | ✅ | 主要卡片与 FAB 跳转到可用页面 |
| UpcomingDoseCard + ScheduleEditor 路由修正 | ✅ | 服药按钮文案补全，DrugList 传入 drugId |
| 死按钮与空回调清理 | ✅ | AppBar 假按钮移除或替换为明确占位动作 |
| Journal UUID + TodayPage 装饰修正 | ✅ | 新建日记改用 UUID，TodayPage 顶部交互收敛 |
| ai-cto 记忆文件同步 | ✅ | STATUS / REVIEW-BACKLOG / DECISIONS 更新到 Round 36 |
