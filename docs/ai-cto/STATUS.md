---
# HanaNote STATUS

## 当前轮次: Round 51（恢复同步轮）
## 当前阶段: 已上架 v1.2.2，规划 R52 主题
## 产品完成度: 95%（Android 主体 + Web 端可用）
## 数据绑定完成度: 5/5

## 已发布版本
| 版本 | 日期 | 主题 |
|---|---|---|
| v1.0.0 | 2026-04-11 | 首个正式版（Android） |
| v1.0.1 | 2026-04-11 | CI/Android 修复 |
| v1.1.0 | 2026-04-11 | Dark Mode + Schedule UX（commit message 提及但未交付的：Onboarding/PDF/Import） |
| v1.1.1 | 2026-04-11 | 应用内法律页 + 应用内更新下载器 |
| v1.2.0 | 2026-04-11 | 产品级自动更新系统 |
| v1.2.1 | 2026-04-12 | UI 精修 + 花瓣粒子特效 |
| v1.2.2 | 2026-04-12 | 发布签名修复 + Web SQLite WASM 修复 |

## 已完成功能
| 模块 | 状态 | 备注 |
|---|---|---|
| 核心框架 | ✅ | router, theme（含 Dark Mode）, l10n（zh/en/ja） |
| 服药管理 | ✅ | TodayPage + Cubit + 22 种 HRT 药物模板（hrtyaku.com） |
| 身体记录 | ✅ | RecordPage + Journal/Measurement |
| 趋势分析 | ✅ | DataPage + BloodTestBloc + fl_chart |
| 隐私保护 | ✅ | AppLock + CryptoEngine + Argon2id（Web 降级参数） |
| 个人中心 | ✅ | Profile + 数据导出（JSON 分享） |
| 通知系统 | ✅ | NotificationService + NotificationSettingsPage |
| HRT 知识库 | ✅ | 内嵌 WebView 接 hrtyaku.com |
| 自动更新 | ✅ | UpdateService + R2 CDN + version.json + 应用内 APK 安装 |
| Dark Mode | ✅ | HanaColors.xxxOf(context) 模式全量覆盖 |
| 法律页 | ✅ | 应用内隐私/条款页（三语） |
| 庆祝反馈 | ✅ | 服药完成花瓣粒子（DESIGN.md 要求） |
| Flutter Web | ✅ | 条件导入 + 直连 sqlite3.wasm + Argon2 降参 |
| CI/CD | ✅ | ci.yml + release.yml + sync-r2.yml |
| i18n | ✅ | ARB 三语（zh/en/ja），约 245 keys |

## R52+ 待开发
| 功能 | 优先级 | 说明 |
|------|--------|------|
| 引导流程 (Onboarding) | P1 | v1.1.0 commit message 承诺但未交付，worktree 有孤儿文件可参考 |
| PDF 报告生成 | P2 | 同上，worktree 有 generate_pdf_report.dart 草稿 |
| 数据导入（JSON） | P2 | 同上，worktree 有 import_data.dart 草稿 |
| 崩溃监控 | P2 | Sentry / Crashlytics 待评估 |
| Cloud Sync 双向 | P3 | 当前仅 CDN 单向（更新分发），用户数据未云同步 |
| AI 辅助 PK | P4 | Phase 5 探索性 |

## R46 ~ R51 关键交付
| 轮次 | 交付 | Commit |
|---|---|---|
| R46 | C-2 KeyManager 安全修复 + CI/CD 三流水线 + HRT WebView + 大量 i18n + 通知设置 | 13380d2 |
| R47 | 多语 README + Flutter 3.38.4 锁版 + Android 修复 | 76aa65c, e9a6af0 |
| R47 | 设置页语言切换接通 (zh/en/ja) | 7fb6e44 |
| R48 | v1.1.0 Dark Mode（HanaColors.xxxOf(context)）+ Schedule UX | 03a832e, b5672db |
| R48 | 22 种 HRT 药物模板（hrtyaku.com 循证） | 4c212c2 |
| R49 | v1.1.1 应用内法律页 + APK 应用内下载安装 | a2a57d9 |
| R49 | v1.2.0 产品级自动更新系统（4 状态弹窗 + 跳过版本） | 5ac21de |
| R50 | Flutter Web 平台支持（条件导入架构） | 211e328 |
| R50 | Web Argon2 参数降级（防浏览器冻结） | 06d587a |
| R51 | v1.2.1 花瓣粒子庆祝特效 + UI 精修 | 708f026 |
| R51 | Web SQLite WASM 修复（KDF + 直连 sqlite3.wasm 适配器） | 2a71dda, 21fc868 |
| R51 | v1.2.2 发布签名修复 | d7774fa |

## R51 之后的 dead-end / 风险
1. **v1.1.0 commit message 与实际 diff 不符** — Onboarding/PDF/Import 在描述里但未提交。后续若有用户根据 Release Notes 期待这些功能会失望，需要在 R52 决定：补齐 or 修订 Release Notes。
2. **worktree 孤儿文件**：`.claude/worktrees/exciting-borg/` 下有 onboarding_page.dart / generate_pdf_report.dart / import_data.dart 草稿，未进入 git 历史。R52 实施 Onboarding/PDF/Import 时可参考。
3. **Web 端缺生物识别**：仅 PIN 登录（条件适配，预期内）。
4. **Web 端缺 file_picker**：导入功能在 Web 端实现策略未定。
---
