---
# 技术愿景
> 最后更新: 2026-04-26 | 会话轮次: #51

## 架构评判
当前 Feature-First Clean Architecture 已经过 v1.2.2 实战验证：11 个独立 feature module，domain 层零 Flutter 依赖，BLoC/Cubit 状态管理统一，get_it + injectable DI。架构能支撑当前所有功能 + Web 平台条件适配 + 自动更新系统 + Spec-Driven 后续扩展。

R46 起补齐了三大基础设施缺口：CI/CD（GitHub Actions 三流水线）、应用内更新系统（R2 CDN + version.json）、i18n 三语 ARB 完成。仍缺：崩溃监控、Cloud Sync 双向架构。

## 与理想架构的差距
1. **崩溃监控空白**：v1.2.2 上架后无任何 crash/error 上报通道，发现问题靠用户反馈。
2. **Cloud Sync 仅单向**：UpdateService 实现了 CDN 拉取版本元数据，但用户数据无双向同步，换设备 = 数据丢失（导出/导入功能也未实现）。
3. **iOS 平台未启动**：Flutter 跨平台底子在，但签名/上架/平台特定代码未做。
4. **Web 端能力差异化**：生物识别禁用、file_picker 缺失、Argon2 参数降级——这些差异需要在文档中明确。

## 根本性改变建议
1. **崩溃监控集成**：Sentry（开源、隐私友好）或 Firebase Crashlytics（生态成熟）。服务于产品目标：快速发现线上问题。
2. **Cloud Sync 设计**：保持端到端加密（密文同步、密钥不出端），选型 Supabase / Firebase / 自建 Cloudflare D1。服务于产品目标：用户数据安全感 + 跨设备一致性。
3. **iOS 上架准备**：评估签名/审核风险（HRT 内容在 App Store 的合规策略需调研）。

## 如果只能做三件事（R52 候选）
1. **补齐 v1.1.0 承诺的三件套**：Onboarding + PDF + Import（用户期待 vs 实际差距是当前最大信任风险）
2. **崩溃监控**：v1.2.2 已上架，盲飞中
3. **Cloud Sync 双向方案设计**（Spec-Driven 启动）

## 创新机会
- PK 模拟器双引擎（V2 + Hana-PK）已就绪，对比验证后可作为差异化卖点（issue：尚无文档化的对比报告）
- 加密存储管线（PIN + 生物识别 + SQLCipher + AES-256-GCM + Argon2id）在同类 App 中罕见
- 自动更新系统（应用内下载 + FileProvider 安装）超越大多数独立开发者项目水准
- 樱花花瓣庆祝（DESIGN.md 落地）—— 二次元情感锚点

## 技术选型挑战
当前选型（Flutter 3.38.4 + Dart 3.5+ + SQLCipher + flutter_bloc）能支撑终态。无需替换。
- fl_chart：趋势图已验证
- share_plus + url_launcher：已引入
- pdf 包（v3.11.0）：worktree 草稿引入，主分支尚未引入

## 性能关注点
- Photo 加密解密在大量照片时可能成为瓶颈（缩略图缓存策略 DEC-032 已实现）
- PK 模拟器在低端设备上的帧率待验证（无生产数据）
- Web 端 Argon2 已降参防冻结，安全性 vs UX trade-off 需 R52 重审（DEC-055）
- 自动更新弹窗在弱网下的下载续传/重试策略未实现

## Web 平台技术栈差异
| 维度 | 移动端 | Web 端 | 实现 |
|---|---|---|---|
| 数据库 | sqflite_sqlcipher | sqlite3.wasm 直连适配 | DEC-051 |
| 认证 | PIN + 生物识别 | 仅 PIN | 条件代码 |
| KDF | Argon2id (mem=64MB, iter=3) | Argon2id 降参（防冻结） | DEC-055 |
| 文件系统 | dart:io | 浏览器内存 + 下载 | file_helper_native/web |
| APK 更新 | 应用内安装 | 跳过 | apk_downloader_native/web |
| WebView | webview_flutter | url_launcher 新标签页 | knowledge_webview_page |
| 文件导入 | file_picker | ❌ 未实现 | 待 R52 决策 |

## 工程基础设施清单
| 项 | 状态 | 备注 |
|---|---|---|
| CI（每提交） | ✅ | analyze + test + build apk debug |
| Release（tag → 签名 APK + R2） | ✅ | release.yml + sync-r2.yml |
| 崩溃监控 | ❌ | R52 候选 |
| Analytics | ❌ | 隐私优先项目，未必接入 |
| 性能监控 | ❌ | 暂无需求 |
| Skill 生态 | ✅ | .agents/skills/ 7 个 skill |
---
