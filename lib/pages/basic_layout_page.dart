import 'package:flutter/material.dart';

/// 基础布局Widget演示页面
///
/// 本页面展示了Flutter中最常用的基础布局Widget：
/// - Container: 容器组件，可设置内边距、外边距、装饰等
/// - Row: 水平布局组件
/// - Column: 垂直布局组件
/// - Stack: 层叠布局组件
/// - Expanded: 可伸缩组件
/// - SizedBox: 固定尺寸盒子
class BasicLayoutPage extends StatelessWidget {
  const BasicLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础布局Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Container 容器'),
            _buildContainerExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Row 水平布局'),
            _buildRowExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Column 垂直布局'),
            _buildColumnExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Stack 层叠布局'),
            _buildStackExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Expanded 伸缩组件'),
            _buildExpandedExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('SizedBox 固定盒子'),
            _buildSizedBoxExample(),
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

  /// Container示例
  ///
  /// Container是最基础的布局容器，可以设置：
  /// - padding（内边距）和margin（外边距）
  /// - decoration（装饰，如颜色、边框、阴影等）
  /// - constraints（约束条件，如最大/最小宽高）
  /// - transform（变换）
  Widget _buildContainerExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Container是最基础的布局容器，可以设置内外边距、装饰、尺寸约束等',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              // 内边距
              padding: const EdgeInsets.all(16),
              // 外边距
              margin: const EdgeInsets.all(8),
              // 装饰
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                // 边框
                border: Border.all(color: Colors.blue, width: 2),
                // 圆角
                borderRadius: BorderRadius.circular(12),
                // 阴影
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              // 尺寸约束
              constraints: const BoxConstraints(
                minHeight: 100,
                maxWidth: 300,
              ),
              child: const Center(
                child: Text(
                  '这是一个Container',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Container(\n'
              '  padding: EdgeInsets.all(16),\n'
              '  margin: EdgeInsets.all(8),\n'
              '  decoration: BoxDecoration(\n'
              '    color: Colors.blue.shade100,\n'
              '    border: Border.all(...),\n'
              '    borderRadius: BorderRadius.circular(12),\n'
              '    boxShadow: [...],\n'
              '  ),\n'
              '  constraints: BoxConstraints(...),\n'
              '  child: Center(child: Text(...)),\n'
              ')',
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

  /// Row示例
  ///
  /// Row是水平布局组件，其主要属性包括：
  /// - mainAxisAlignment: 主轴（水平方向）的对齐方式
  /// - crossAxisAlignment: 交叉轴（垂直方向）的对齐方式
  /// - mainAxisSize: 主轴尺寸，可以是max（占据所有可用空间）或min（仅占据必要空间）
  Widget _buildRowExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Row是水平排列子组件的布局组件，可以设置主轴和交叉轴的对齐方式',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('mainAxisAlignment: start（默认）'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildColorBoxes(),
                  ),
                  const SizedBox(height: 16),
                  const Text('mainAxisAlignment: center'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildColorBoxes(),
                  ),
                  const SizedBox(height: 16),
                  const Text('mainAxisAlignment: spaceBetween'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildColorBoxes(),
                  ),
                  const SizedBox(height: 16),
                  const Text('mainAxisAlignment: spaceEvenly'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildColorBoxes(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Row(\n'
              '  mainAxisAlignment: MainAxisAlignment.center,\n'
              '  crossAxisAlignment: CrossAxisAlignment.center,\n'
              '  children: [\n'
              '    Container(...),\n'
              '    Container(...),\n'
              '  ],\n'
              ')',
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

  /// Column示例
  ///
  /// Column是垂直布局组件，其主要属性包括：
  /// - mainAxisAlignment: 主轴（垂直方向）的对齐方式
  /// - crossAxisAlignment: 交叉轴（水平方向）的对齐方式
  /// - mainAxisSize: 主轴尺寸
  Widget _buildColumnExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Column是垂直排列子组件的布局组件，可以设置主轴和交叉轴的对齐方式',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('crossAxisAlignment: start'),
                      Container(
                        height: 180,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildColorBoxes(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      const Text('crossAxisAlignment: center'),
                      Container(
                        height: 180,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildColorBoxes(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      const Text('crossAxisAlignment: stretch'),
                      Container(
                        height: 180,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _buildColorBoxes(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Column(\n'
              '  mainAxisAlignment: MainAxisAlignment.spaceEvenly,\n'
              '  crossAxisAlignment: CrossAxisAlignment.center,\n'
              '  children: [\n'
              '    Container(...),\n'
              '    Container(...),\n'
              '  ],\n'
              ')',
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

  /// Stack示例
  ///
  /// Stack是层叠布局组件，子组件可以堆叠在一起
  /// - alignment: 子组件对齐方式
  /// - fit: 适应方式，如何确定未定位子组件的大小
  /// - 使用Positioned来精确定位子组件
  Widget _buildStackExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Stack是层叠布局组件，子组件可以堆叠在一起，结合Positioned可以精确定位子组件',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.grey.shade200,
              child: Stack(
                alignment: Alignment.center, // 默认的对齐方式
                children: [
                  // 底层容器
                  Container(
                    width: 300,
                    height: 150,
                    color: Colors.blue.shade200,
                  ),
                  // 左上角定位
                  const Positioned(
                    top: 0,
                    left: 0,
                    child: Text('左上角'),
                  ),
                  // 右下角定位
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text('右下角'),
                  ),
                  // 居中显示，不使用Positioned则使用Stack的alignment
                  const Text(
                    '居中文本',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 绝对定位，覆盖在其他组件上
                  Positioned(
                    top: 50,
                    right: 50,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '浮动',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Stack(\n'
              '  alignment: Alignment.center,\n'
              '  children: [\n'
              '    Container(...),\n'
              '    Positioned(\n'
              '      top: 0,\n'
              '      left: 0,\n'
              '      child: Text(...),\n'
              '    ),\n'
              '    Text(...),\n'
              '  ],\n'
              ')',
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

  /// Expanded示例
  ///
  /// Expanded是一种伸缩组件，可以使子组件填充所有可用空间
  /// - flex: 伸缩因子，决定多个Expanded如何分配空间
  Widget _buildExpandedExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Expanded使子组件在Row或Column中自动填充所有可用空间，flex参数控制多个Expanded的空间分配',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              height: 50,
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  // flex: 1 (默认值)
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text('flex: 1',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  // flex: 2，占据2份空间
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: const Center(
                        child: Text('flex: 2',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  // flex: 1
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text('flex: 1',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'Row(\n'
              '  children: [\n'
              '    Expanded(\n'
              '      child: Container(color: Colors.red),\n'
              '    ),\n'
              '    Expanded(\n'
              '      flex: 2,\n'
              '      child: Container(color: Colors.green),\n'
              '    ),\n'
              '    Expanded(\n'
              '      child: Container(color: Colors.blue),\n'
              '    ),\n'
              '  ],\n'
              ')',
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

  /// SizedBox示例
  ///
  /// SizedBox是固定尺寸的盒子，通常用于：
  /// - 设置固定宽高的组件
  /// - 作为间距使用
  Widget _buildSizedBoxExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'SizedBox是具有固定宽高的盒子，常用于设置组件尺寸或作为间距使用',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16), // 用作间距
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.orange,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 20), // 水平间距
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Container(
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        '100x50',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // 水平间距
                SizedBox(
                  width: 50,
                  height: 100,
                  child: Container(
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        '50x100',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 用作间距\n'
              'const SizedBox(height: 16),\n'
              '\n'
              '// 用作固定尺寸容器\n'
              'SizedBox(\n'
              '  width: 100,\n'
              '  height: 50,\n'
              '  child: Container(...),\n'
              ')',
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

  /// 创建用于演示的彩色盒子
  List<Widget> _buildColorBoxes() {
    return [
      Container(width: 50, height: 30, color: Colors.red),
      Container(width: 70, height: 30, color: Colors.green),
      Container(width: 40, height: 30, color: Colors.blue),
    ];
  }
}
