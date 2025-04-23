class Movie {
  final String? id;
  final String? title;
  final String? year;
  final List<String>? genres;
  final List<int>? ratings;
  final String? poster;
  final String? contentRating;
  final String? duration;
  final String? releaseDate;
  final dynamic averageRating;
  final String? originalTitle;
  final String? storyline;
  final List<String>? actors;
  final dynamic imdbRating;
  final String? posterurl;

  Movie({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterurl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genres: List<String>.from(json['genres'] ?? []),
      ratings: List<int>.from(json['ratings'] ?? []),
      poster: json['poster'],
      contentRating: json['contentRating'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      averageRating: json['averageRating'],
      originalTitle: json['originalTitle'],
      storyline: json['storyline'],
      actors: List<String>.from(json['actors'] ?? []),
      imdbRating: json['imdbRating'],
      posterurl: json['posterurl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genres': genres,
      'ratings': ratings,
      'poster': poster,
      'contentRating': contentRating,
      'duration': duration,
      'releaseDate': releaseDate,
      'averageRating': averageRating,
      'originalTitle': originalTitle,
      'storyline': storyline,
      'actors': actors,
      'imdbRating': imdbRating,
      'posterurl': posterurl,
    };
  }
}
