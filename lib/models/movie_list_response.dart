// class MovieListResponse {
//   List<Movies>? _movies;
//
//   MovieListResponse({List<Movies>? movies}) {
//     if (movies != null) {
//       this._movies = movies;
//     }
//   }
//
//   List<Movies>? get movies => _movies;
//   set movies(List<Movies>? movies) => _movies = movies;
//
//   MovieListResponse.fromJson(Map<String, dynamic> json) {
//     if (json['movies'] != null) {
//       _movies = <Movies>[];
//       json['movies'].forEach((v) {
//         _movies!.add(new Movies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this._movies != null) {
//       data['movies'] = this._movies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Movies {
//   String? _id;
//   String? _title;
//   String? _year;
//   List<String>? _genres;
//   List<int>? _ratings;
//   String? _poster;
//   dynamic? _contentRating;
//   String? _duration;
//   String? _releaseDate;
//   dynamic? _averageRating;
//   String? _originalTitle;
//   String? _storyline;
//   List<String>? _actors;
//   dynamic? _imdbRating;
//   String? _posterurl;
//
//   Movies(
//       {String? id,
//         String? title,
//         String? year,
//         List<String>? genres,
//         List<int>? ratings,
//         String? poster,
//         String? contentRating,
//         String? duration,
//         String? releaseDate,
//         int? averageRating,
//         String? originalTitle,
//         String? storyline,
//         List<String>? actors,
//         String? imdbRating,
//         String? posterurl}) {
//     if (id != null) {
//       this._id = id;
//     }
//     if (title != null) {
//       this._title = title;
//     }
//     if (year != null) {
//       this._year = year;
//     }
//     if (genres != null) {
//       this._genres = genres;
//     }
//     if (ratings != null) {
//       this._ratings = ratings;
//     }
//     if (poster != null) {
//       this._poster = poster;
//     }
//     if (contentRating != null) {
//       this._contentRating = contentRating;
//     }
//     if (duration != null) {
//       this._duration = duration;
//     }
//     if (releaseDate != null) {
//       this._releaseDate = releaseDate;
//     }
//     if (averageRating != null) {
//       this._averageRating = averageRating;
//     }
//     if (originalTitle != null) {
//       this._originalTitle = originalTitle;
//     }
//     if (storyline != null) {
//       this._storyline = storyline;
//     }
//     if (actors != null) {
//       this._actors = actors;
//     }
//     if (imdbRating != null) {
//       this._imdbRating = imdbRating;
//     }
//     if (posterurl != null) {
//       this._posterurl = posterurl;
//     }
//   }
//
//   String? get id => _id;
//   set id(String? id) => _id = id;
//   String? get title => _title;
//   set title(String? title) => _title = title;
//   String? get year => _year;
//   set year(String? year) => _year = year;
//   List<String>? get genres => _genres;
//   set genres(List<String>? genres) => _genres = genres;
//   List<int>? get ratings => _ratings;
//   set ratings(List<int>? ratings) => _ratings = ratings;
//   String? get poster => _poster;
//   set poster(String? poster) => _poster = poster;
//   String? get contentRating => _contentRating;
//   set contentRating(String? contentRating) => _contentRating = contentRating;
//   String? get duration => _duration;
//   set duration(String? duration) => _duration = duration;
//   String? get releaseDate => _releaseDate;
//   set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
//   int? get averageRating => _averageRating;
//   set averageRating(int? averageRating) => _averageRating = averageRating;
//   String? get originalTitle => _originalTitle;
//   set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
//   String? get storyline => _storyline;
//   set storyline(String? storyline) => _storyline = storyline;
//   List<String>? get actors => _actors;
//   set actors(List<String>? actors) => _actors = actors;
//   String? get imdbRating => _imdbRating;
//   set imdbRating(String? imdbRating) => _imdbRating = imdbRating;
//   String? get posterurl => _posterurl;
//   set posterurl(String? posterurl) => _posterurl = posterurl;
//
//   Movies.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _title = json['title'];
//     _year = json['year'];
//     _genres = json['genres'].cast<String>();
//     _ratings = json['ratings'].cast<int>();
//     _poster = json['poster'];
//     _contentRating = json['contentRating'];
//     _duration = json['duration'];
//     _releaseDate = json['releaseDate'];
//     _averageRating = json['averageRating'];
//     _originalTitle = json['originalTitle'];
//     _storyline = json['storyline'];
//     _actors = json['actors'].cast<String>();
//     _imdbRating = json['imdbRating'];
//     _posterurl = json['posterurl'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this._id;
//     data['title'] = this._title;
//     data['year'] = this._year;
//     data['genres'] = this._genres;
//     data['ratings'] = this._ratings;
//     data['poster'] = this._poster;
//     data['contentRating'] = this._contentRating;
//     data['duration'] = this._duration;
//     data['releaseDate'] = this._releaseDate;
//     data['averageRating'] = this._averageRating;
//     data['originalTitle'] = this._originalTitle;
//     data['storyline'] = this._storyline;
//     data['actors'] = this._actors;
//     data['imdbRating'] = this._imdbRating;
//     data['posterurl'] = this._posterurl;
//     return data;
//   }
// }


import 'Movie.dart';

class MovieListResponse {
  final List<Movie>? movies;

  MovieListResponse({this.movies});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      movies: json['movies'] != null
          ? List<Movie>.from(json['movies'].map((x) => Movie.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movies': movies?.map((x) => x.toJson()).toList(),
    };
  }
}
