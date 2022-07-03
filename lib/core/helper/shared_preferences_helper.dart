import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// runAppの中でSharedPreferencesHelperを生成してoverrideする
final sharedPreferencesProvider =
    Provider<SharedPreferencesHelper>((_) => throw UnimplementedError());

class SharedPreferencesHelper {
  SharedPreferencesHelper._(this._pref);

  static Future<SharedPreferencesHelper> init() async {
    final pref = await SharedPreferences.getInstance();
    return SharedPreferencesHelper._(pref);
  }

  late final SharedPreferences _pref;

  /// freezedで生成したDTOクラスをString型に変換する
  String toJsonString(dynamic dto) => jsonEncode(dto.toJson());

  /// チュートリアル完了フラグの取得
  ///
  /// 初期値: false
  bool getShowTutorial() {
    return _pref.getBool(SharedPreferencesKey.showTutorial.name) ?? false;
  }

  /// チュートリアル完了フラグの更新
  Future<bool> storeShowTutorial(bool showTutorial) async {
    return _pref.setBool(
      SharedPreferencesKey.showTutorial.name,
      showTutorial,
    );
  }

  /// 初回表示フラグの取得
  ///
  /// 初期値: true
  bool getIsFirstView() {
    return _pref.getBool(SharedPreferencesKey.isFirstView.name) ?? true;
  }

  /// 初回表示フラグの更新
  Future<bool> storeIsFirstView(bool isFirstView) async {
    return _pref.setBool(
      SharedPreferencesKey.isFirstView.name,
      isFirstView,
    );
  }
}

enum SharedPreferencesKey {
  /// 初回表示フラグ
  isFirstView,

  /// チュートリアル表示フラグ
  showTutorial,
}

extension SharedPreferencesKeyX on SharedPreferencesKey {
  String get name => toString().split('.').last;
}
