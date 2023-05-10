import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/utils/storage.dart';

class AppState extends ChangeNotifier {
  bool initialized = true;
  bool isLoggedIn = false;
  var _userInfo;

  get userInfo => _userInfo;

  set setUserInfo(info) {
    _userInfo = info;
    notifyListeners();
  }

  Future setIsLogin(bool status) async {
    isLoggedIn = status;

    final boxAuth = await Hive.openBox('auth');
    boxAuth.put(BOX_KEY.isLoggedIn.toString(), status);
    notifyListeners();
  }

  Future initialApp() async {
    final boxAuth = await Hive.openBox('auth');
    final getIsLoggedIn =
        await boxAuth.get(BOX_KEY.isLoggedIn.toString()) ?? false;

    isLoggedIn = getIsLoggedIn;
    initialized = false;
    notifyListeners();
  }
}
