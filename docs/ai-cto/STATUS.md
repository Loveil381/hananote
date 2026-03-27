# HanaNote 项目状态
## 当前轮次: #24
## 当前阶段: 发布前集成打磨 — Simulator / 图表 / 边界测试
## 产品完成度: 97%
## 数据绑定进度: 5/5 ✅

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
| Journal feature | ✅ | Clean Architecture 分层 + RecordBloc 聚合 Journal 元数据 |
| Timeline Tab UI | ✅ | 时间轴卡片, 时间范围选择器, FAB, 渐变线 |
| Data Tab UI | ✅ | 激素指标卡片, 趋势图 (fl_chart), 历史记录列表 |
| BloodTest 全栈 | ✅ | entity → repository → usecase → bloc → UI，Data Tab 接入真实数据 |
| Profile Tab UI | ✅ | 头像+渐变环, 药物管理网格, 隐私设置, 数据操作, 关于 |
| Settings feature | ✅ | UserProfile/AppSettings + SettingsBloc + Profile Tab 数据绑定 |
| Timeline feature | ✅ | TimelineBloc 聚合 medication log、blood test report、journal entry 与 milestone |
| 通知系统 | ✅ | NotificationService + SyncMedicationReminders + Android 权限/receiver |
| Today Tab 实时倒计时 | ✅ | CountdownCard 每分钟刷新剩余时间 |
| blurOverlay 联动 | ✅ | SettingsBloc 全局复用，Profile 开关实时影响 AppBlurOverlay |
| Simulator feature | ✅ | V2 双库全路由引擎 + MAP 校准 + 小时制参数统一 |
| Hana-PK 实验引擎 | ✅ | Weibull β>1 + kEl=0.05 修正，图表动态化，集成测试 |
| PK 模拟器 UI | ✅ | 曲线可视化与参数编辑面板, SimulatorBloc, fl_chart |
| 应用切换模糊遮罩 | ✅ | DEC-006 隐私增强已落地，修复上轮状态遗漏 |
| CryptoEngine | ✅ | AES-256-GCM + AAD 支持, isolate 加密, 单元测试 |
| KeyManager | ✅ | Argon2id (64MB/3iter/4par), 常量时间比较, 单元测试 |
| SecureDatabase | ✅ | SQLCipher 集成, medication_tables DDL |
| Auth UI 设计系统迁移 | ✅ | LockScreen + Setup 使用 HanaColors，中文化 |

## 待开发 (按优先级)
| 模块 | 优先级 | 说明 |
|------|------|------|
| AI 增强 PK | ⚪ P4 (探索) | LLM 参数顾问 / Neural-ODE，Phase 5 |

## 信息架构 (5-Tab)
| Tab | 路由 | Feature | UI状态 | 数据绑定 |
|-----|------|---------|--------|----------|
| 今日 | /today | medication | ✅ 完成 | ✅ 完成 |
| 记录 | /record | journal | ✅ 完成 | ✅ 完成（Phase 1 — Journal） |
| 轨迹 | /timeline | timeline | ✅ 完成 | ✅ 完成 |
| 数据 | /data | blood_test | ✅ 完成 | ✅ 完成 |
| 我的 | /profile | settings | ✅ 完成 | ✅ 完成 |

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
