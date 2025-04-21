import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_state/models/user_model.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/view_model/user_view_model.dart';

import '../../utils/utils.dart';

class SplashServices {
  Future<UserModel?> getUserData() => UserViewModel().getUser();

  void checkAuthentication (BuildContext context ) async {
    getUserData().then((value){
      print(value?.token);
      if(value!.token == 'null' || value!.token == ''){
        Future.delayed(Duration(seconds: 30));
        Navigator.pushNamed(context, RoutesName.loginScreen);
      }else {
        Future.delayed(Duration(seconds: 30));
        Navigator.pushNamed(context, RoutesName.homeScreen);
      }

    }).onError((error,stackTrace){
      if (kDebugMode) {
       print(error.toString());
      }
    });
  }




}