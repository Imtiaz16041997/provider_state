import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_state/models/user_model.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/user_preferences_view_model.dart';

import '../../utils/utils.dart';

class SplashServices {
  Future<UserModel?> getUserData() => UserPreferencesViewModel().getUser();

  void checkAuthentication (BuildContext context ) async {
    getUserData().then((value) async {
      print(value?.token);
      if(value?.token.toString() == 'null' || value?.token.toString() == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.loginScreen);
      }else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.homeScreen);
      }

    }).onError((error,stackTrace){
      if (kDebugMode) {
       print(error.toString());
      }
    });
  }




}