# HanaNote — 产品与技术愿景
> 最后更新: 第零轮 (项目初始化)

## 产品愿景
HanaNote 是一款面向 MTF 跨性别群体的全能型个人 HRT 健康记录管理工具。
核心用户：中国大陆、日本、东南亚华人圈的跨性别女性，16-35岁为主。
核心承诺：极度注重隐私 + 科学数据驱动 + 二次元情感温暖。
定位：不是社交平台，不是远程医疗，是"她每天唯一可以安全地与自己的身体变化互动的私密空间"。

## 技术愿景
- Flutter 3.x 跨平台（iOS + Android）
- Clean Architecture + Feature-First
- 安全第一：CryptoEngine 贯穿全栈，SQLCipher 加密数据库，AES-256-GCM 照片加密
- 离线优先：核心功能零网络依赖
- 状态管理：flutter_bloc (BLoC/Cubit)
- 错误处理：Either<Failure, T> 模式

## 核心技术选型
| 领域 | 选择 | 理由 |
|------|------|------|
| 框架 | Flutter 3.x | 跨平台+Widget定制能力 |
| 状态管理 | flutter_bloc | 可测试性强 |
| 路由 | go_router | 声明式路由 |
| DI | get_it + injectable | 编译时注入 |
| 数据库 | sqflite_sqlcipher | 加密SQLite |
| 加密 | pointycastle + flutter_secure_storage | AES-256-GCM |
| 序列化 | freezed + json_serializable | 不可变模型 |
| 图表 | fl_chart | 趋势线+雷达图 |
| 测试 | bloc_test + mocktail | BLoC测试+Mock |
| Lint | very_good_analysis | 严格质量 |

## 架构图

Presentation → BLoC/Cubit → Domain (Use Cases + Entities) → Data (Repository Impl + DB + Crypto)


## 架构演进路线
- Phase 0: 项目骨架 + Core (Crypto + DB)
- Phase 1 (MVP前半): Medication Feature
- Phase 2 (MVP后半): BloodTest + Measurement + Privacy
- Phase 3 (V1.0): Photo + Journal + Timeline
- Phase 4 (V1.5): PK Simulator + Knowledge + OCR
- Phase 5 (V2.0): 二次元角色 + Achievements + Analytics
- Phase 6 (V2.5+): 云同步 + 社区
