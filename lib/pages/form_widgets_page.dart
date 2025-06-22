import 'package:flutter/material.dart';

/// 表单相关Widget演示页面
///
/// 本页面展示了Flutter中常用的表单Widget：
/// - TextField: 文本输入框
/// - Form: 表单容器
/// - CheckBox: 复选框
/// - Radio: 单选按钮
/// - Switch: 开关
/// - Slider: 滑块
/// - DropdownButton: 下拉菜单
class FormWidgetsPage extends StatefulWidget {
  const FormWidgetsPage({super.key});

  @override
  State<FormWidgetsPage> createState() => _FormWidgetsPageState();
}

class _FormWidgetsPageState extends State<FormWidgetsPage> {
  // TextField控制器
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _multilineController = TextEditingController();
  final TextEditingController _readonlyController =
      TextEditingController(text: '这是一个只读文本框');

  // 表单数据
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';

  // Checkbox状态
  bool _isChecked1 = false;
  bool _isChecked2 = true;

  // Radio状态
  int _radioValue = 1;

  // Switch状态
  bool _switchValue1 = false;
  bool _switchValue2 = true;

  // Slider状态
  double _sliderValue = 0.5;

  // DropdownButton状态
  String _dropdownValue = '选项1';
  final List<String> _dropdownItems = ['选项1', '选项2', '选项3', '选项4'];

  @override
  void dispose() {
    // 释放控制器资源
    _textController.dispose();
    _passwordController.dispose();
    _multilineController.dispose();
    _readonlyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('表单相关Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('TextField 文本输入框'),
            _buildTextFieldExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Form 表单'),
            _buildFormExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('CheckBox 复选框'),
            _buildCheckboxExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Radio 单选按钮'),
            _buildRadioExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Switch 开关'),
            _buildSwitchExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Slider 滑块'),
            _buildSliderExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('DropdownButton 下拉菜单'),
            _buildDropdownButtonExample(),
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

  /// TextField示例
  ///
  /// TextField是文本输入框组件，用于接收用户输入
  /// - controller: 控制输入内容
  /// - decoration: 装饰（如标签、提示、图标等）
  /// - obscureText: 是否隐藏文本（用于密码输入）
  /// - keyboardType: 键盘类型
  /// - maxLines: 最大行数（>1时为多行文本框）
  Widget _buildTextFieldExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TextField是文本输入框，用于获取用户的文本输入',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本文本框:'),
            TextField(
              controller: _textController,
              // 装饰
              decoration: const InputDecoration(
                // 标签
                labelText: '用户名',
                // 提示
                hintText: '请输入用户名',
                // 帮助文本
                helperText: '输入您的用户名',
                // 前缀图标
                prefixIcon: Icon(Icons.person),
                // 边框
                border: OutlineInputBorder(),
              ),
              // 监听文本变化
              onChanged: (value) {
                // print('文本变化: $value');
              },
              // 监听提交事件（按回车键）
              onSubmitted: (value) {
                // print('提交: $value');
              },
            ),
            const SizedBox(height: 16),
            const Text('密码文本框:'),
            TextField(
              controller: _passwordController,
              // 隐藏文本（显示为点或星号）
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
                // 带有填充的边框
                border: OutlineInputBorder(),
                // 填充色
                fillColor: Color(0xFFF5F5F5),
                // 启用填充
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const Text('多行文本框:'),
            TextField(
              controller: _multilineController,
              // 最大行数
              maxLines: 3,
              // 键盘类型
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: '备注',
                hintText: '请输入备注信息',
                alignLabelWithHint: true, // 标签与提示对齐（多行时很有用）
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('只读文本框:'),
            TextField(
              controller: _readonlyController,
              // 只读模式
              readOnly: true,
              decoration: const InputDecoration(
                labelText: '只读字段',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'TextField(\n'
              '  controller: _controller,\n'
              '  decoration: InputDecoration(\n'
              '    labelText: \'用户名\',\n'
              '    hintText: \'请输入用户名\',\n'
              '    prefixIcon: Icon(Icons.person),\n'
              '    border: OutlineInputBorder(),\n'
              '  ),\n'
              '  onChanged: (value) {\n'
              '    // 处理文本变化\n'
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

  /// Form示例
  ///
  /// Form是表单容器，可以对其中的FormField进行统一验证和提交
  /// - TextFormField: 带有表单功能的文本输入框
  /// - validator: 验证器函数，返回null表示验证通过，返回字符串表示错误信息
  Widget _buildFormExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Form是表单容器，可以统一管理和验证表单字段',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              // 自动验证模式
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // 用户名输入框
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '用户名',
                      hintText: '请输入用户名',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    // 验证器
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '用户名不能为空';
                      }
                      if (value.length < 3) {
                        return '用户名长度至少为3个字符';
                      }
                      return null; // 验证通过
                    },
                    // 保存回调
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  // 邮箱输入框
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '邮箱',
                      hintText: '请输入邮箱',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    // 键盘类型
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '邮箱不能为空';
                      }
                      // 简单的邮箱格式验证
                      if (!value.contains('@') || !value.contains('.')) {
                        return '请输入有效的邮箱地址';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  // 密码输入框
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '密码不能为空';
                      }
                      if (value.length < 6) {
                        return '密码长度至少为6个字符';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 24),
                  // 提交按钮
                  ElevatedButton(
                    onPressed: () {
                      // 验证表单
                      if (_formKey.currentState!.validate()) {
                        // 保存表单数据
                        _formKey.currentState!.save();

                        // 显示提交成功的snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('表单提交成功: 用户名=$_username, 邮箱=$_email'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text('提交表单'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Form(\n'
              '  key: _formKey,\n'
              '  autovalidateMode: AutovalidateMode.onUserInteraction,\n'
              '  child: Column(\n'
              '    children: [\n'
              '      TextFormField(\n'
              '        decoration: InputDecoration(...),\n'
              '        validator: (value) {\n'
              '          if (value == null || value.isEmpty) {\n'
              '            return \'必填项\';\n'
              '          }\n'
              '          return null;\n'
              '        },\n'
              '        onSaved: (value) {\n'
              '          _fieldValue = value!;\n'
              '        },\n'
              '      ),\n'
              '      ElevatedButton(\n'
              '        onPressed: () {\n'
              '          if (_formKey.currentState!.validate()) {\n'
              '            _formKey.currentState!.save();\n'
              '            // 处理表单数据\n'
              '          }\n'
              '        },\n'
              '        child: Text(\'提交\'),\n'
              '      ),\n'
              '    ],\n'
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

  /// Checkbox示例
  ///
  /// Checkbox是复选框，用于多选场景
  /// - value: 当前是否选中
  /// - onChanged: 状态变化时的回调
  Widget _buildCheckboxExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checkbox是复选框组件，用于多项选择场景',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本复选框:'),
            Row(
              children: [
                Checkbox(
                  value: _isChecked1,
                  onChanged: (value) {
                    setState(() {
                      _isChecked1 = value!;
                    });
                  },
                ),
                const Text('选项1'),
                const SizedBox(width: 20),
                Checkbox(
                  value: _isChecked2,
                  onChanged: (value) {
                    setState(() {
                      _isChecked2 = value!;
                    });
                  },
                ),
                const Text('选项2'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('带标签的复选框 (CheckboxListTile):'),
            CheckboxListTile(
              title: const Text('选项标题'),
              subtitle: const Text('这是选项的描述文本'),
              secondary: const Icon(Icons.star),
              value: _isChecked1,
              onChanged: (value) {
                setState(() {
                  _isChecked1 = value!;
                });
              },
              // 控制标签位置
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text('禁用状态'),
              value: false,
              onChanged: null, // null表示禁用
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 基本复选框\n'
              'Checkbox(\n'
              '  value: _isChecked,\n'
              '  onChanged: (value) {\n'
              '    setState(() {\n'
              '      _isChecked = value!;\n'
              '    });\n'
              '  },\n'
              ');\n'
              '\n'
              '// 带标签的复选框\n'
              'CheckboxListTile(\n'
              '  title: Text(\'选项标题\'),\n'
              '  subtitle: Text(\'这是选项的描述文本\'),\n'
              '  secondary: Icon(Icons.star),\n'
              '  value: _isChecked,\n'
              '  onChanged: (value) {...},\n'
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

  /// Radio示例
  ///
  /// Radio是单选按钮，用于单选场景
  /// - value: 该选项的值
  /// - groupValue: 当前选中的值
  /// - onChanged: 状态变化时的回调
  Widget _buildRadioExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Radio是单选按钮组件，用于单项选择场景',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本单选按钮:'),
            Row(
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                const Text('选项1'),
                const SizedBox(width: 20),
                Radio<int>(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                const Text('选项2'),
                const SizedBox(width: 20),
                Radio<int>(
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                const Text('选项3'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('带标签的单选按钮 (RadioListTile):'),
            RadioListTile<int>(
              title: const Text('选项1'),
              subtitle: const Text('第一个选项的描述'),
              secondary: const Icon(Icons.filter_1),
              value: 1,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('选项2'),
              subtitle: const Text('第二个选项的描述'),
              secondary: const Icon(Icons.filter_2),
              value: 2,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('选项3'),
              subtitle: const Text('第三个选项的描述'),
              secondary: const Icon(Icons.filter_3),
              value: 3,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            const RadioListTile<int>(
              title: Text('禁用选项'),
              value: 4,
              groupValue: 0, // 不匹配任何值
              onChanged: null, // null表示禁用
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 基本单选按钮\n'
              'Radio<int>(\n'
              '  value: 1,\n'
              '  groupValue: _radioValue,\n'
              '  onChanged: (value) {\n'
              '    setState(() {\n'
              '      _radioValue = value!;\n'
              '    });\n'
              '  },\n'
              ');\n'
              '\n'
              '// 带标签的单选按钮\n'
              'RadioListTile<int>(\n'
              '  title: Text(\'选项1\'),\n'
              '  subtitle: Text(\'描述\'),\n'
              '  value: 1,\n'
              '  groupValue: _radioValue,\n'
              '  onChanged: (value) {...},\n'
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

  /// Switch示例
  ///
  /// Switch是开关组件，用于切换状态
  /// - value: 当前状态
  /// - onChanged: 状态变化时的回调
  Widget _buildSwitchExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Switch是开关组件，用于切换开/关状态',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本开关:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Switch(
                      value: _switchValue1,
                      onChanged: (value) {
                        setState(() {
                          _switchValue1 = value;
                        });
                      },
                    ),
                    Text(_switchValue1 ? '开启' : '关闭'),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: _switchValue2,
                      onChanged: (value) {
                        setState(() {
                          _switchValue2 = value;
                        });
                      },
                      // 定制颜色
                      activeColor: Colors.green,
                      activeTrackColor: Colors.lightGreen,
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor: Colors.redAccent.withOpacity(0.5),
                    ),
                    Text(_switchValue2 ? '开启' : '关闭'),
                  ],
                ),
                const Column(
                  children: [
                    Switch(
                      value: true,
                      onChanged: null, // 禁用状态
                    ),
                    Text('禁用状态'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('带标签的开关 (SwitchListTile):'),
            SwitchListTile(
              title: const Text('飞行模式'),
              subtitle: const Text('开启后将关闭所有网络连接'),
              secondary: const Icon(Icons.airplanemode_active),
              value: _switchValue1,
              onChanged: (value) {
                setState(() {
                  _switchValue1 = value;
                });
              },
            ),
            const Divider(height: 1),
            SwitchListTile(
              title: const Text('Wi-Fi'),
              subtitle: const Text('连接到无线网络'),
              secondary: const Icon(Icons.wifi),
              value: _switchValue2,
              onChanged: (value) {
                setState(() {
                  _switchValue2 = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 基本开关\n'
              'Switch(\n'
              '  value: _switchValue,\n'
              '  onChanged: (value) {\n'
              '    setState(() {\n'
              '      _switchValue = value;\n'
              '    });\n'
              '  },\n'
              '  activeColor: Colors.green,\n'
              ');\n'
              '\n'
              '// 带标签的开关\n'
              'SwitchListTile(\n'
              '  title: Text(\'飞行模式\'),\n'
              '  subtitle: Text(\'描述\'),\n'
              '  value: _switchValue,\n'
              '  onChanged: (value) {...},\n'
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

  /// Slider示例
  ///
  /// Slider是滑块组件，用于在连续范围内选择值
  /// - value: 当前值
  /// - min/max: 最小/最大值
  /// - onChanged: 值变化时的回调
  Widget _buildSliderExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Slider是滑块组件，用于在连续范围内选择值',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本滑块:'),
            Column(
              children: [
                Slider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Text('当前值: ${(_sliderValue * 100).toStringAsFixed(0)}%'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('自定义滑块:'),
            Column(
              children: [
                Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  divisions: 10, // 分段数
                  label: '${(_sliderValue * 100).toStringAsFixed(0)}%', // 标签
                  activeColor: Colors.orange,
                  inactiveColor: Colors.orange.withOpacity(0.3),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Text('当前值: ${(_sliderValue * 10).toStringAsFixed(0)}/10'),
              ],
            ),
            const SizedBox(height: 16),
            // RangeSlider示例
            const Text('范围滑块 (RangeSlider):'),
            const RangeSliderExample(),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 基本滑块\n'
              'Slider(\n'
              '  value: _sliderValue,\n'
              '  min: 0.0,\n'
              '  max: 1.0,\n'
              '  onChanged: (value) {\n'
              '    setState(() {\n'
              '      _sliderValue = value;\n'
              '    });\n'
              '  },\n'
              ');\n'
              '\n'
              '// 自定义滑块\n'
              'Slider(\n'
              '  value: _sliderValue,\n'
              '  divisions: 10,\n'
              '  label: \'\${(_sliderValue * 100).toStringAsFixed(0)}%\',\n'
              '  activeColor: Colors.orange,\n'
              '  onChanged: (value) {...},\n'
              ');',
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// DropdownButton示例
  ///
  /// DropdownButton是下拉菜单组件，用于在多个选项中选择一个
  /// - value: 当前选中的值
  /// - items: 下拉选项列表
  /// - onChanged: 选项变化时的回调
  Widget _buildDropdownButtonExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DropdownButton是下拉菜单组件，用于在多个选项中选择一个',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('基本下拉菜单:'),
            DropdownButton<String>(
              value: _dropdownValue,
              // 下拉菜单项
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // 选中回调
              onChanged: (String? value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
              // 提示
              hint: const Text('请选择'),
            ),
            const SizedBox(height: 16),
            const Text('带图标的下拉菜单:'),
            DropdownButton<String>(
              value: _dropdownValue,
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                // 为每个选项添加图标
                IconData iconData;
                switch (_dropdownItems.indexOf(value)) {
                  case 0:
                    iconData = Icons.looks_one;
                    break;
                  case 1:
                    iconData = Icons.looks_two;
                    break;
                  case 2:
                    iconData = Icons.looks_3;
                    break;
                  default:
                    iconData = Icons.looks_4;
                }

                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Icon(iconData, color: Colors.blue),
                      const SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
              // 下拉图标
              icon: const Icon(Icons.arrow_drop_down_circle),
              // 按钮样式
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              // 下划线
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              // 是否扩展按钮宽度
              isExpanded: true,
            ),
            const SizedBox(height: 16),
            const Text('装饰的下拉菜单:'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _dropdownValue,
                  items: _dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _dropdownValue = value!;
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'DropdownButton<String>(\n'
              '  value: _dropdownValue,\n'
              '  items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {\n'
              '    return DropdownMenuItem<String>(\n'
              '      value: value,\n'
              '      child: Text(value),\n'
              '    );\n'
              '  }).toList(),\n'
              '  onChanged: (String? value) {\n'
              '    setState(() {\n'
              '      _dropdownValue = value!;\n'
              '    });\n'
              '  },\n'
              '  hint: Text(\'请选择\'),\n'
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

/// 范围滑块示例，单独作为一个StatefulWidget
class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _rangeValues = const RangeValues(0.3, 0.7);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _rangeValues,
          min: 0.0,
          max: 1.0,
          divisions: 10,
          labels: RangeLabels(
            '${(_rangeValues.start * 100).toStringAsFixed(0)}%',
            '${(_rangeValues.end * 100).toStringAsFixed(0)}%',
          ),
          onChanged: (values) {
            setState(() {
              _rangeValues = values;
            });
          },
        ),
        Text(
            '当前范围: ${(_rangeValues.start * 100).toStringAsFixed(0)}% - ${(_rangeValues.end * 100).toStringAsFixed(0)}%'),
      ],
    );
  }
}
