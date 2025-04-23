import 'package:provider_state/models/movie_list_response.dart';

import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class HomeRepository {
  final _apiService = NetWorkApiServices();
  Future<MovieListResponse> moviesListApi() async {
    try {
      dynamic response = await _apiService.fetchGetApiResponse(AppUrl.moviesListEndPoint);
      return MovieListResponse.fromJson(response);

    }catch(e) {
      throw e;
    }

  }
}

