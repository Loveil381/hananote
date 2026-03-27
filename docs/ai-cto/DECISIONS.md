# HanaNote — 技术决策记录
> 每个重大决策记录理由和替代方案

## DEC-001: Feature-First 目录结构
- **决定**: 使用 Feature-First 而非 Layer-First
- **理由**: 功能模块多且独立，Feature-First 让 Agent 可并行开发
- **替代方案**: Layer-First (lib/domain/, lib/data/, lib/presentation/) — 文件跨越多目录，不利于并行
- **日期**: 第零轮

## DEC-002: 安全第一架构
- **决定**: CryptoEngine 是第一个实现的模块
- **理由**: 隐私是产品第一卖点，不存在"先明文开发后面加密"的路径
- **风险**: 开发初期增加复杂度，但避免了后期全面重构
- **日期**: 第零轮

## DEC-003: flutter_bloc 而非 Riverpod
- **决定**: 使用 flutter_bloc
- **理由**: 事件驱动模式更适合数据密集型App，BLoC测试成熟
- **替代方案**: Riverpod — 更轻量但对复杂状态的可测试性不如 BLoC
- **日期**: 第零轮

## DEC-004: fpdart Either 模式
- **决定**: 所有异步操作返回 Either<Failure, T>
- **理由**: 类型安全的错误处理，编译时强制处理错误路径
- **替代方案**: try-catch — 运行时错误容易遗漏
- **日期**: 第零轮

## DEC-005: Freezed 数据模型
- **决定**: 所有实体和模型用 Freezed 生成
- **理由**: 30+围度、30+血检指标的复杂模型手写是bug温床
- **替代方案**: 手写 — 维护成本高，容易遗漏 copyWith/equality
- **日期**: 第零轮

## DEC-006: 社区反馈隐私增强
- **决定**: 添加应用切换模糊遮罩、剪贴板保护、备份密钥分离
- **理由**: 目标用户社区实际反馈，非协商性需求
- **日期**: 第7轮

## DEC-007: 5-Tab 信息架构
- **决定**: 底部导航从3Tab改为5Tab (今日/记录/轨迹/数据/我的)
- **理由**: "记录"聚合日常录入动作使其突出，"轨迹"作为核心叙事线提升留存，"我的"收纳低频操作
- **替代方案**: 原3Tab方案将太多功能挤在一个Tab下
- **日期**: 第8轮

## DEC-008: Stitch 设计稿优先策略
- **决定**: 先用 Google Stitch 生成全部页面设计稿，再翻译为 Flutter
- **理由**: 设计稿锁定视觉规范避免实现时偏移，HTML/CSS提供精确的色彩/间距/字体值
- **日期**: 第8轮

## DEC-009: UI优先于加密实现
- **决定**: 将 CryptoEngine/SecureDatabase 从 P0 降为 P1，UI 实现提升为 P0
- **理由**: 需要可视化的 App 验证设计效果和用户体验，加密层可在UI稳定后接入不会破坏架构
- **日期**: 第8轮

## DEC-010: 全部5Tab UI壳完成后转向数据绑定
- **决定**: 停止新UI页面开发，转向将已有Cubit接入已完成的UI壳
- **理由**: 5个Tab全部是硬编码假数据，继续铺UI不产生用户价值；已有MedicationCubit是现成的数据源
- **第一个接入点**: Today Tab + MedicationCubit
- **日期**: 第12轮

## DEC-011: git安全规则写入AGENTS.md
- **决定**: 将禁止force-push、禁止跨分支push、禁止删除未合并分支三条规则写入AGENTS.md
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
- **日期**: round 16

## DEC-017: 日记编辑页直接注入 UseCase 而非创建独立 Bloc
- **决定**: 日记编辑页直接注入 UseCase 而非创建独立 Bloc，因为编辑页是一次性操作页面，不需要持续状态管理。
- **日期**: round 16

## DEC-018: Settings feature 使用 FlutterSecureStorage 存储简单配置
- **决定**: Settings feature 使用 FlutterSecureStorage（key-value）而非 SQLite 存储 UserProfile 和 AppSettings，因为这些是非关系型简单配置数据，不需要 SQL 查询能力。
- **日期**: round 17

## DEC-019: RecordBloc 改为 lazySingleton 修复刷新链路
- **决定**: RecordBloc 从 @injectable 改为 @lazySingleton，确保 JournalEditPage 保存后能正确触发 RecordPage 刷新。此为 Round 16 的 bug fix。
- **日期**: round 17

## DEC-020: Timeline 采用跨 Feature 只读聚合模式
- **决定**: Timeline UseCase 直接注入 MedicationRepository、BloodTestRepository、JournalRepository 与 SettingsRepository 做只读聚合，不新增中间层。
- **原因**: Timeline 本质是跨模块展示流，聚合逻辑集中在 UseCase 中最直接，也能让单一数据源失败时 graceful degradation，不阻塞整个时间线。
- **日期**: round 18

## DEC-021: TimelineEvent 使用统一实体与 metadata 扩展
- **决定**: Timeline 统一使用 TimelineEvent 实体，而不是按 medication / blood test / journal 各自定义 union type；原始上下文通过 metadata Map 保留。
- **原因**: 单一事件模型可以让 TimelineBloc 与 TimelinePage 共享一套渲染与排序逻辑，同时为后续详情页、交互扩展和新增事件类型预留弹性。
- **日期**: round 18
