import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakeibooo_flutter/feature/home/ui/home_page.dart';
import 'package:kakeibooo_flutter/feature/init/ui/init_page.dart';

final mainRouterProvider = Provider((_) => _Router());

class _Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    '/': (_) => const InitPage(),
    InitPage.routeName: (_) => const InitPage(),
    HomePage.routeName: (_) => const HomePage(),
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final pushPage = pushRoutes[settings.name]!;
    return MaterialPageRoute<void>(
      settings: settings,
      builder: pushPage,
    );
  }
}
