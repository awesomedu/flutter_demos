import 'package:flutter/material.dart';

// 导入所有Widget演示页面
import 'pages/basic_layout_page.dart';
import 'pages/list_widgets_page.dart';
import 'pages/form_widgets_page.dart';
import 'pages/dialog_widgets_page.dart';
import 'pages/navigation_widgets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 企业开发常用Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // 关闭右上角的debug标签
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 定义所有示例页面
    final List<Map<String, dynamic>> examples = [
      {
        'title': '基础布局Widget',
        'description': 'Container, Row, Column, Stack等基础布局组件的使用',
        'icon': Icons.layers,
        'page': const BasicLayoutPage(),
      },
      {
        'title': '列表相关Widget',
        'description': 'ListView, GridView等列表组件的使用',
        'icon': Icons.list,
        'page': const ListWidgetsPage(),
      },
      {
        'title': '表单相关Widget',
        'description': 'TextField, Form, CheckBox等表单组件的使用',
        'icon': Icons.edit_document,
        'page': const FormWidgetsPage(),
      },
      {
        'title': '弹窗和提示Widget',
        'description': 'Dialog, SnackBar, BottomSheet等交互组件的使用',
        'icon': Icons.notifications,
        'page': const DialogWidgetsPage(),
      },
      {
        'title': '导航和路由Widget',
        'description': 'Navigator, TabBar, Drawer等导航组件的使用',
        'icon': Icons.menu,
        'page': const NavigationWidgetsPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter企业开发常用Widget'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: examples.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Icon(
                examples[index]['icon'],
                size: 40.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                examples[index]['title'],
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(examples[index]['description']),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => examples[index]['page'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
