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
