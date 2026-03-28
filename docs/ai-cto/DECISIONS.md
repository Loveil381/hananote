# HanaNote — 技术决策记录
> 每个重大决策记录理由和替代方案

## DEC-001: Feature-First 目录结构
- **决定**: 使用 Feature-First 而非 Layer-First
- **理由**: 功能模块多且独立，Feature-First 让 Agent 可并行开发
- **替代方案**: Layer-First (lib/domain/, lib/data/, lib/presentation/) — 文件跨越多目录，不利于并行
- **日期**: 第零轮

## DEC-002: 安全第一架构
- **决定**: CryptoEngine 是第一个实现的模块
- **理由**: 隐私是产品第一卖点，不存在“先明文开发后面加密”的路径
- **风险**: 开发初期增加复杂度，但避免了后期全面重构
- **日期**: 第零轮

## DEC-003: flutter_bloc 而非 Riverpod
- **决定**: 使用 flutter_bloc
- **理由**: 事件驱动模式更适合数据密集型 App，BLoC 测试成熟
- **替代方案**: Riverpod — 更轻量但对复杂状态的可测试性不如 BLoC
- **日期**: 第零轮

## DEC-004: fpdart Either 模式
- **决定**: 所有异步操作返回 Either<Failure, T>
- **理由**: 类型安全的错误处理，编译时强制处理错误路径
- **替代方案**: try-catch — 运行时错误容易遗漏
- **日期**: 第零轮

## DEC-005: Freezed 数据模型
- **决定**: 所有实体和模型用 Freezed 生成
- **理由**: 30+ 围度、30+ 血检指标的复杂模型手写是 bug 温床
- **替代方案**: 手写 — 维护成本高，容易遗漏 copyWith/equality
- **日期**: 第零轮

## DEC-006: 社区反馈隐私增强
- **决定**: 添加应用切换模糊遮罩、剪贴板保护、备份密钥分离
- **理由**: 目标用户社区实际反馈，非协商性需求
- **日期**: 第7轮

## DEC-007: 5-Tab 信息架构
- **决定**: 底部导航从 3 Tab 改为 5 Tab (今日/记录/轨迹/数据/我的)
- **理由**: “记录”聚合日常录入动作使其突出，“轨迹”作为核心叙事线提升留存，“我的”收纳低频操作
- **替代方案**: 原 3 Tab 方案将太多功能挤在一个 Tab 下
- **日期**: 第8轮

## DEC-008: Stitch 设计稿优先策略
- **决定**: 先用 Google Stitch 生成全部页面设计稿，再翻译为 Flutter
- **理由**: 设计稿锁定视觉规范避免实现时偏移，HTML/CSS 提供精确的色彩/间距/字体值
- **日期**: 第8轮

## DEC-009: UI 优先于加密实现
- **决定**: 将 CryptoEngine/SecureDatabase 从 P0 降为 P1，UI 实现提升为 P0
- **理由**: 需要可视化的 App 验证设计效果和用户体验，加密层可在 UI 稳定后接入不会破坏架构
- **日期**: 第8轮

## DEC-010: 全部 5 Tab UI 壳完成后转向数据绑定
- **决定**: 停止新 UI 页面开发，转向将已有 Cubit 接入已完成的 UI 壳
- **理由**: 5 个 Tab 全部是硬编码假数据，继续铺 UI 不产生用户价值；已有 MedicationCubit 是现成的数据源
- **第一个接入点**: Today Tab + MedicationCubit
- **日期**: 第12轮

## DEC-011: git 安全规则写入 AGENTS.md
- **决定**: 将禁止 force-push、禁止跨分支 push、禁止删除未合并分支三条规则写入 AGENTS.md
- **理由**: Round 8-9 期间多次出现分支丢失和合并事故
- **日期**: 第9轮（补录）

## DEC-012: Argon2id 替换 PBKDF2
- **决定**: 将 KeyManager 的密钥派生算法从 PBKDF2-HMAC-SHA256 升级为 Argon2id
- **理由**: Argon2id 是 memory-hard 算法，对 GPU/ASIC 暴力破解的抵抗力远优于 PBKDF2；OWASP 2024 推荐 Argon2id 作为首选
- **参数**: memory=64MB, iterations=3, parallelism=4, hashLength=32
- **依赖**: hashlib 包 (纯 Dart，无 FFI)
- **日期**: 第13轮

## DEC-013: Auth UI 迁移到设计系统 v2
- **决定**: 将 LockScreenPage 和 SetupPage 从硬编码颜色迁移到 HanaColors
- **理由**: 保持全 App 视觉一致性，消除设计债务
- **日期**: 第13轮

## DEC-014: BloodTest feature 采用 Medication 同款分层
- **决定**: BloodTest feature 采用与 Medication 相同的 Clean Architecture 分层（entity → repository → usecase → bloc → UI）
- **理由**: 保持 feature 间结构一致，便于并行开发、复用测试模式和后续数据绑定扩展
- **补充**: HormoneType enum 内嵌 WPATH / Endocrine Society 目标范围，用于自动状态判定
- **日期**: 第15轮

## DEC-015: Data Tab 趋势图迁移到 fl_chart
- **决定**: Data Tab 趋势图从 CustomPaint 迁移至 fl_chart
- **理由**: 支持交互式 tooltip、动态时间范围切换，并降低自绘图表维护成本
- **日期**: 第15轮

## DEC-016: Journal feature 采用与 Medication/BloodTest 同款 Clean Architecture 分层
- **决定**: Journal feature 采用与 Medication/BloodTest 同款 Clean Architecture 分层。RecordBloc 作为 Record Tab 的统一聚合 Bloc，当前驱动 Journal 元数据，Phase 2 将扩展 Photo 和 Measurement。
- **日期**: 第16轮

## DEC-017: 日记编辑页直接注入 UseCase 而非创建独立 Bloc
- **决定**: 日记编辑页直接注入 UseCase 而非创建独立 Bloc，因为编辑页是一次性操作页面，不需要持续状态管理。
- **日期**: 第16轮

## DEC-018: Settings feature 使用 FlutterSecureStorage 存储简单配置
- **决定**: Settings feature 使用 FlutterSecureStorage（key-value）而非 SQLite 存储 UserProfile 和 AppSettings，因为这些是非关系型简单配置数据，不需要 SQL 查询能力。
- **日期**: 第17轮

## DEC-019: RecordBloc 改为 lazySingleton 修复刷新链路
- **决定**: RecordBloc 从 @injectable 改为 @lazySingleton，确保 JournalEditPage 保存后能正确触发 RecordPage 刷新。此为 Round 16 的 bug fix。
- **日期**: 第17轮

## DEC-020: Timeline 采用跨 Feature 只读聚合模式
- **决定**: Timeline UseCase 直接注入 MedicationRepository、BloodTestRepository、JournalRepository 与 SettingsRepository 做只读聚合，不新增中间层。
- **原因**: Timeline 本质是跨模块展示流，聚合逻辑集中在 UseCase 中最直接，也能让单一数据源失败时 graceful degradation，不阻塞整个时间线。
- **日期**: 第18轮

## DEC-021: TimelineEvent 使用统一实体与 metadata 扩展
- **决定**: Timeline 统一使用 TimelineEvent 实体，而不是按 medication / blood test / journal 各自定义 union type；原始上下文通过 metadata Map 保留。
- **原因**: 单一事件模型可以让 TimelineBloc 与 TimelinePage 共享一套渲染与排序逻辑，同时为后续详情页、交互扩展和新增事件类型预留弹性。
- **日期**: 第18轮

## DEC-022: 通知系统采用 NotificationService + UseCase 双层架构
- **决定**: 服药提醒通知系统拆为 core 层的 NotificationService 与 feature 层的 SyncMedicationReminders UseCase；core 负责平台通知封装，feature 负责从 MedicationRepository 编排同步逻辑。
- **原因**: 通知能力属于跨 feature 基础设施，不应依赖 medication 领域；而提醒同步策略又明显属于 medication 业务规则，双层拆分可以同时保持复用性与边界清晰。
- **日期**: 第19轮

## DEC-023: SettingsBloc 改为 @lazySingleton 统一 blurOverlay 状态
- **决定**: SettingsBloc 改为 @lazySingleton，让 app.dart 中的 AppBlurOverlay 和 ProfilePage 复用同一实例。
- **原因**: blurOverlay 开关属于全局 UI 状态，如果 app 层和设置页分别持有不同 bloc 实例，会导致用户切换隐私开关后全局遮罩状态不同步。
- **日期**: 第19轮

## DEC-024: PK 模拟器 V1 使用确定性模型 + 文献参数预设
- **决定**: V1 只实现确定性三室模型解析解，使用文献中发表的 k1/k2/k3 参数预设值，不做 MCMC 参数推断。
- **原因**: MCMC 在纯 Dart 中计算量极大，而预设参数已能满足 95% 用户的参考需求；V2 可考虑加入个人血检数据校准。
- **参考**: estrannaise.js (https://estrannai.se/docs/ingredients/)
- **日期**: 第20轮

## DEC-025: PK Engine V2 — 双库全路由架构
- **决定**: V2 引擎使用 dual-depot 注射 + Bateman 口服/凝胶 + dual-path 舌下 + zero-order 贴片，所有速率常数统一为 h⁻¹
- **理由**: 单库三室无法捕获油库释放的双相动力学；h⁻¹ 统一避免单位混乱
- **参考**: LaoZhong/Oyama HRT Tracker 双库参数表
- **日期**: 第21轮

## DEC-026: MAP 校准 — 坐标搜索 + L2 正则
- **决定**: CalibratePkParams 用坐标搜索（5 点网格 × 3 轮）+ λ=0.1 L2 正则，少于 2 个血检点时回退群体参数
- **理由**: 网格搜索在移动端毫秒级完成，正则化防止过拟合，最小数据门槛保障安全
- **日期**: 第21轮

## DEC-027: Hana-PK 原创实验引擎
- **决定**: 并行开发 Hana-PK 实验引擎（Weibull 注射 + E1S 储库口服 + 双通道舌下），与 V2 双库引擎共存，通过对比测试决定是否升级为默认
- **理由**: Weibull 吸收以连续形状参数替代离散双指数叠加，更少参数更强表达力；E1S 储库补全口服/舌下长尾；k_el 全局统一实现物理自洽
- **风险**: Weibull 无闭合稳态解，需数值收敛；β/τ 初始值来自曲线形状推导而非统计拟合
- **日期**: 第22轮

## DEC-028: AI 增强 PK — 可行性评估（探索性）
- **决定**: 三层 AI 方案（LLM 参数顾问 / Neural-ODE 端侧推理 / 混合体）标记为探索性功能，不纳入当前实现计划
- **理由**: 需要经典引擎稳定为基础；Tier 1 可最快落地但依赖网络；Tier 2 精度最高但需训练 pipeline
- **日期**: 第22轮（评估完成）

## DEC-029: Weibull β>1 + kEl=0.05 修正
- **决定**: 将 Hana-PK 注射参数改为 β>1（S 型吸收）+ kEl=0.05 h⁻¹（注射消除率）
- **背景**: 最初 β<1 + kEl=0.05 导致吸收前置、Tmax 过早；尝试 β>1 + kEl=0.38 失败，因为 kEl=0.38 属于口服首过相关量级，不适用于注射路由，会让药物在吸收完成前被过快清除
- **理由**: β>1 更符合油库释放的 lag → peak → tail 物理过程，kEl=0.05 则与注射 E2 的实际消除半衰期（约 14h）一致
- **参考**: V2 PkEngine k3=0.05; Kalicharan oil-depot release study
- **日期**: 第24轮

## DEC-030: Measurement feature 采用与 Journal 同款 Clean Architecture 分层
- **决定**: Measurement 独立 feature 目录，domain 零 Flutter 依赖，icon 映射放在 Presentation 层
- **理由**: 保持 feature 间结构一致（DEC-016 延续），RecordBloc 聚合扩展模式已验证
- **日期**: 第25轮

## DEC-031: Photo 加密存储管线设计
- **决定**: 照片在内存中加密后写入应用沙盒 `photos/{uuid}.enc`，元数据存 SQLite，缩略图独立加密存储；明文永不落盘
- **理由**: 隐私第一（DEC-002 延续）；缩略图独立加密避免列表页解密原图的性能问题；文件名用 UUID 不含可识别信息
- **关键约束**: 不使用系统相册（AGENTS.md 铁律）；密钥来自 KeyManager 会话缓存
- **日期**: 第26轮

## DEC-032: Photo UI 缩略图缓存 + 懒解密策略
- **决定**: PhotoBloc 维护内存 thumbnailCache (Map<String, Uint8List>)；列表页仅解密缩略图 (.enc_thumb)，查看页才解密原图；查看页过渡期先显示缩略图再切换全尺寸图
- **理由**: 避免列表页触发大量原图解密导致卡顿；缩略图 ≤50KB 解密极快；内存缓存避免重复解密
- **日期**: 第27轮

## DEC-033: 发布准备策略 — 两轮制
- **决定**: Round 28 完成错误边界/lint/icon/记忆同步，Round 29 完成 i18n/dartdoc/ErrorBoundary 增强/icon 修复
- **理由**: 将发布准备拆为两轮降低单轮复杂度，R28 聚焦可自动化的代码质量，R29 聚焦手动验证项
- **日期**: 第28轮

## DEC-034: ErrorBoundary 初始化失败兜底
- **决定**: 当 main 初始化链（DI / NotificationService / timezone）抛出异常时，ErrorBoundary 自动调用 runApp 显示 ErrorFallbackPage，而不是让 app 无 UI 崩溃
- **理由**: 用户在没有开发者工具的情况下遇到初始化错误，需要看到友好界面而不是黑屏或闪退
- **日期**: 第29轮

## DEC-035: 应用标识符与打包配置正式化
- **决定**: 将 applicationId / bundleIdentifier 从 com.example.hananote 改为正式域名反转 ID；配置 Android release signing；统一品牌名为 HanaNote
- **理由**: com.example.* 被 App Store 和 Play Store 拒绝；debug keystore 无法生成可发布的 AAB；品牌名一致性影响用户信任
- **日期**: 第30轮

## DEC-036: SettingsBloc 延迟加载
- **决定**: SettingsBloc 不再在 app 启动时立即查询 dashboard，而是等数据库可用后再加载
- **理由**: Settings dashboard 依赖 medication / inventory 数据；如果 SQLCipher 数据库尚未 open，就会触发 `Database is not open.` 并让 Profile 页面长期停留在 loading
- **日期**: 第32轮

## DEC-037: SettingsBloc 在 auth 通过后立即加载
- **决定**: AuthWrapperPage 在 AuthUnlocked 时先 dispatch LoadSettingsDashboard 再导航
- **理由**: DEC-036 将加载延迟到 /profile，但 AppBlurOverlay 和 TodayPage 的问候语都依赖 SettingsLoaded 状态。不加载会导致 blur overlay 行为异常和显示硬编码假数据
- **替代方案**: 在 app.dart 创建时加载——但此时数据库可能未 open，会触发 DEC-036 描述的问题
- **日期**: 第33轮

## DEC-038: 枚举 displayName 中文化
- **决定**: 为 DrugCategory、AdministrationRoute、DosageUnit 添加 displayName extension
- **理由**: 避免 UI 暴露 Dart enum 内部 name，提升中文用户体验
- **日期**: 第34轮

## DEC-039: 发布前优先接通真实功能入口
- **决定**: 在发布前收尾阶段，优先修复 Profile / Data / Timeline / Today 中“看起来可点击但没有实际行为”的入口，路由可达性优先于装饰完整度
- **理由**: 核心入口不可达会直接损害首次试用体验；相比继续堆叠视觉细节，先让用户能进入药物列表、血检录入、日记和个人页更重要
- **日期**: 第36轮
