---
name: i18n-enforcement
description: >
  提交代码前检查 UI 文本合规性。当任务涉及 UI 文本、按钮标签、
  提示信息、错误消息等用户可见字符串时触发。
---

# UI 文本合规检查

在提交任何涉及用户可见文本的代码前，逐项检查：

## 绝对禁止（违反即阻塞提交）

- [ ] 禁止 `Text('')` — 空字符串的 Text widget 永远不应出现在用户可见的 UI 中
- [ ] 禁止 `Text(' ')` — 纯空格的 Text widget 同理
- [ ] 禁止按钮（ElevatedButton/TextButton/FilledButton/OutlinedButton）的 child Text 为空字符串
- [ ] 禁止 SnackBar/AlertDialog/Tooltip 中出现空字符串文案

## 必须通过

- [ ] 所有用户可见字符串必须是有意义的中文（或英文单位如 mg/ml）
- [ ] 新增的 UI 文本如果在 ARB 文件中已有对应 key，优先使用 `AppLocalizations.of(context)!.xxx`
- [ ] 如果 ARB 中没有对应 key，允许直接写中文字符串，但内容不能为空
- [ ] 含变量的字符串使用字符串插值 `'剩余 $days 天'`，不使用多个 Text widget 拼接
- [ ] 日期时间使用 `DateFormat`，不手写格式

## 提交前自查命令

在提交前运行以下命令确认无空字符串残留：
grep -rn "Text('')" lib/
grep -rn "Text(' ')" lib/

如果有匹配结果，必须全部替换为有意义的文案后才能提交。

## 例外

- 日志输出（log/print/debugPrint）
- 代码注释
- 测试文件中的 mock 数据
- 第三方 SDK 固定参数
