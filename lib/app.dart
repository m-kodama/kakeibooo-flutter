import 'package:flutter/material.dart';
import 'package:kakeibooo_flutter/core/app_theme.dart';
import 'package:kakeibooo_flutter/feature/init/ui/init_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kakeibooo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const InitPage(),
    );
  }
}
