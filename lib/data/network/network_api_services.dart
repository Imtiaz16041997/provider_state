import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider_state/data/network/base_api_services.dart';

import '../app_exception.dart';

class NetWorkApiServices extends BaseApiServices{

  @override
  Future fetchGetApiResponse(String url) async {
    if(kDebugMode ){
      print(url);
    }
    dynamic responseJson;
    try{
      final response = await get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOutException {
      throw RequestTimeOutException('');
    }

    return responseJson;
  }



  @override
  Future fetchPostApiResponse(dynamic data,String url) async {
    if(kDebugMode ){
      print(url);
    }
    dynamic responseJson;
    try{
      Response response = await post(Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOutException {
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error Occured while communicating with server '+response.statusCode.toString());
    }
  }

}