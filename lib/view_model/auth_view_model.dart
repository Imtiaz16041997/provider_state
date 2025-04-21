
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_state/repository/auth_repository.dart';
import 'package:provider_state/utils/utils.dart';

class AuthViewModelProvider with ChangeNotifier {

  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    try {
      dynamic result = await _myRepo.loginApi(data).then((value){
        setLoading(false);
        Utils.flushBarErrorMessage('Login Successfully', context);
        if (kDebugMode) {
          print(value);
        }
      }).onError((error,stackTrace){
        setLoading(false);
        if (kDebugMode) {
          Utils.flushBarErrorMessage(error.toString(), context);
        }
      });
    }catch (error) {
      setLoading(false);
      print(error);
    }
  }
}