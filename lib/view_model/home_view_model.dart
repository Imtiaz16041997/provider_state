import 'package:flutter/cupertino.dart';
import 'package:provider_state/data/response/api_response.dart';
import 'package:provider_state/models/movie_list_response.dart';
import 'package:provider_state/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
final _homeRepository = HomeRepository();

ApiResponse<MovieListResponse> movieList = ApiResponse.loading();

 setMoviesList(ApiResponse<MovieListResponse> response){
  movieList = response;
  notifyListeners();
 }


Future<void> fetchMoviesListApi () async {
  setMoviesList(ApiResponse.loading());
  _homeRepository.moviesListApi().then((value){
    setMoviesList(ApiResponse.completed(value));
  }).onError((error,stackTrace){
    setMoviesList(ApiResponse.error(error.toString()));

  });
}


}