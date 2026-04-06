---
name: design-system-enforcement
description: >
  UI 代码合规门卫。当任务涉及 presentation 层（pages/widgets/theme）时触发。
  确保所有 UI 代码遵循 DESIGN.md 设计系统，零硬编码、零模板感。
---

# 设计系统合规检查

> 权威来源：`DESIGN.md`（"数码纸笺"北极星）+ `lib/app/theme/`

## 编码前

新建或重构 UI 时，先读 `DESIGN.md` 和相邻页面代码，确保风格一致。

## 颜色

- [ ] 所有颜色引用 `HanaColors.xxx` 或 `Theme.of(context).colorScheme.xxx`
- [ ] 零 `Color(0xFF...)` 硬编码
- [ ] 零 `Colors.xxx`（`Colors.transparent` 除外）
- [ ] 零纯黑 `#000000` / 纯白 `#FFFFFF`
- [ ] 语义色正确：success/error/category* 用对场景

## 字体

- [ ] 标题用 `Plus Jakarta Sans`（通过 TextTheme 或显式 fontFamily）
- [ ] 正文用 `Be Vietnam Pro`（通过 TextTheme）
- [ ] 零 Inter / Roboto / Arial / 系统默认无衬线体
- [ ] 优先 `Theme.of(context).textTheme.xxx.copyWith(...)` 而非裸 `TextStyle`

## 间距与圆角

- [ ] 间距遵循 8px 倍数体系
- [ ] 卡片圆角 24px，按钮胶囊形，输入框 12px
- [ ] 无魔法数字（如果用了非标间距，有明确理由）

## 深度与层次

- [ ] 零 `Divider` 分割线（通过色调层叠建立层次）
- [ ] 阴影极度弥散：blur >= 16px，opacity 4%-8%，带主题色采样
- [ ] 导航栏/底部栏用毛玻璃（BackdropFilter + 80% 背景）
- [ ] 幽灵边框不透明度 <= 15%

## i18n

- [ ] 零硬编码用户可见字符串（全部通过 `l10n.xxx`）

## 无障碍

- [ ] 交互元素有 `tooltip` 或 `Semantics`
- [ ] 装饰性图标用 `ExcludeSemantics` 包裹
- [ ] 核心文字满足 WCAG 2.1 对比度

## 反模式红线

以下任何一条出现即阻断提交：

| 红线 | 说明 |
|------|------|
| `Colors.xxx` | 用 HanaColors 替代 |
| `Color(0xFF...)` | 用 HanaColors 语义色 |
| `Divider(height: 1)` | 用色调层叠 |
| `fontSize: XX` 裸写 | 用 TextTheme |
| `Inter` / `Roboto` | 用 Plus Jakarta Sans / Be Vietnam Pro |
| 硬编码中文/日文/英文 | 用 ARB l10n |
| 无意义装饰动画 | 删除或替换为有信息量的微交互 |
| 模板式扁平 ListView | 参考 DESIGN.md 的触感化堆叠 |

## 参考

- `DESIGN.md` — 完整设计规范（北极星）
- `lib/app/theme/hana_colors.dart` — 颜色常量
- `lib/app/theme/app_theme.dart` — TextTheme 定义
