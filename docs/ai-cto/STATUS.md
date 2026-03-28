# HanaNote STATUS

## 当前轮次: Round 35
## 当前阶段: 发布前收尾 + 记忆同步
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

## 5-Tab 数据绑定
| Tab | 路由 | Feature | 状态 |
|-----|------|---------|------|
| Today | /today | medication | ✅ |
| Record | /record | journal + measurement + photo | ✅ |
| Timeline | /timeline | timeline | ✅ |
| Data | /data | blood_test + simulator | ✅ |
| Profile | /profile | settings | ✅ |

## R33 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| SettingsBloc auth 后加载 | ✅ | auth 通过后立即 dispatch LoadSettingsDashboard |
| AppBlurOverlay 逻辑修正 | ✅ | SettingsInitial 不触发 blur |
| TodayPage 真实数据 | ✅ | 问候语 + HRT 天数从 SettingsBloc 获取 |
| 中文化 | ✅ | auth/error/notification 字符串统一中文 |
| SecureDatabase.open 清理 | ✅ | 去掉无用 password 参数 |
| Profile 版本号 | ✅ | v0.1.0 → v1.0.0 |
| Simulator Dropdown 修正 | ✅ | DropdownButtonFormField 参数修正 |
| 记忆文件补全 | ✅ | 创建 PRODUCT-VISION.md + REVIEW-BACKLOG.md |

## R34 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| DropdownButtonFormField 参数修正 | ✅ | simulator_page + schedule_editor_page 改为 value |
| schedule_editor_page 全中文 | ✅ | 中文标签和空字符串占位已清理 |
| add_drug_page 全中文 + 枚举 displayName | ✅ | category/route/unit 不再暴露 enum.name |
| _isDoseLate 逻辑修正 | ✅ | 支持按具体 scheduledDateTime 判断 late |
| Measurement ID 统一 UUID | ✅ | measurement_edit_page 改为 IdGenerator.generate() |

## R35 本轮交付
| 项目 | 状态 | 说明 |
|------|------|------|
| 记忆文件同步 | 🔄 | STATUS.md / REVIEW-BACKLOG.md / DECISIONS.md 更新至 Round 35 |
| SetupPage PIN 校验 UX | 🔄 | 错误提示改为输入框下方红字，不再依赖 SnackBar |
| Profile 清除按钮颜色 | 🔄 | tertiary → error |
| localizedReason 中文化 | 🔄 | 生物识别提示改为中文文案 |
| QuoteCard 每日语录 | 🔄 | TodayPage 改为按日期切换语录 |
