# HanaNote — 技术决策记录
> 每个重大决策记录理由和替代方案

## DEC-001: Feature-First 目录结构
- **决定**: 使用 Feature-First 而非 Layer-First
- **理由**: 功能模块多且独立，Feature-First 让 Agent 可并行开发
- **替代方案**: Layer-First (`lib/domain/`, `lib/data/`, `lib/presentation/`)；文件跨越多目录，不利于并行
- **日期**: 第零轮

## DEC-002: 安全第一架构
- **决定**: CryptoEngine 是第一个实现的模块
- **理由**: 隐私是产品第一卖点，不存在“先明文开发后面加密”的路径
- **风险**: 开发初期增加复杂度，但避免了后期全面重构
- **日期**: 第零轮

## DEC-003: flutter_bloc 而非 Riverpod
- **决定**: 使用 flutter_bloc
- **理由**: 事件驱动模式更适合数据密集型 App，BLoC 测试成熟
- **替代方案**: Riverpod，更轻量但对复杂状态的可测试性不如 BLoC
- **日期**: 第零轮

## DEC-004: fpdart Either 模式
- **决定**: 所有异步操作返回 `Either<Failure, T>`
- **理由**: 类型安全的错误处理，编译时强制处理错误路径
- **替代方案**: `try-catch`，运行时错误容易遗漏
- **日期**: 第零轮

## DEC-005: Freezed 数据模型
- **决定**: 所有实体和模型用 Freezed 生成
- **理由**: 30+ 围度、30+ 血检指标的复杂模型手写是 bug 温床
- **替代方案**: 手写，维护成本高，容易遗漏 `copyWith` / `equality`
- **日期**: 第零轮

## DEC-006: 社区反馈隐私增强
- **决定**: 添加应用切换模糊遮罩、剪贴板保护、备份密钥分离
- **理由**: 目标用户社区实际反馈，非协商性需求
- **日期**: 第7轮

## DEC-007: 5-Tab 信息架构
- **决定**: 底部导航从 3 Tab 改为 5 Tab（今日 / 记录 / 时间线 / 数据 / 我的）
- **理由**: “记录”聚合日常录入动作使其突出；“时间线”作为核心叙事线提升留存；“我的”收纳低频操作
- **替代方案**: 原 3 Tab 方案会把过多功能挤在单一入口下
- **日期**: 第8轮

## DEC-008: Stitch 设计稿优先策略
- **决定**: 先用 Google Stitch 生成全部页面设计稿，再翻译为 Flutter
- **理由**: 设计稿锁定视觉规范，避免实现偏移；HTML / CSS 提供精确色彩、间距和字体值
- **日期**: 第8轮

## DEC-009: UI 优先于加密实现
- **决定**: 将 CryptoEngine / SecureDatabase 从 P0 降为 P1，UI 实现提升为 P0
- **理由**: 需要先有可视化 App 验证设计和体验；加密层在 UI 稳定后接入不会破坏架构
- **日期**: 第8轮

## DEC-010: 5 个 Tab UI 壳完成后转向数据绑定
- **决定**: 停止新 UI 页面开发，转向将已有 Cubit / Bloc 接入已完成的 UI 壳
- **理由**: 5 个 Tab 全是硬编码假数据，继续铺 UI 不产生用户价值；MedicationCubit 已是现成数据源
- **第一个接入点**: Today Tab + MedicationCubit
- **日期**: 第12轮

## DEC-011: git 安全规则写入 AGENTS.md
- **决定**: 将禁止 force-push、禁止跨分支 push、禁止删除未合并分支三条规则写入 `AGENTS.md`
- **理由**: Round 8-9 期间多次出现分支丢失和合并事故
- **日期**: 第9轮（补录）

## DEC-012: Argon2id 替换 PBKDF2
- **决定**: 将 KeyManager 的密钥派生算法从 PBKDF2-HMAC-SHA256 升级为 Argon2id
- **理由**: Argon2id 是 memory-hard 算法，对 GPU / ASIC 暴力破解的抵抗力优于 PBKDF2；OWASP 2024 推荐 Argon2id 为首选
- **参数**: `memory=64MB, iterations=3, parallelism=4, hashLength=32`
- **依赖**: `hashlib`（纯 Dart，无 FFI）
- **日期**: 第13轮

## DEC-013: Auth UI 迁移到设计系统 v2
- **决定**: 将 `LockScreenPage` 和 `SetupPage` 从硬编码颜色迁移到 `HanaColors`
- **理由**: 保持全 App 视觉一致性，消除设计债务
- **日期**: 第13轮

## DEC-014: BloodTest feature 采用 Medication 同款分层
- **决定**: BloodTest feature 采用与 Medication 相同的 Clean Architecture 分层（entity → repository → usecase → bloc → UI）
- **理由**: 保持 feature 间结构一致，便于并行开发、复用测试模式和后续数据绑定扩展
- **补充**: `HormoneType` enum 内嵌 WPATH / Endocrine Society 目标范围，用于自动状态判定
- **日期**: 第15轮

## DEC-015: Data Tab 趋势图迁移到 fl_chart
- **决定**: Data Tab 趋势图从 `CustomPaint` 迁移至 `fl_chart`
- **理由**: 支持交互式 tooltip、动态时间范围切换，并降低自绘图表维护成本
- **日期**: 第15轮

## DEC-016: Journal feature 采用与 Medication/BloodTest 同款 Clean Architecture 分层
- **决定**: Journal feature 采用与 Medication / BloodTest 同款 Clean Architecture 分层；`RecordBloc` 作为 Record Tab 的统一聚合 Bloc
- **日期**: 第16轮

## DEC-017: 日记编辑页直接注入 UseCase 而非创建独立 Bloc
- **决定**: 日记编辑页直接注入 UseCase，而非创建独立 Bloc
- **理由**: 编辑页是一次性操作页面，不需要持续状态管理
- **日期**: 第16轮

## DEC-018: Settings feature 使用 FlutterSecureStorage 存储简单配置
- **决定**: Settings feature 使用 FlutterSecureStorage（key-value）而非 SQLite 存储 `UserProfile` 和 `AppSettings`
- **理由**: 这些是非关系型简单配置数据，不需要 SQL 查询能力
- **日期**: 第17轮

## DEC-019: RecordBloc 改为 lazySingleton 修复刷新链路
- **决定**: `RecordBloc` 从 `@injectable` 改为 `@lazySingleton`
- **理由**: 确保 `JournalEditPage` 保存后能正确触发 `RecordPage` 刷新
- **日期**: 第17轮

## DEC-020: Timeline 采用跨 Feature 只读聚合模式
- **决定**: Timeline UseCase 直接注入多个 Repository 做只读聚合，不新增中间层
- **理由**: Timeline 本质是跨模块展示流，聚合逻辑集中在 UseCase 中最直接，也能实现 graceful degradation
- **日期**: 第18轮

## DEC-021: TimelineEvent 使用统一实体与 metadata 扩展
- **决定**: Timeline 统一使用 `TimelineEvent` 实体，而不是按 medication / blood test / journal 分别定义 union type
- **理由**: 单一事件模型让 TimelineBloc 与 TimelinePage 可共享渲染和排序逻辑
- **日期**: 第18轮

## DEC-022: 通知系统采用 NotificationService + UseCase 双层架构
- **决定**: 服药提醒拆为 core 层 `NotificationService` 与 feature 层 `SyncMedicationReminders` UseCase
- **理由**: 通知能力属于跨 feature 基础设施，提醒同步策略又明显属于 medication 业务规则
- **日期**: 第19轮

## DEC-023: SettingsBloc 改为 @lazySingleton 统一 blurOverlay 状态
- **决定**: `SettingsBloc` 改为 `@lazySingleton`
- **理由**: `blurOverlay` 是全局 UI 状态，设置页与 app 层必须共用同一实例
- **日期**: 第19轮

## DEC-024: PK 模拟器 V1 使用确定性模型 + 文献参数预设
- **决定**: V1 只实现确定性三室模型解析解，使用文献参数预设值，不做 MCMC 参数推断
- **理由**: MCMC 在纯 Dart 中计算量过大，而预设参数已能满足大多数用户的参考需求
- **参考**: estrannaise.js
- **日期**: 第20轮

## DEC-025: PK Engine V2 — 双库全路由架构
- **决定**: V2 使用 dual-depot 注射 + Bateman 口服 / 凝胶 + dual-path 舌下 + zero-order 贴片，速率常数统一为 `h⁻¹`
- **理由**: 单库模型无法捕获油库释放双相动力学；统一单位避免实现混乱
- **日期**: 第21轮

## DEC-026: MAP 校准 — 坐标搜索 + L2 正则
- **决定**: `CalibratePkParams` 使用坐标搜索（5 点网格 × 3 轮）+ λ=0.1 L2 正则，少于 2 个血检点时回退群体参数
- **理由**: 移动端可毫秒级完成，且能避免过拟合
- **日期**: 第21轮

## DEC-027: Hana-PK 原创实验引擎
- **决定**: 并行开发 Hana-PK 实验引擎（Weibull 注射 + E1S 储库口服 + 双通道舌下）
- **理由**: 用更少参数表达更复杂吸收形状，并补全口服 / 舌下长尾
- **风险**: 无闭式稳态解，需要数值收敛
- **日期**: 第22轮

## DEC-028: AI 增强 PK — 可行性评估（探索性）
- **决定**: 三层 AI 方案标记为探索性功能，不纳入当前实现计划
- **理由**: 必须建立在经典引擎稳定之上
- **日期**: 第22轮（评估完成）

## DEC-029: Weibull β>1 + kEl=0.05 修正
- **决定**: 将 Hana-PK 注射参数改为 `β>1`（S 型吸收）+ `kEl=0.05 h⁻¹`
- **理由**: 更符合油库释放 lag → peak → tail 的物理过程，同时保持现实半衰期
- **日期**: 第24轮

## DEC-030: Measurement feature 采用与 Journal 同款 Clean Architecture 分层
- **决定**: Measurement 独立 feature 目录，domain 零 Flutter 依赖，icon 映射放在 Presentation 层
- **理由**: 保持结构一致，延续 RecordBloc 聚合模式
- **日期**: 第25轮

## DEC-031: Photo 加密存储管线设计
- **决定**: 照片在内存中加密后写入应用沙盒 `photos/{uuid}.enc`，元数据存 SQLite，缩略图独立加密
- **理由**: 明文永不落盘，兼顾隐私和列表页性能
- **日期**: 第26轮

## DEC-032: Photo UI 缩略图缓存 + 懒解密策略
- **决定**: `PhotoBloc` 维护内存 `thumbnailCache`；列表页只解密缩略图，查看页才解密原图
- **理由**: 避免列表页解密大量原图导致卡顿，同时避免重复解密
- **日期**: 第27轮

## DEC-033: 发布准备策略 — 两轮制
- **决定**: Round 28 完成错误边界 / lint / icon / 记忆同步，Round 29 完成 i18n / dartdoc / ErrorBoundary 增强 / icon 修复
- **理由**: 将发布准备拆成两轮，分别聚焦自动化质量与手动验证
- **日期**: 第28轮

## DEC-034: ErrorBoundary 初始化失败兜底
- **决定**: 当 main 初始化链抛出异常时，ErrorBoundary 自动 `runApp(ErrorFallbackPage)` 而不是直接崩溃
- **理由**: 用户需要看到可理解的失败界面，而不是黑屏或闪退
- **日期**: 第29轮

## DEC-035: 应用标识符与打包配置正式化
- **决定**: 将 `applicationId` / `bundleIdentifier` 从 `com.example.hananote` 改为正式 ID；统一品牌名为 HanaNote
- **理由**: `com.example.*` 无法用于正式上架，且品牌一致性影响用户信任
- **日期**: 第30轮

## DEC-036: SettingsBloc 延迟加载
- **决定**: 不在 app 启动时立即加载 `SettingsDashboard`，而是在需要时再触发
- **理由**: Dashboard 依赖 SQLCipher 数据库；在数据库尚未 open 前访问会触发 `Database is not open.`
- **日期**: 第32轮

## DEC-037: SettingsBloc 在 auth 通过后立即加载
- **决定**: `AuthWrapperPage` 在 `AuthUnlocked` 时先 dispatch `LoadSettingsDashboard` 再导航
- **理由**: `AppBlurOverlay` 和 TodayPage 问候语都依赖 `SettingsLoaded`，不能只等到 `/profile` 再加载
- **替代方案**: 在 `app.dart` 创建时加载，但那会重新引入 DEC-036 的数据库时序问题
- **日期**: 第33轮

## DEC-038: enum displayName 中文化
- **决定**: 为 `DrugCategory`、`AdministrationRoute`、`DosageUnit` 增加 `displayName` extension
- **理由**: 避免 UI 直接暴露 Dart enum 内部 `name`，提升中文用户体验
- **日期**: 第34轮

## DEC-039: UI 文本系统性迁移到 ARB
- **决定**: 系统性将所有用户可见 UI 文本迁移至 ARB + AppLocalizations
- **理由**: 硬编码中文导致 Agent 反复生成空字符串，且阻断未来多语言支持
- **例外**: `_dailyQuotes` 语录列表暂保留硬编码，待内容管理系统就绪后迁移
- **日期**: 第36轮
