# HanaNote 项目状态
## 当前轮次: #12
## 当前阶段: 静态UI → Cubit数据绑定
## 产品完成度: ~35%

## 已完成功能
| 模块 | 状态 | 说明 |
|------|------|------|
| 项目骨架 | ✅ | Clean Arch 目录结构、DI、主题、l10n |
| Medication 全栈 | ✅ | 实体→仓库→Cubit→旧UI页面 |
| Auth 全栈 | ✅ | PIN + 生物识别 + 数据清除 + 启动流程 |
| 设计系统 v2 | ✅ | HanaColors (40+ token), HanaGradients, HanaShadows |
| 5-Tab 导航框架 | ✅ | ShellRoute + MainShell + glassmorphism 底部栏 |
| UI 设计稿 (Stitch) | ✅ | 7页设计稿已导出到 docs/design/ |
| DESIGN.md 设计规范 | ✅ | 色彩/字体/组件/do-dont 规则 |
| Today Tab UI | ✅ | CountdownCard, MedicationStatusCard, UpcomingDoseCard, QuoteCard |
| Record Tab UI | ✅ | 3 入口卡片 (拍照/围度/日记)，blurred AppBar |
| Timeline Tab UI | ✅ | 时间轴卡片, 时间范围选择器, FAB, 渐变线 |
| Data Tab UI | ✅ | 激素指标卡片, 趋势图 (CustomPaint), 历史记录列表 |
| Profile Tab UI | ✅ | 头像+渐变环, 药物管理网格, 隐私设置, 数据操作, 关于 |

## 待开发 (按优先级)
| 模块 | 优先级 | 说明 |
|------|--------|------|
| Today Tab 接入 MedicationCubit | 🔴 P0 | 倒计时/药品卡片接真实数据 |
| 锁屏 PIN 页面重设计 | 🟠 P1 | 从 DESIGN.md 翻译为新设计 |
| CryptoEngine 实现 | 🟠 P1 | AES-256-GCM + Argon2id |
| SecureDatabase 实现 | 🟠 P1 | SQLCipher 实际接入 |
| 应用切换模糊遮罩 | 🟠 P1 | DEC-006 社区反馈 |
| Data Tab 接入 BloodTestCubit | 🟡 P2 | fl_chart 趋势图 + 真实数据 |
| Timeline Tab 跨功能数据聚合 | 🟡 P2 | medication/blood_test/measurement |
| Record Tab 接入 JournalCubit | 🟡 P2 | 拍照+围度+日记功能接入 |
| 提醒/通知系统 | 🟡 P2 | flutter_local_notifications |
| Profile Tab 接入 SettingsCubit | 🟡 P2 | 开关/备份/清除功能接入 |

## 信息架构 (5-Tab)
| Tab | 路由 | Feature | UI状态 | 数据绑定 |
|-----|------|---------|--------|----------|
| 今日 | /today | medication | ✅ 完成 | ⏳ 本轮 |
| 记录 | /record | journal | ✅ 完成 | ⏳ 待做 |
| 轨迹 | /timeline | timeline | ✅ 完成 | ⏳ 待做 |
| 数据 | /data | blood_test | ✅ 完成 | ⏳ 待做 |
| 我的 | /profile | settings | ✅ 完成 | ⏳ 待做 |

## 配置文件状态
| 文件 | 状态 |
|------|------|
| AGENTS.md | ✅ (含git安全规则) |
| .agents/rules/flutter-project.md | ✅ |
| .agents/rules/privacy-security.md | ✅ |
| .agents/skills/code-review/SKILL.md | ✅ |
| .agents/skills/pk-reference/SKILL.md | ✅ |
