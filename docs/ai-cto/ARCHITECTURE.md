# HanaNote — 架构文档

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

---

## 加密链路

```
App Launch
  → Auth (PIN / Biometric)
  → KeyManager (Argon2id: mem=64MB, iter=3, para=4)
  → SecureDatabase (SQLCipher)
  → DataSource
```

- 所有密钥存入平台安全存储（Keychain / KeyStore）
- 任何用户数据禁止明文落盘
