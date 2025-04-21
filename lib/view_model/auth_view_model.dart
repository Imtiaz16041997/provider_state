
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_state/repository/auth_repository.dart';
import 'package:provider_state/utils/utils.dart';

class AuthViewModelProvider with ChangeNotifier {

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    try {
      dynamic result = await _myRepo.loginApi(data).then((value){
        Utils.flushBarErrorMessage('Login Successfully', context);
        if (kDebugMode) {
          print(value);
        }
      }).onError((error,stackTrace){
        if (kDebugMode) {
          Utils.flushBarErrorMessage(error.toString(), context);
        }
      });
    }catch (error) {
      print(error);
    }
  }
}