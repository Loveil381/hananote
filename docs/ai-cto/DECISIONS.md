# HanaNote — 技术决策记录
> 每个重大决策记录理由和替代方案

## DEC-001: Feature-First 目录结构
- **决定**: 使用 Feature-First 而非 Layer-First
- **理由**: 功能模块多且独立，Feature-First 让 Agent 可并行开发
- **替代方案**: Layer-First (`lib/domain/`, `lib/data/`, `lib/presentation/`) 不利于并行协作
- **日期**: 第零轮

## DEC-002: 安全第一架构
- **决定**: `CryptoEngine` 是第一个实现的模块
- **理由**: 隐私是产品第一卖点，不存在“先明文开发后面加密”的路径
- **风险**: 开发初期增加复杂度，但避免后期全面重构
- **日期**: 第零轮

## DEC-003: flutter_bloc 而非 Riverpod
- **决定**: 使用 `flutter_bloc`
- **理由**: 事件驱动模式更适合数据密集型 App，BLoC 测试生态成熟
- **替代方案**: Riverpod 更轻量，但复杂状态的可测试性与约束性不足
- **日期**: 第零轮

## DEC-004: fpdart Either 模式
- **决定**: 所有异步操作返回 `Either<Failure, T>`
- **理由**: 类型安全的错误处理，编译时强制覆盖错误路径
- **替代方案**: `try-catch` 易漏掉错误路径
- **日期**: 第零轮

## DEC-005: Freezed 数据模型
- **决定**: 所有实体和模型用 Freezed 生成
- **理由**: 复杂模型手写是 bug 温床
- **替代方案**: 手写 `copyWith` / equality 维护成本高
- **日期**: 第零轮

## DEC-006: 社区反馈隐私增强
- **决定**: 添加应用切换模糊遮罩、剪贴板保护、备份密钥分离
- **理由**: 目标用户社区实际反馈，属于非协商性需求
- **日期**: 第7轮

## DEC-007: 5-Tab 信息架构
- **决定**: 底部导航从 3 Tab 改为 5 Tab（今日 / 记录 / 轨迹 / 数据 / 我的）
- **理由**: 记录入口更突出，轨迹成为核心叙事线，我的承载低频操作
- **替代方案**: 原 3 Tab 会导致功能过度堆叠
- **日期**: 第8轮

## DEC-008: Stitch 设计稿优先策略
- **决定**: 先用 Google Stitch 生成页面设计稿，再翻译为 Flutter
- **理由**: 先锁定视觉规范，避免实现阶段漂移
- **日期**: 第8轮

## DEC-009: UI 优先于加密实现
- **决定**: 将 `CryptoEngine` / `SecureDatabase` 从 P0 降为 P1，UI 实现提升为 P0
- **理由**: 需要先有可视化 App 验证体验，再接入加密层
- **日期**: 第8轮

## DEC-010: 5 Tab UI 壳完成后转向数据绑定
- **决定**: 停止新 UI 页面开发，转向将已有 Cubit / Bloc 接入 UI 壳
- **理由**: 硬编码假数据不再产生用户价值
- **第一个接入点**: Today Tab + MedicationCubit
- **日期**: 第12轮

## DEC-011: git 安全规则写入 AGENTS.md
- **决定**: 将禁止 force-push、禁止跨分支 push、禁止删除未合并分支写入 AGENTS.md
- **理由**: 早期多次出现分支丢失和错误合并事故
- **日期**: 第9轮（补录）

## DEC-012: Argon2id 替换 PBKDF2
- **决定**: `KeyManager` 的密钥派生算法升级为 Argon2id
- **理由**: Argon2id 抗 GPU / ASIC 暴力破解能力更强，符合 OWASP 推荐
- **参数**: `memory=64MB, iterations=3, parallelism=4, hashLength=32`
- **依赖**: `hashlib`
- **日期**: 第13轮

## DEC-013: Auth UI 迁移到设计系统 v2
- **决定**: 将 `LockScreenPage` 和 `SetupPage` 从硬编码颜色迁移到 HanaColors
- **理由**: 保持全 App 视觉一致性
- **日期**: 第13轮

## DEC-014: BloodTest feature 采用 Medication 同款分层
- **决定**: BloodTest feature 采用 `entity → repository → usecase → bloc → UI` 分层
- **理由**: 保持 feature 间结构一致，便于并行开发与复用测试模式
- **补充**: `HormoneType` 内嵌 WPATH / Endocrine Society 目标范围
- **日期**: 第15轮

## DEC-015: Data Tab 趋势图迁移到 fl_chart
- **决定**: Data Tab 趋势图从 `CustomPaint` 迁移到 `fl_chart`
- **理由**: 支持交互 tooltip、时间范围切换，降低自绘维护成本
- **日期**: 第15轮

## DEC-016: Journal feature 沿用统一 Clean Architecture 分层
- **决定**: Journal 采用与 Medication / BloodTest 同款分层；`RecordBloc` 作为 Record Tab 聚合层
- **理由**: 统一 feature 结构，便于后续 Measurement / Photo 扩展
- **日期**: 第16轮

## DEC-017: 日记编辑页直接注入 UseCase
- **决定**: 日记编辑页直接注入 UseCase，而非新建独立 Bloc
- **理由**: 编辑页是一次性操作页面，不需要长期状态管理
- **日期**: 第16轮

## DEC-018: Settings feature 使用 FlutterSecureStorage
- **决定**: Settings 使用 `FlutterSecureStorage` 存储 `UserProfile` / `AppSettings`
- **理由**: 这些数据是简单 key-value，不需要 SQL 查询能力
- **日期**: 第17轮

## DEC-019: RecordBloc 改为 lazySingleton
- **决定**: `RecordBloc` 从 `@injectable` 改为 `@lazySingleton`
- **理由**: 确保保存日记后能正确触发 RecordPage 刷新
- **日期**: 第17轮

## DEC-020: Timeline 采用跨 Feature 只读聚合
- **决定**: Timeline UseCase 直接注入多个 Repository 做只读聚合
- **理由**: 聚合逻辑集中在 UseCase 最直接，也便于 graceful degradation
- **日期**: 第18轮

## DEC-021: TimelineEvent 使用统一实体与 metadata 扩展
- **决定**: Timeline 统一使用 `TimelineEvent`，原始上下文放入 metadata
- **理由**: 统一渲染、排序与扩展路径
- **日期**: 第18轮

## DEC-022: 通知系统采用 NotificationService + UseCase 双层架构
- **决定**: 核心层负责平台通知封装，feature 层负责提醒同步策略
- **理由**: 复用性与业务边界都更清晰
- **日期**: 第19轮

## DEC-023: SettingsBloc 改为 @lazySingleton 统一 blurOverlay 状态
- **决定**: `SettingsBloc` 改为 `@lazySingleton`
- **理由**: 全局遮罩与设置页必须共享同一状态源
- **日期**: 第19轮

## DEC-024: PK 模拟器 V1 使用确定性模型 + 文献参数预设
- **决定**: V1 只实现确定性三室模型解析解，不做 MCMC 参数推断
- **理由**: 预设参数已满足大多数用户参考需求，计算成本显著更低
- **参考**: estrannaise.js
- **日期**: 第20轮

## DEC-025: PK Engine V2 双库全路由架构
- **决定**: V2 使用 dual-depot 注射 + Bateman 口服 / 凝胶 + dual-path 舌下 + zero-order 贴片
- **理由**: 更符合不同给药途径的真实动力学
- **日期**: 第21轮

## DEC-026: MAP 校准采用坐标搜索 + L2 正则
- **决定**: `CalibratePkParams` 使用 5 点网格 × 3 轮坐标搜索，`λ = 0.1`
- **理由**: 移动端可快速完成，且正则化能避免过拟合
- **日期**: 第21轮

## DEC-027: Hana-PK 原创实验引擎
- **决定**: 并行开发 Hana-PK 实验引擎，与 V2 共存并做对比验证
- **理由**: 以更少参数表达更复杂吸收曲线，探索更高拟合潜力
- **风险**: 数值收敛与参数初始化更复杂
- **日期**: 第22轮

## DEC-028: AI 增强 PK 仅做探索性评估
- **决定**: 三层 AI 方案标记为探索性功能，不纳入当前实现计划
- **理由**: 经典引擎稳定性优先
- **日期**: 第22轮

## DEC-029: Weibull β>1 + kEl=0.05 修正
- **决定**: 将 Hana-PK 注射参数改为 `β > 1`，`kEl = 0.05 h⁻¹`
- **理由**: 更符合油库释放 lag → peak → tail 的物理过程
- **参考**: V2 `k3 = 0.05`
- **日期**: 第24轮

## DEC-030: Measurement feature 采用统一 Clean Architecture 分层
- **决定**: Measurement 独立 feature，domain 零 Flutter 依赖，icon 映射留在 presentation 层
- **理由**: 保持 feature 间结构一致
- **日期**: 第25轮

## DEC-031: Photo 加密存储管线设计
- **决定**: 照片在内存中加密后写入应用沙盒，明文永不落盘
- **理由**: 隐私第一；缩略图独立加密，列表页性能更稳
- **关键约束**: 不使用系统相册；密钥来自 `KeyManager` 会话缓存
- **日期**: 第26轮

## DEC-032: Photo UI 缩略图缓存 + 懒解密策略
- **决定**: `PhotoBloc` 维护 `thumbnailCache`，列表页只解密缩略图，查看页再解密原图
- **理由**: 避免列表页一次性解密大量原图导致卡顿
- **日期**: 第27轮

## DEC-033: 发布准备策略 — 两轮制
- **决定**: Round 28 完成错误边界 / lint / icon / 记忆同步，Round 29 完成 i18n / dartdoc / ErrorBoundary 增强 / icon 修复
- **理由**: 将发布准备拆为两轮降低单轮复杂度
- **日期**: 第28轮

## DEC-034: ErrorBoundary 初始化失败兜底
- **决定**: main 初始化链抛错时，自动 `runApp(ErrorFallbackPage)`，而非无 UI 崩溃
- **理由**: 用户在没有开发者工具时也需要看到友好兜底界面
- **日期**: 第29轮

## DEC-035: 应用标识符与打包配置正式化
- **决定**: `applicationId` / `bundleIdentifier` 从 `com.example.hananote` 改为正式 ID，统一品牌名为 HanaNote
- **理由**: 商店上架与发布签名要求决定了这一步必须完成
- **日期**: 第30轮

## DEC-036: SettingsBloc 延迟加载
- **决定**: 在数据库真正可用之后再加载 `SettingsDashboard`
- **理由**: SQLCipher 数据库未 open 前查询会触发 `Database is not open.`
- **日期**: 第32轮

## DEC-037: SettingsBloc 在 auth 通过后立即加载
- **决定**: `AuthWrapperPage` 在 `AuthUnlocked` 时先 dispatch `LoadSettingsDashboard` 再导航
- **理由**: `AppBlurOverlay` 与 TodayPage greeting 都依赖 `SettingsLoaded`
- **替代方案**: app 启动时直接加载，但会重现 DEC-036 的问题
- **日期**: 第33轮

## DEC-038: enum displayName 中文化
- **决定**: 为 `DrugCategory`、`AdministrationRoute`、`DosageUnit` 添加 `displayName` extension
- **理由**: UI 层不应直接暴露 Dart enum 内部 name
- **日期**: 第34轮

## DEC-039: UI 文本国际化迁移到 ARB
- **决定**: 系统性将所有用户可见 UI 文本迁移到 ARB + AppLocalizations
- **理由**: 硬编码中文会阻断未来多语言支持，也容易在自动改写时引入空字符串
- **例外**: `_dailyQuotes` 在第36轮时暂时保留硬编码，后续已继续迁移
- **日期**: 第36轮

## DEC-042: Enum UI 文案采用 localizedName(AppLocalizations)
- **决定**: UI 层不再直接使用 enum 的硬编码 `displayName`，而是通过 `enum_l10n.dart` 中的 `localizedName(l10n)` 扩展获取显示名称
- **理由**: enum getter 没有 `BuildContext`，直接把中文写进 domain / entity 扩展会让 UI 文案无法跟随 locale 切换
- **兼容策略**: 保留原有 `displayName` 以避免影响非 UI 代码，UI 层逐步迁移到 `localizedName`
- **日期**: 第39轮

## DEC-043: 表单验证消息使用 key 再由 UI 翻译
- **决定**: Cubit / Bloc 的验证结果只返回稳定的错误 key，页面层再映射到 ARB 本地化字符串
- **理由**: Presentation 状态管理层没有 `BuildContext`，直接返回硬编码文案会把 i18n 逻辑错误地下沉到状态层
- **适用范围**: `ScheduleEditorCubit` 及后续所有需要在无 context 环境下产出用户可见校验消息的状态管理类
- **日期**: 第39轮

## DEC-044: ScheduleEditor 路由进入时先拉取 drug 默认值
- **决定**: `/edit_schedule/:drugId` 不再直接 `initNew(drugId)`，而是统一调用 `ScheduleEditorCubit.loadForDrug(drugId)`
- **理由**: 新建或编辑方案都需要药物实体里的 `administrationRoute` 与 `defaultDosageUnit`；仅传 `drugId` 会导致单位下拉框缺失、编辑态初始化不完整
- **结果**: 编辑页现在优先读取现有 schedule；若不存在，再以 drug 默认 route / unit 进入新建态
- **日期**: 第40轮

## DEC-045: 底部导航栏毛玻璃效果通过 bottomNavigationBar 自身实现
- **决定**: 保持 `Scaffold.extendBody = false`，将 `BackdropFilter + 半透明背景 + 顶部边框` 放在 `bottomNavigationBar` 容器自身实现毛玻璃效果
- **理由**: `extendBody = true` 会让页面内容延伸到导航栏下方，导致底部内容遮挡；把模糊效果收口到导航栏自身，可以同时保留视觉质感和布局稳定性
- **日期**: 第41轮

## DEC-046: 顶部留白统一使用 SafeArea + AppBar 动态计算
- **决定**: 所有 `extendBodyBehindAppBar: true` 的页面，顶部内容留白统一使用 `MediaQuery.padding.top + kToolbarHeight + 16`
- **理由**: 硬编码 `100` 在不同设备、刘海屏和系统字体缩放下都不稳定；动态计算能让首屏内容始终落在导航栏下方的安全区域内
- **日期**: 第41轮
