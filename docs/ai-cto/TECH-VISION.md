---
# 技术愿景
> 最后更新: 2026-04-06 | 会话轮次: #46

## 架构评判
当前 Feature-First Clean Architecture 已证明可行：11 个独立 feature module，domain 层零 Flutter 依赖，BLoC/Cubit 状态管理统一，get_it + injectable DI。架构能支撑当前所有功能和近期规划。

与理想架构的差距：缺少 CI/CD 流水线、缺少崩溃监控、缺少设计系统文件（DESIGN.md）、二级页面 UI 与主页面设计语言不统一。

## 根本性改变建议
1. **CI/CD 流水线**：GitHub Actions 最小配置（analyze + test + build），防止"在废墟上盖楼"。服务于产品目标：保证每次推送的代码质量基线。
2. **设计系统统一**：从 hana_colors.dart 提取 DESIGN.md，用 Stitch 重做二级页面。服务于产品目标：用户体验一致性。
3. **崩溃监控**：Firebase Crashlytics 集成。服务于产品目标：上线后快速发现问题。

## 如果只能做三件事
1. 二级页面 UI 统一（直接影响用户第一印象）
2. CI/CD 流水线（防止质量退化）
3. 数据导入功能（用户数据安全感）

## 创新机会
- PK 模拟器已有双引擎（V2 + Hana-PK），对比验证后可作为差异化卖点
- 加密存储管线（PIN + 生物识别 + SQLCipher + AES-256-GCM）在同类 App 中罕见

## 技术选型挑战
当前选型（Flutter + Dart + SQLCipher + flutter_bloc）能支撑终态。不需要替换。
fl_chart 已验证可用于趋势图。share_plus + url_launcher 已引入。

## 性能关注点
- Photo 加密解密在大量照片时可能成为瓶颈（缩略图缓存策略已实现 DEC-032）
- PK 模拟器数值计算在低端设备上的帧率待验证

## 工程基础设施需求
- CI/CD：GitHub Actions — ✅ R46 已搭建 (analyze + test + build)
- 崩溃监控：Firebase Crashlytics（未集成）
- 可观测性：Firebase Analytics（未集成）
- 无障碍：零支持，需全局补充 semanticLabel/Semantics（R46 发现）
---
