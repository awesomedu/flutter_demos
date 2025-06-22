import 'package:flutter/material.dart';

/// 导航和路由相关Widget演示页面
///
/// 本页面展示了Flutter中常用的导航和路由Widget：
/// - Navigator: 页面导航
/// - TabBar: 选项卡导航
/// - BottomNavigationBar: 底部导航栏
/// - Drawer: 抽屉菜单
class NavigationWidgetsPage extends StatefulWidget {
  const NavigationWidgetsPage({super.key});

  @override
  State<NavigationWidgetsPage> createState() => _NavigationWidgetsPageState();
}

class _NavigationWidgetsPageState extends State<NavigationWidgetsPage>
    with SingleTickerProviderStateMixin {
  // TabController
  late TabController _tabController;

  // BottomNavigationBar当前索引
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // 初始化TabController
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // 释放TabController资源
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导航和路由Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Navigator 页面导航'),
            _buildNavigatorExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('TabBar 选项卡'),
            _buildTabBarExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('BottomNavigationBar 底部导航栏'),
            _buildBottomNavigationBarExample(),
            const SizedBox(height: 24),
            _buildSectionTitle('Drawer 抽屉菜单'),
            _buildDrawerExample(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // 添加抽屉菜单示例
      drawer: _buildExampleDrawer(context),
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

  /// Navigator示例
  ///
  /// Navigator是Flutter的路由导航系统，用于页面之间的跳转
  /// - push: 导航到新页面
  /// - pop: 返回上一页
  /// - pushNamed: 使用命名路由导航
  /// - pushReplacement: 替换当前页面
  Widget _buildNavigatorExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Navigator是Flutter的路由导航系统，用于页面之间的跳转',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 导航到新页面
                ElevatedButton(
                  onPressed: () => _navigateToPage(context),
                  child: const Text('导航到新页面'),
                ),
                // 导航并传递参数
                ElevatedButton(
                  onPressed: () => _navigateWithArguments(context),
                  child: const Text('传递参数'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 导航到新页面\n'
              'Navigator.push(\n'
              '  context,\n'
              '  MaterialPageRoute(\n'
              '    builder: (context) => SecondPage(),\n'
              '  ),\n'
              ');\n'
              '\n'
              '// 返回上一页\n'
              'Navigator.pop(context);\n'
              '\n'
              '// 导航并传递参数\n'
              'Navigator.push(\n'
              '  context,\n'
              '  MaterialPageRoute(\n'
              '    builder: (context) => SecondPage(data: \'传递的数据\'),\n'
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

  // 导航到新页面
  void _navigateToPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _SecondPage(),
      ),
    );
  }

  // 导航并传递参数
  void _navigateWithArguments(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _SecondPage(
          title: '带参数的页面',
          message: '这是从上一个页面传递过来的参数',
        ),
      ),
    );
  }

  /// TabBar示例
  ///
  /// TabBar是选项卡导航组件，通常放在AppBar的底部
  /// - TabBar: 选项卡头部
  /// - TabBarView: 选项卡内容
  /// - TabController: 控制选项卡状态
  Widget _buildTabBarExample() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TabBar是选项卡组件，用于在同一页面中切换不同视图',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                // TabBar
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: '选项卡1', icon: Icon(Icons.home)),
                    Tab(text: '选项卡2', icon: Icon(Icons.star)),
                    Tab(text: '选项卡3', icon: Icon(Icons.person)),
                  ],
                  // 标签颜色
                  labelColor: Theme.of(context).colorScheme.primary,
                  // 未选中标签颜色
                  unselectedLabelColor: Colors.grey,
                  // 指示器装饰
                  indicatorColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          // TabBarView
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                // 选项卡1内容
                Container(
                  color: Colors.blue.shade100,
                  child: const Center(
                    child: Text('选项卡1内容'),
                  ),
                ),
                // 选项卡2内容
                Container(
                  color: Colors.amber.shade100,
                  child: const Center(
                    child: Text('选项卡2内容'),
                  ),
                ),
                // 选项卡3内容
                Container(
                  color: Colors.green.shade100,
                  child: const Center(
                    child: Text('选项卡3内容'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              '代码示例:\n'
              '// 在State类中添加\n'
              'class _MyState extends State<MyWidget> with SingleTickerProviderStateMixin {\n'
              '  late TabController _tabController;\n'
              '  \n'
              '  @override\n'
              '  void initState() {\n'
              '    super.initState();\n'
              '    _tabController = TabController(length: 3, vsync: this);\n'
              '  }\n'
              '  \n'
              '  @override\n'
              '  void dispose() {\n'
              '    _tabController.dispose();\n'
              '    super.dispose();\n'
              '  }\n'
              '  \n'
              '  // 使用TabBar和TabBarView\n'
              '  TabBar(\n'
              '    controller: _tabController,\n'
              '    tabs: [\n'
              '      Tab(text: \'选项卡1\'),\n'
              '      Tab(text: \'选项卡2\'),\n'
              '      Tab(text: \'选项卡3\'),\n'
              '    ],\n'
              '  ),\n'
              '  TabBarView(\n'
              '    controller: _tabController,\n'
              '    children: [\n'
              '      // 各选项卡的内容\n'
              '      Container(child: Text(\'内容1\')),\n'
              '      Container(child: Text(\'内容2\')),\n'
              '      Container(child: Text(\'内容3\')),\n'
              '    ],\n'
              '  ),',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// BottomNavigationBar示例
  ///
  /// BottomNavigationBar是底部导航栏组件
  /// - 通常用于在应用的主要视图之间切换
  /// - 可以设置图标、标签、选中颜色等
  Widget _buildBottomNavigationBarExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BottomNavigationBar是底部导航栏组件，用于在应用的主要视图之间切换',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            // 示例容器
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // 内容区域
                  Expanded(
                    child: Center(
                      child: _buildBottomNavContent(_currentIndex),
                    ),
                  ),
                  // 底部导航栏
                  BottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    // 图标和标签都显示
                    type: BottomNavigationBarType.fixed,
                    // 选中颜色
                    selectedItemColor: Theme.of(context).colorScheme.primary,
                    // 未选中颜色
                    unselectedItemColor: Colors.grey,
                    // 选中图标大小
                    selectedIconTheme: const IconThemeData(size: 24),
                    // 选中文本样式
                    selectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    // 导航项
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '首页',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: '搜索',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: '收藏',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: '我的',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              'int _currentIndex = 0;\n'
              '\n'
              'BottomNavigationBar(\n'
              '  currentIndex: _currentIndex,\n'
              '  onTap: (index) {\n'
              '    setState(() {\n'
              '      _currentIndex = index;\n'
              '    });\n'
              '  },\n'
              '  items: [\n'
              '    BottomNavigationBarItem(\n'
              '      icon: Icon(Icons.home),\n'
              '      label: \'首页\',\n'
              '    ),\n'
              '    BottomNavigationBarItem(\n'
              '      icon: Icon(Icons.search),\n'
              '      label: \'搜索\',\n'
              '    ),\n'
              '    // 更多导航项...\n'
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

  // 根据索引构建底部导航对应的内容
  Widget _buildBottomNavContent(int index) {
    switch (index) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            const Text('首页内容', style: TextStyle(fontSize: 18)),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            const Text('搜索内容', style: TextStyle(fontSize: 18)),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            const Text('收藏内容', style: TextStyle(fontSize: 18)),
          ],
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person,
                size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            const Text('个人中心', style: TextStyle(fontSize: 18)),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  /// Drawer示例
  ///
  /// Drawer是抽屉菜单组件，可从屏幕边缘滑出
  /// - 通常用于显示应用的导航链接
  /// - 可以使用Scaffold的drawer属性添加
  Widget _buildDrawerExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Drawer是抽屉菜单组件，可从屏幕边缘滑出，通常用于显示应用的导航链接',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 打开抽屉菜单
                  Scaffold.of(context).openDrawer();
                },
                child: const Text('打开抽屉菜单'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '代码示例:\n'
              '// 在Scaffold中添加抽屉菜单\n'
              'Scaffold(\n'
              '  appBar: AppBar(title: Text(\'标题\')),\n'
              '  drawer: Drawer(\n'
              '    child: ListView(\n'
              '      children: [\n'
              '        // 抽屉头部\n'
              '        DrawerHeader(\n'
              '          decoration: BoxDecoration(\n'
              '            color: Colors.blue,\n'
              '          ),\n'
              '          child: Text(\'抽屉标题\'),\n'
              '        ),\n'
              '        // 抽屉菜单项\n'
              '        ListTile(\n'
              '          title: Text(\'菜单项1\'),\n'
              '          onTap: () {\n'
              '            // 处理点击事件\n'
              '            Navigator.pop(context); // 关闭抽屉\n'
              '          },\n'
              '        ),\n'
              '        // 更多菜单项...\n'
              '      ],\n'
              '    ),\n'
              '  ),\n'
              '  // 应用主体内容\n'
              '  body: Center(...),\n'
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

  // 示例抽屉菜单
  Widget _buildExampleDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 抽屉头部
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  '用户名',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // 菜单项
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('首页'),
            onTap: () {
              // 关闭抽屉
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击了首页')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () {
              // 关闭抽屉
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击了设置')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('帮助'),
            onTap: () {
              // 关闭抽屉
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击了帮助')),
              );
            },
          ),
          // 分割线
          const Divider(),
          // 更多菜单项
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('退出登录'),
            onTap: () {
              // 关闭抽屉
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击了退出登录')),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// 示例第二个页面
class _SecondPage extends StatelessWidget {
  final String title;
  final String message;

  const _SecondPage({
    this.title = '第二个页面',
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '这是导航到的第二个页面',
              style: TextStyle(fontSize: 18),
            ),
            if (message.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                '接收到的参数: $message',
                style: const TextStyle(fontSize: 16),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 返回上一页
                Navigator.pop(context);
              },
              child: const Text('返回上一页'),
            ),
          ],
        ),
      ),
    );
  }
}
