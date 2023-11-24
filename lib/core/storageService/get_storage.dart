import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/core/widgets/user_model.dart';

class GSServices {
  GSServices._();
  static final GetStorage _userGS = GetStorage('user');

  static Future<void> initialize() async {
    await GetStorage.init('locale');
    await GetStorage.init('user');
  }

  static Future<void> setUser({required UserModel user}) async {
    await _userGS.write('user', jsonEncode(user.toMap()));
    debugPrint("<--- Local User Updated => ${getUser?.firstName} --->");
  }

  static UserModel? get getUser => isNullEmptyOrFalse(_userGS.read('user'))
      ? null
      : UserModel.fromMap(jsonDecode(_userGS.read('user')));

  static Future<void> clearLocalStorage() async {
    await _userGS.erase();
  }
}
