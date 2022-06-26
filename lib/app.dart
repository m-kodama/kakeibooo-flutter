import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakeibooo_flutter/core/app_theme.dart';
import 'package:kakeibooo_flutter/core/provider/app_navigator.dart';
import 'package:kakeibooo_flutter/core/provider/main_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Kakeibooo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      navigatorKey: ref.watch(mainNavigatorKeyProvider),
      onGenerateRoute: ref.watch(mainRouterProvider).onGenerateRoute,
    );
  }
}
