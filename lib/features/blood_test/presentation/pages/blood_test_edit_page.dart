import 'package:flutter/material.dart';

/// Minimal placeholder page for creating or editing a blood test report.
class BloodTestEditPage extends StatelessWidget {
  /// Creates a [BloodTestEditPage].
  const BloodTestEditPage({
    super.key,
    this.reportId,
  });

  /// Existing report id when editing.
  final String? reportId;

  @override
  Widget build(BuildContext context) {
    final isEditing = reportId != null && reportId!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? '编辑血检报告' : '添加血检报告'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: '检测日期',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '检测机构',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 4,
            maxLines: 6,
            decoration: const InputDecoration(
              labelText: '结果摘要',
              hintText: '正式表单将在后续轮次接入，这里先保留入口。',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('血检表单正在完善中')),
              );
            },
            child: Text(isEditing ? '保存占位内容' : '创建占位内容'),
          ),
        ],
      ),
    );
  }
}
