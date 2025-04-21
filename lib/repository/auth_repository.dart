

import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class AuthRepository {
  final _apiService = NetWorkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try
    {
      dynamic response = await _apiService.fetchPostApiResponse(data, AppUrl.loginApiEndPoint);

      return response;
    }catch(e){
      throw e;
    }
  }


  Future<dynamic> registerApi(dynamic data) async {
    try
    {
      dynamic response = await _apiService.fetchPostApiResponse(data, AppUrl.registerApiEndPoint);

      return response;
    }catch(e){
      throw e;
    }

  }









}