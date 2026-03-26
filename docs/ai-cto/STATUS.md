# HanaNote 项目状态
## 当前轮次: #14
## 当前阶段: 加密链路验证 + 隐私功能实现
## 产品完成度: ~45%

## 已完成功能
| 模块 | 状态 | 说明 |
|------|------|------|
| 项目骨架 | ✅ | Clean Arch 目录结构、DI、主题、l10n |
| Medication 全栈 | ✅ | 实体→仓库→Cubit→UI页面 |
| Auth 全栈 | ✅ | PIN + 生物识别 + 数据清除 + 启动流程 |
| 设计系统 v2 | ✅ | HanaColors (40+ token), HanaGradients, HanaShadows |
| 5-Tab 导航框架 | ✅ | ShellRoute + MainShell + glassmorphism 底部栏 |
| UI 设计稿 (Stitch) | ✅ | 7页设计稿已导出到 docs/design/ |
| DESIGN.md 设计规范 | ✅ | 色彩/字体/组件/do-dont 规则 |
| Today Tab UI + 数据绑定 | ✅ | TodayScheduleBloc 驱动，CountdownCard/MedicationStatusCard/UpcomingDoseCard 接真实状态 |
| Record Tab UI | ✅ | 3 入口卡片 (拍照/围度/日记)，blurred AppBar |
| Timeline Tab UI | ✅ | 时间轴卡片, 时间范围选择器, FAB, 渐变线 |
| Data Tab UI | ✅ | 激素指标卡片, 趋势图 (CustomPaint), 历史记录列表 |
| Profile Tab UI | ✅ | 头像+渐变环, 药物管理网格, 隐私设置, 数据操作, 关于 |
| CryptoEngine | ✅ | AES-256-GCM + AAD 支持, isolate 加密, 单元测试 |
| KeyManager | ✅ | Argon2id (64MB/3iter/4par), 常量时间比较, 单元测试 |
| SecureDatabase | ✅ | SQLCipher 集成, medication_tables DDL |
| Auth UI 设计系统迁移 | ✅ | LockScreen + Setup 使用 HanaColors，中文化 |

## 待开发 (按优先级)
| 模块 | 优先级 | 说明 |
|------|------|------|
| 应用切换模糊遮罩 | 🔴 P0 | DEC-006 社区反馈，隐私核心功能 |
| Data Tab 接入 BloodTestCubit | 🟠 P1 | fl_chart 趋势图 + 真实数据 |
| Record Tab 接入 JournalCubit | 🟠 P1 | 拍照+围度+日记功能接入 |
| Timeline Tab 跨功能数据聚合 | 🟠 P1 | medication/blood_test/measurement |
| Profile Tab 接入 SettingsCubit | 🟠 P1 | 开关/备份/清除功能接入 |
| 提醒/通知系统 | 🟡 P2 | flutter_local_notifications |
| PK 药代动力学模拟器 | 🟡 P2 | 参考 estrannaise.js 3-compartment 模型 |
| Today Tab 实时倒计时 Timer | 🟡 P2 | 当前倒计时不实时刷新 |

## 信息架构 (5-Tab)
| Tab | 路由 | Feature | UI状态 | 数据绑定 |
|-----|------|---------|--------|----------|
| 今日 | /today | medication | ✅ 完成 | ✅ 完成 |
| 记录 | /record | journal | ✅ 完成 | ⏳ 待做 |
| 轨迹 | /timeline | timeline | ✅ 完成 | ⏳ 待做 |
| 数据 | /data | blood_test | ✅ 完成 | ⏳ 待做 |
| 我的 | /profile | settings | ✅ 完成 | ⏳ 待做 |

## 加密链路状态
| 组件 | 状态 | 说明 |
|------|------|------|
| CryptoEngine | ✅ | AES-256-GCM + AAD |
| KeyManager | ✅ | Argon2id |
| SecureDatabase | ✅ | SQLCipher, MedicationTables DDL |
| Auth→DB 链路 | ✅ | UnlockApp/SetupApp 调用 openDatabase() |
| DataSource→SecureDB | ✅ | MedicationLocalDataSourceImpl 通过 SecureDatabase.database |

## 配置文件状态
| 文件 | 状态 |
|------|------|
| AGENTS.md | ✅ (含git安全规则) |
| .agents/rules/flutter-project.md | ✅ |
| .agents/rules/privacy-security.md | ✅ |
| .agents/skills/code-review/SKILL.md | ✅ |
| .agents/skills/pk-reference/SKILL.md | ✅ |
