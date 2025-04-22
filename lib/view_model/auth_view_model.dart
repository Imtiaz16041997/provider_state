
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/repository/auth_repository.dart';
import 'package:provider_state/utils/routes/routes_name.dart';
import 'package:provider_state/utils/utils.dart';
import 'package:provider_state/view_model/user_view_model.dart';

import '../models/user_model.dart';

class AuthViewModelProvider with ChangeNotifier {

  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUploading = false;
  bool get signUpLoading => _signUploading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    try {
      dynamic result = await _myRepo.loginApi(data).then((value){
        setLoading(false);
        final userPreference = Provider.of<UserViewModel>(context,listen: false);
        userPreference.saveUser(
          UserModel(
            token: value['token'].toString()
          )
        );
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.homeScreen);
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

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    try {
      dynamic result = await _myRepo.registerApi(data).then((value){
        setSignUpLoading(false);
        Utils.flushBarErrorMessage('Sign Up Successfully', context);
        Navigator.pushNamed(context, RoutesName.homeScreen);
        if (kDebugMode) {
          print(value);
        }
      }).onError((error,stackTrace){
        setSignUpLoading(false);
        if (kDebugMode) {
          Utils.flushBarErrorMessage(error.toString(), context);
        }
      });
    }catch (error) {
      setSignUpLoading(false);
      print(error);
    }
  }
}