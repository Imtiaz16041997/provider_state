import 'package:flutter/cupertino.dart';
import 'package:provider_state/data/response/api_response.dart';
import 'package:provider_state/models/movie_list_response.dart';
import 'package:provider_state/repository/home_repository.dart';

import '../models/Movie.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepository = HomeRepository();

  ApiResponse<List<Movie>> movieList = ApiResponse.loading();
  List<Movie> _allMovies = [];
  List<Movie> _visibleMovies = [];

  final int _pageSize = 10;
  int _currentPage = 0;
  bool _isFetchingMore = false;

  List<Movie> get movies => _visibleMovies;
  bool get isFetchingMore => _isFetchingMore;

  Future<void> fetchMovies() async {
    movieList = ApiResponse.loading();
    notifyListeners();

    try {
      MovieListResponse response = await _homeRepository.moviesListApi();
      _allMovies = response.movies!;
      _currentPage = 1;
      _visibleMovies = _allMovies.take(_pageSize).toList();
      movieList = ApiResponse.completed(_visibleMovies);
    } catch (e) {
      movieList = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  void loadMore() {
    if (_isFetchingMore) return;
    if (_visibleMovies.length >= _allMovies.length) return;

    _isFetchingMore = true;
    notifyListeners();

    _currentPage++;
    int endIndex = _pageSize * _currentPage;
    if (endIndex > _allMovies.length) {
      endIndex = _allMovies.length;
    }

    _visibleMovies = _allMovies.take(endIndex).toList();
    _isFetchingMore = false;
    notifyListeners();
  }
}
