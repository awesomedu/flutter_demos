import 'package:flutter/material.dart';

/// 列表相关Widget演示页面
///
/// 本页面展示了Flutter中常用的列表Widget：
/// - ListView: 列表视图
/// - GridView: 网格视图
/// - PageView: 页面视图
/// - ListTile: 列表项
class ListWidgetsPage extends StatelessWidget {
  const ListWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表相关Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ListView 列表视图'),
            _buildListViewExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('GridView 网格视图'),
            _buildGridViewExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('PageView 页面视图'),
            _buildPageViewExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('ListTile 列表项'),
            _buildListTileExample(),
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

  /// ListView示例
  ///
  /// ListView是最常用的列表组件，用于显示可滚动的列表项
  /// - ListView.builder: 适用于大量数据，按需构建列表项
  /// - ListView.separated: 在列表项之间添加分割线或其他分隔组件
  /// - ListView.custom: 自定义列表构建逻辑
  Widget _buildListViewExample() {
    // 模拟数据源
    final List<String> items = List.generate(20, (index) => '列表项 ${index + 1}');

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ListView是最常用的列表组件，用于显示可滚动的列表项',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('ListView.builder示例:'),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                // 列表项数量
                itemCount: items.length,
                // 列表项构建器，按需构建可见的列表项
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(items[index]),
                    subtitle: Text('子标题 ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('ListView.separated示例:'),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                // 列表项数量
                itemCount: items.length,
                // 列表项构建器
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(items[index]),
                  );
                },
                // 分割器构建器
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 1,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// ListView.builder\n'
              'ListView.builder(\n'
              '  itemCount: items.length,\n'
              '  itemBuilder: (context, index) {\n'
              '    return ListTile(\n'
              '      title: Text(items[index]),\n'
              '    );\n'
              '  },\n'
              ');\n'
              '\n'
              '// ListView.separated\n'
              'ListView.separated(\n'
              '  itemCount: items.length,\n'
              '  itemBuilder: (context, index) {...},\n'
              '  separatorBuilder: (context, index) {\n'
              '    return Divider();\n'
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

  /// GridView示例
  ///
  /// GridView是网格布局组件，用于以网格形式展示数据
  /// - GridView.builder: 按需构建网格项，适合大量数据
  /// - GridView.count: 指定列数的网格视图
  /// - GridView.extent: 指定最大宽度的网格视图
  Widget _buildGridViewExample() {
    // 示例数据
    final List<Map<String, dynamic>> gridItems = List.generate(
      12,
      (index) => {
        'color': index % 4 == 0
            ? Colors.red.shade300
            : index % 4 == 1
                ? Colors.green.shade300
                : index % 4 == 2
                    ? Colors.blue.shade300
                    : Colors.orange.shade300,
        'text': '项目 ${index + 1}',
      },
    );

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GridView是网格布局组件，用于以网格形式展示数据，常用于照片墙、商品列表等',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('GridView.count示例 (固定列数):'),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GridView.count(
                // 列数
                crossAxisCount: 3,
                // 主轴间距
                mainAxisSpacing: 10.0,
                // 交叉轴间距
                crossAxisSpacing: 10.0,
                // 内边距
                padding: const EdgeInsets.all(10.0),
                children: gridItems.map((item) {
                  return Container(
                    color: item['color'],
                    child: Center(
                      child: Text(
                        item['text'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('GridView.builder示例（自定义网格）:'),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                // 网格代理，定义网格特性
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // 列数
                  crossAxisCount: 4,
                  // 宽高比
                  childAspectRatio: 1.0,
                  // 主轴间距
                  mainAxisSpacing: 10.0,
                  // 交叉轴间距
                  crossAxisSpacing: 10.0,
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: gridItems[index]['color'],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        gridItems[index]['text'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('GridView.extent示例（固定最大宽度）:'),
            Container(
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GridView.extent(
                // 最大宽度
                maxCrossAxisExtent: 100,
                padding: const EdgeInsets.all(10.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: gridItems.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        item['text'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// GridView.count\n'
              'GridView.count(\n'
              '  crossAxisCount: 3,\n'
              '  mainAxisSpacing: 10.0,\n'
              '  crossAxisSpacing: 10.0,\n'
              '  children: [...],\n'
              ');\n'
              '\n'
              '// GridView.builder\n'
              'GridView.builder(\n'
              '  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(\n'
              '    crossAxisCount: 4,\n'
              '    childAspectRatio: 1.0,\n'
              '  ),\n'
              '  itemCount: items.length,\n'
              '  itemBuilder: (context, index) {...},\n'
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

  /// PageView示例
  ///
  /// PageView是页面视图组件，可以实现左右滑动切换页面效果
  /// - PageView.builder: 按需构建页面，适合大量页面
  /// - PageController: 控制PageView的滚动行为
  Widget _buildPageViewExample() {
    // 示例页面数据
    final List<Map<String, dynamic>> pages = [
      {
        'color': Colors.red.shade200,
        'title': '第一页',
        'content': '这是PageView的第一页内容'
      },
      {
        'color': Colors.green.shade200,
        'title': '第二页',
        'content': '这是PageView的第二页内容'
      },
      {
        'color': Colors.blue.shade200,
        'title': '第三页',
        'content': '这是PageView的第三页内容'
      },
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PageView是用于实现页面滑动切换的组件，常用于引导页、轮播图等',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView.builder(
                // 页面数量
                itemCount: pages.length,
                // 页面构建器
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: pages[index]['color'],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pages[index]['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          pages[index]['content'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '向左/右滑动切换页面 (${index + 1}/${pages.length})',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
                // 页面控制器，可以控制初始页面、滚动行为等
                controller: PageController(
                  // 初始页面
                  initialPage: 0,
                  // 是否保持页面状态
                  keepPage: true,
                  // 视窗分数，1.0表示一页占据整个视窗
                  viewportFraction: 0.9,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'PageView.builder(\n'
              '  itemCount: pages.length,\n'
              '  itemBuilder: (context, index) {\n'
              '    return Container(\n'
              '      color: pages[index][\'color\'],\n'
              '      child: Center(\n'
              '        child: Text(pages[index][\'title\']),\n'
              '      ),\n'
              '    );\n'
              '  },\n'
              '  controller: PageController(\n'
              '    initialPage: 0,\n'
              '    viewportFraction: 0.9,\n'
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

  /// ListTile示例
  ///
  /// ListTile是列表项组件，通常用于ListView中
  /// - leading: 前置组件，通常放置图标或头像
  /// - title: 标题
  /// - subtitle: 副标题
  /// - trailing: 尾部组件，通常放置图标或按钮
  Widget _buildListTileExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ListTile是专为列表设计的组件，包含前置图标、标题、副标题和尾部图标等元素',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // 基本ListTile
                  ListTile(
                    title: const Text('基本ListTile'),
                    subtitle: const Text('仅包含标题和副标题'),
                    onTap: () {},
                  ),
                  const Divider(height: 1),

                  // 带图标的ListTile
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('带图标的ListTile'),
                    subtitle: const Text('在前面添加了图标'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),

                  // 带头像的ListTile
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('用户'),
                    ),
                    title: const Text('带头像的ListTile'),
                    subtitle: const Text('在前面添加了圆形头像'),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                    onTap: () {},
                  ),
                  const Divider(height: 1),

                  // 密集型ListTile
                  const ListTile(
                    dense: true,
                    leading: Icon(Icons.email),
                    title: Text('密集型ListTile'),
                    subtitle: Text('使用了dense属性，使列表项更加紧凑'),
                    trailing: Text('10:30 AM'),
                  ),
                  const Divider(height: 1),

                  // 三行ListTile
                  const ListTile(
                    isThreeLine: true,
                    leading: Icon(Icons.message),
                    title: Text('三行ListTile'),
                    subtitle: Text(
                      '使用了isThreeLine属性，副标题可以显示多行文本。这是一段很长的文本，会自动换行显示在多行中。',
                    ),
                    trailing: Icon(Icons.star_border),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'ListTile(\n'
              '  leading: Icon(Icons.person),\n'
              '  title: Text(\'标题\'),\n'
              '  subtitle: Text(\'副标题\'),\n'
              '  trailing: Icon(Icons.arrow_forward_ios),\n'
              '  onTap: () {},\n'
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
