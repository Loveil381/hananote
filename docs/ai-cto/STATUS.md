# HanaNote 项目状态
## 当前轮次: #8
## 当前阶段: UI 设计稿 → Flutter 实现
## 产品完成度: ~18%

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

## 待开发 (按优先级)
| 模块 | 优先级 | 说明 |
|------|--------|------|
| 首页 (今日Tab) Flutter UI | 🔴 P0 | 从 hananote_home_screen_updated 翻译 |
| 记录页 Flutter UI | 🔴 P0 | 从 hananote_tab_1 翻译 |
| 轨迹页 Flutter UI | 🔴 P0 | 从 hananote_tab_2 翻译 |
| 数据页 Flutter UI | 🔴 P0 | 从 hananote_tab_3 翻译 |
| 我的页 Flutter UI | 🔴 P0 | 从 hananote_tab_4 翻译 |
| 锁屏 PIN 页面重设计 | 🟠 P1 | 从 hananote_sakura/DESIGN.md 翻译 |
| 首页接入 Medication Cubit | 🟠 P1 | 倒计时/药品卡片接真实数据 |
| CryptoEngine 实现 | 🟠 P1 | AES-256-GCM + Argon2id（降级，先完成UI） |
| SecureDatabase 实现 | 🟠 P1 | SQLCipher 实际接入 |
| 应用切换模糊遮罩 | 🟠 P1 | D006 社区反馈 |
| 数据页接入 Blood Test | 🟡 P2 | fl_chart 趋势图 + 真实数据 |
| 轨迹页接入跨功能数据 | 🟡 P2 | 聚合 medication/blood_test/measurement |
| 提醒/通知系统 | 🟡 P2 | flutter_local_notifications |

## 信息架构 (5-Tab)
| Tab | 路由 | Feature |
|-----|------|---------|
| 今日 | /today | medication |
| 记录 | /record | journal (photo + measurement + diary) |
| 轨迹 | /timeline | timeline |
| 数据 | /data | blood_test |
| 我的 | /profile | settings |

## 配置文件状态
| 文件 | 状态 |
|------|------|
| AGENTS.md | ✅ |
| .agents/rules/flutter-project.md | ✅ |
| .agents/rules/privacy-security.md | ✅ |
| .agents/skills/code-review/SKILL.md | ✅ |
| .agents/skills/pk-reference/SKILL.md | ✅ |
