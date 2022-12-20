// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:supercellostore/main.dart';
import 'dart:convert';

import '../../model/user_model.dart';

class LocalStorageUser {
  Future<UserModel?> get getuser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUserData(UserModel userModel) async {
    await sharepref!.setString('user', json.encode(userModel.toJson()));
  }

  deleteUserData() async {
    await sharepref!.clear();
  }

  _getUserData() async {
    var value = sharepref!.getString('user');
    return UserModel.fromJson(json.decode(value!));
  }
}
