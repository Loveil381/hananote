# HanaNote — 架构文档
> 最后更新: 2026-04-26 | 会话轮次: #51

## 分层架构

```
Presentation → BLoC/Cubit → Domain (Use Cases + Entities + Services) → Data (Repository Impl + DB + Crypto)
```

各层规则：

- **Presentation**：Flutter Widget + BLoC/Cubit，只负责 UI 渲染与用户事件转发。
- **BLoC/Cubit**：调用 Use Case，持有 sealed 状态类，通过 Either 处理错误。
- **Domain**：零外部依赖（无 Flutter，无 package）。包含 Entity、Repository 抽象接口、Use Case、纯逻辑 Service（如 PkEngine）。
- **Data**：Repository 实现、DataSource、Freezed Model。所有磁盘 I/O 经由 CryptoEngine。

---

## Feature 目录结构

```
lib/features/<feature>/
  domain/
    entities/          # 不可变业务实体 (Freezed)
    repositories/      # 抽象接口 (abstract class)
    usecases/          # 单职责用例 (callable class)
    services/          # 纯逻辑（如 PkEngine, HanaPkEngine）
  data/
    datasources/       # 原始数据访问（DB、API、SecureStorage）
    models/            # JSON/数据库映射模型 (Freezed)
    repositories/      # Repository 接口实现
  presentation/
    blocs/             # BLoC / Cubit + State + Event
    pages/             # 页面级 Widget
    widgets/           # 可复用组件
```

11 个 feature module（截至 R51）：
auth, blood_test, journal, knowledge, measurement, medication, notification, photo, settings, simulator, timeline

---

## Core 模块（跨 feature 共享）

```
lib/core/
  crypto/            # CryptoEngine + KeyManager（Argon2id）
  database/          # SecureDatabase + database_factory_{native,web}
  l10n/arb/          # ARB 三语（zh/en/ja）+ AppLocalizations 生成
  platform/          # file_helper_{native,web} 条件导入
  update/            # 自动更新系统（R51 关键模块）
    update_service.dart       # CDN 轮询 + GitHub API fallback
    update_dialog.dart        # 4 状态弹窗（initial/downloading/downloaded/error）
    apk_downloader_{native,web}.dart  # 平台差异适配
    apk_installer.dart        # FileProvider + MethodChannel 触发安装
  widgets/
    petal_celebration.dart    # 樱花花瓣 Canvas 粒子（服药完成庆祝）
  constants/
    app_urls.dart             # CDN 地址、版本号集中管理
```

---

## PK 模拟器架构

### V2 引擎 (`PkEngine`)
- **注射**：双并联吸收库（fast depot + slow depot）+ 翻转消除（k2/k3）
- **口服/凝胶**：单室 Bateman 吸收
- **舌下**：θ 分流双通道（快 Bateman + 慢 Bateman）
- **贴片**：零阶输入 + 指数消除

### Hana-PK 实验引擎 (`HanaPkEngine`)
- **注射**：Weibull 吸收 + 单清除（数值卷积，步长 0.5 h）
- **口服**：显式 E1S 储库三池模型（特征值分解精确解）
- **舌下**：θ 分流——快道 Bateman + 慢道 E1S 口服模型
- **贴片/凝胶**：委托给 V2 `PkEngine`
- 与 V2 引擎并行存在，通过对比测试决定是否升级为默认

### 校准 (`CalibratePkParams`)
- MAP 估计：坐标搜索（5 点网格 × 3 轮）+ λ=0.1 L2 正则
- 少于 2 个血检点时回退群体参数

### 用例层 (`RunPkSimulation`)
- 从 `MedicationRepository` 推断剂量方案
- 调用 `PkEngine.simulate()` 返回完整曲线与稳态指标

---

## 依赖注入

get_it + injectable：
- `@lazySingleton`：全局状态 Bloc（`SettingsBloc`、`RecordBloc`）
- `@injectable`：Use Case、Repository Impl

⚠️ 路由层 `getIt<T>()` 调用必须先在源文件标注 `@injectable`（DEC-047）。

---

## 加密链路

```
App Launch
  → Auth (PIN / Biometric)
  → KeyManager (Argon2id: mem=64MB, iter=3, para=4 — 移动端)
                (Argon2id 降参 — Web 端，DEC-055)
  → SecureDatabase (SQLCipher 移动端 / sqlite3.wasm 直连 Web 端)
  → DataSource
```

- 所有密钥存入平台安全存储（Keychain / KeyStore）
- KeyManager 存储 verification hash 而非原密钥（DEC-060，C-2 修复）
- 任何用户数据禁止明文落盘
- 照片：内存中 AES-256-GCM 加密后写入沙盒（DEC-031）

---

## Web 平台分层（R50-R51 引入）

```
                  公共接口 (X.dart)
                        |
         ┌─────────────┴─────────────┐
         │ 条件导入                  │
         │ if (dart.library.html)    │
         ↓                           ↓
    X_native.dart                X_web.dart
    (移动端实现)                  (Web 端实现)
```

应用范围：
| 公共接口 | Native | Web |
|---|---|---|
| `database_factory.dart` | sqflite_sqlcipher | sqlite3.wasm 直连 |
| `file_helper.dart` | dart:io | 浏览器内存 + Blob 下载 |
| `apk_downloader.dart` | http 流式下载 + 文件缓存 | no-op（Web 端跳过） |

Web 特定文件：
- `web/index.html`：PWA meta + WASM no-cache headers
- `web/sqlite3.wasm` (741KB)：SQLite WASM 二进制
- `web/sqflite_sw.js` (250KB)：服务工作线程

---

## CI/CD 流水线（R46 起）

```
push / PR → ci.yml
                ├─ flutter pub get
                ├─ dart analyze --fatal-infos
                ├─ flutter test
                └─ flutter build apk --debug

tag v* → release.yml
                ├─ 解码 keystore (KEYSTORE_BASE64)
                ├─ flutter build apk --release（签名）
                ├─ 重命名为 HanaNote-v{tag}.apk
                ├─ gh release create
                ├─ 生成 version.json
                └─ ryand56/r2-upload-action → R2

release published → sync-r2.yml（兜底）
                ├─ 下载 GitHub Release 资产
                ├─ 生成 version.json
                └─ 上传 R2
```

发布产物：
- GitHub Release：HanaNote-v{tag}.apk
- R2 CDN：`https://cdn.hrtyaku.com/hananote/HanaNote-v{tag}.apk`
- R2 metadata：`https://cdn.hrtyaku.com/hananote/version.json`

应用启动时 `UpdateService` 轮询 CDN，CDN 失败则回退 GitHub API。

---

## Skill 生态（.agents/skills/）

R46+ 引入跨平台 Skill，三平台（Claude Code / Antigravity / Codex）共享：

| Skill | 用途 |
|---|---|
| accessibility-checklist | 无障碍审查 |
| code-review | 代码审核 |
| design-system-enforcement | 设计系统合规检查 |
| i18n-enforcement | i18n 检查 |
| pk-reference | PK 模拟器参考 |
| release-readiness | 发布前清单 |
| ux-quality-checklist | UX 质量检查 |
