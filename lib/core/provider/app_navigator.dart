import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainNavigatorKeyProvider = Provider((_) => AppNavigator.mainNavigatorKey);

class AppNavigator {
  const AppNavigator._();

  static final mainNavigatorKey = GlobalKey<NavigatorState>();
}

extension NavigatorStateEx on NavigatorState {
  BuildContext get descendantContext => overlay!.context;
}
