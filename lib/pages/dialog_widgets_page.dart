import 'package:flutter/material.dart';

/// 弹窗和提示相关Widget演示页面
///
/// 本页面展示了Flutter中常用的弹窗和提示Widget：
/// - AlertDialog: 警告对话框
/// - SimpleDialog: 简单对话框
/// - SnackBar: 底部提示条
/// - BottomSheet: 底部弹出层
/// - Tooltip: 工具提示
/// - Popup菜单: 弹出菜单
class DialogWidgetsPage extends StatefulWidget {
  const DialogWidgetsPage({super.key});

  @override
  State<DialogWidgetsPage> createState() => _DialogWidgetsPageState();
}

class _DialogWidgetsPageState extends State<DialogWidgetsPage> {
  // Popup菜单选中项
  String _selectedMenuItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹窗和提示Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Dialog 对话框'),
            _buildDialogExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('SnackBar 提示条'),
            _buildSnackBarExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('BottomSheet 底部弹出层'),
            _buildBottomSheetExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Tooltip 工具提示'),
            _buildTooltipExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Popup菜单'),
            _buildPopupMenuExample(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// 创建章节标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Dialog示例
  ///
  /// Dialog是对话框组件，用于向用户展示重要信息或获取用户输入
  /// - AlertDialog: 警告对话框，通常用于确认操作或显示消息
  /// - SimpleDialog: 简单对话框，通常用于选择选项
  Widget _buildDialogExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dialog是对话框组件，用于向用户展示重要信息或获取用户输入',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AlertDialog示例
                ElevatedButton(
                  onPressed: () => _showAlertDialog(context),
                  child: const Text('显示AlertDialog'),
                ),
                // SimpleDialog示例
                ElevatedButton(
                  onPressed: () => _showSimpleDialog(context),
                  child: const Text('显示SimpleDialog'),
                ),
                // 自定义Dialog示例
                ElevatedButton(
                  onPressed: () => _showCustomDialog(context),
                  child: const Text('自定义Dialog'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 显示AlertDialog\n'
              'showDialog(\n'
              '  context: context,\n'
              '  builder: (BuildContext context) {\n'
              '    return AlertDialog(\n'
              '      title: Text(\'提示\'),\n'
              '      content: Text(\'这是一个警告对话框\'),\n'
              '      actions: [\n'
              '        TextButton(\n'
              '          onPressed: () => Navigator.pop(context),\n'
              '          child: Text(\'取消\'),\n'
              '        ),\n'
              '        TextButton(\n'
              '          onPressed: () => Navigator.pop(context),\n'
              '          child: Text(\'确定\'),\n'
              '        ),\n'
              '      ],\n'
              '    );\n'
              '  },\n'
              ');',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 显示AlertDialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // 标题
          title: const Text('警告'),
          // 内容
          content: const Text('这是一个警告对话框，用于显示重要信息或确认操作。'),
          // 操作按钮
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('操作已确认')),
                );
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  // 显示SimpleDialog
  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          // 标题
          title: const Text('选择一个选项'),
          // 选项
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('选择了选项1')),
                );
              },
              child: const Text('选项1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('选择了选项2')),
                );
              },
              child: const Text('选项2'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('选择了选项3')),
                );
              },
              child: const Text('选项3'),
            ),
          ],
        );
      },
    );
  }

  // 显示自定义Dialog
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // 形状
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          // 自定义内容
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  '操作成功',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('您的操作已成功完成，点击下方按钮关闭此对话框。'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('确定'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// SnackBar示例
  ///
  /// SnackBar是一种轻量级的反馈信息，通常出现在屏幕底部
  /// - 用于显示简短的消息
  /// - 可以添加操作按钮
  /// - 会在一定时间后自动消失
  Widget _buildSnackBarExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SnackBar是一种轻量级的反馈组件，通常用于显示操作的结果或提示信息',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 基本SnackBar
                ElevatedButton(
                  onPressed: () => _showBasicSnackBar(context),
                  child: const Text('基本SnackBar'),
                ),
                // 带操作的SnackBar
                ElevatedButton(
                  onPressed: () => _showActionSnackBar(context),
                  child: const Text('带操作的SnackBar'),
                ),
                // 自定义SnackBar
                ElevatedButton(
                  onPressed: () => _showCustomSnackBar(context),
                  child: const Text('自定义SnackBar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'ScaffoldMessenger.of(context).showSnackBar(\n'
              '  SnackBar(\n'
              '    content: Text(\'这是一条提示信息\'),\n'
              '    duration: Duration(seconds: 3),\n'
              '    action: SnackBarAction(\n'
              '      label: \'撤销\',\n'
              '      onPressed: () {\n'
              '        // 执行撤销操作\n'
              '      },\n'
              '    ),\n'
              '  ),\n'
              ');',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 显示基本SnackBar
  void _showBasicSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('这是一条基本的提示信息'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // 显示带操作的SnackBar
  void _showActionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('您的邮件已删除'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: '撤销',
          onPressed: () {
            // 执行撤销操作
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('已撤销删除操作')),
            );
          },
        ),
      ),
    );
  }

  // 显示自定义SnackBar
  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            const SizedBox(width: 16),
            const Expanded(
              child: Text('这是一条自定义样式的提示信息'),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating, // 浮动样式
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          // 圆角形状
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// BottomSheet示例
  ///
  /// BottomSheet是从屏幕底部滑出的面板
  /// - showModalBottomSheet: 显示模态底部面板
  /// - showBottomSheet: 显示持久性底部面板
  Widget _buildBottomSheetExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BottomSheet是从屏幕底部滑出的面板，用于显示更多选项或详细信息',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 模态BottomSheet
                ElevatedButton(
                  onPressed: () => _showModalBottomSheet(context),
                  child: const Text('模态BottomSheet'),
                ),
                // 持久性BottomSheet
                ElevatedButton(
                  onPressed: () => _showPersistentBottomSheet(context),
                  child: const Text('持久性BottomSheet'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 显示模态底部面板\n'
              'showModalBottomSheet(\n'
              '  context: context,\n'
              '  builder: (BuildContext context) {\n'
              '    return Container(\n'
              '      height: 200,\n'
              '      padding: EdgeInsets.all(16.0),\n'
              '      child: Column(\n'
              '        mainAxisSize: MainAxisSize.min,\n'
              '        children: [\n'
              '          Text(\'底部面板内容\'),\n'
              '          // 更多内容...\n'
              '        ],\n'
              '      ),\n'
              '    );\n'
              '  },\n'
              ');',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 显示模态底部面板
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '分享到',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareButton(Icons.wechat, '微信', Colors.green),
                  _buildShareButton(Icons.messenger_outline, '短信', Colors.blue),
                  _buildShareButton(Icons.mail_outline, '邮件', Colors.orange),
                  _buildShareButton(Icons.more_horiz, '更多', Colors.grey),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('取消'),
              ),
            ],
          ),
        );
      },
    );
  }

  // 分享按钮
  Widget _buildShareButton(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已分享到$label')),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  // 显示持久性底部面板
  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, -3),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '持久性底部面板',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('这种底部面板不会自动关闭，需要用户手动关闭。'),
              const SizedBox(height: 16),
              const Text('用户可以与底部面板之外的内容进行交互。'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('关闭'),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Tooltip示例
  ///
  /// Tooltip是工具提示组件，用于显示对某个UI元素的简短说明
  /// - 当用户长按或悬停在UI元素上时显示
  /// - 可以自定义消息、位置、样式等
  Widget _buildTooltipExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tooltip是工具提示组件，当用户长按元素时显示提示信息',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: [
                // 基本Tooltip
                Tooltip(
                  message: '这是一个按钮',
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('长按查看提示'),
                  ),
                ),
                // 自定义Tooltip
                Tooltip(
                  message: '这是一个带有自定义样式的提示',
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  waitDuration: const Duration(milliseconds: 500),
                  showDuration: const Duration(seconds: 2),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('自定义Tooltip'),
                  ),
                ),
                // 图标Tooltip
                const Tooltip(
                  message: '这是帮助信息',
                  child: Icon(
                    Icons.help_outline,
                    size: 36,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Tooltip(\n'
              '  message: \'提示信息\',\n'
              '  child: ElevatedButton(\n'
              '    onPressed: () {},\n'
              '    child: Text(\'长按查看提示\'),\n'
              '  ),\n'
              ');',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Popup菜单示例
  ///
  /// PopupMenuButton是弹出菜单组件，用于显示菜单列表
  /// - 通常用于提供额外的操作选项
  /// - 可以自定义菜单项、图标、回调等
  Widget _buildPopupMenuExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PopupMenuButton是弹出菜单组件，用于显示菜单列表',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 基本PopupMenuButton
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      _selectedMenuItem = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了：$value')),
                    );
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: '选项1',
                      child: Text('选项1'),
                    ),
                    const PopupMenuItem<String>(
                      value: '选项2',
                      child: Text('选项2'),
                    ),
                    const PopupMenuItem<String>(
                      value: '选项3',
                      child: Text('选项3'),
                    ),
                  ],
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('点击显示菜单'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),

                // 带图标的PopupMenuButton
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (String value) {
                    setState(() {
                      _selectedMenuItem = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了：$value')),
                    );
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: '查看',
                      child: Row(
                        children: [
                          Icon(Icons.visibility, size: 20),
                          SizedBox(width: 8),
                          Text('查看'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: '编辑',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 20),
                          SizedBox(width: 8),
                          Text('编辑'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: '删除',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 20),
                          SizedBox(width: 8),
                          Text('删除'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('当前选中的菜单项: $_selectedMenuItem'),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'PopupMenuButton<String>(\n'
              '  onSelected: (String value) {\n'
              '    // 处理选中事件\n'
              '  },\n'
              '  itemBuilder: (BuildContext context) => [\n'
              '    PopupMenuItem<String>(\n'
              '      value: \'选项1\',\n'
              '      child: Text(\'选项1\'),\n'
              '    ),\n'
              '    PopupMenuItem<String>(\n'
              '      value: \'选项2\',\n'
              '      child: Text(\'选项2\'),\n'
              '    ),\n'
              '  ],\n'
              ');',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
