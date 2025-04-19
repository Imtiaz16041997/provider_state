abstract class BaseApiServices {
  Future<dynamic> fetchGetApiResponse(String url);
  Future<dynamic> fetchPostApiResponse(dynamic data,String url);
}