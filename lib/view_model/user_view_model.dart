import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModel userResponse) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    //String userJson = jsonEncode(userResponse.toJson());
     sp.setString('token', userResponse.token.toString());
     notifyListeners();
    return true;
  }

  Future<UserModel?> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
      token: token.toString()
    );
    // String? userJson = sp.getString('user');
    // if (userJson != null) {
    //   Map<String, dynamic> userMap = jsonDecode(userJson);
    //   return UserResponse.fromJson(userMap);
    // } else {
    //   return null;
    // }
  }

  // Future<String?> getToken() async {
  //   final user = await getUser();
  //   return user?.result?.accessToken;
  // }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
