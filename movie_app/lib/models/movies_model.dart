class Movies {
  Movies({
    required this.averageRating, 
    required this.backdropPath, 
    required this.createdBy, 
    required this.description, 
    required this.id, 
    required this.iso_3166_1, 
    required this.iso_639_1, 
    required this.name, 
    required this.page, 
    required this.posterPath, 
    required this.public, 
    required this.results, 
    required this.revenue, 
    required this.runtime, 
    required this.sortBy, 
    required this.totalPages, 
    required this.totalResult,
  });


  late final double averageRating;
  late final String backdropPath;
  late final CreatedBy createdBy;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<Movies> results;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResult;

  Movies.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    description = json['description'];
    id = json['id'];
    iso_3166_1 = json['iso_3166_1'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    public = json['public'];
    results = Movie.fromJson(json['results']); //
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResult = json['total_results'];

  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['average_rating'] = averageRating;
    _data['backdrop_path'] = backdropPath;
    _data['created_by'] = createdBy.toJson();
    _data['description'] = description;
    _data['id'] = id;
    _data['iso_3166_1'] = iso_3166_1;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    _data['page'] = page;
    _data['poster_path'] = posterPath;
    _data['public'] = public;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['sort_by'] = sortBy;
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResult;
    
    return _data;
  }
  
}

class CreatedBy {
  CreatedBy({
    required this.gravatarHash,
    required this.id,
    required this.name,
    required this.username,
  });

  late final String gravatarHash;
  late final String id;
  late final String name;
  late final String username; 

  CreatedBy.fromJson(Map<String, dynamic> json) {
    gravatarHash = json['gravatar_hash'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }
  
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar_hash'] = gravatarHash;
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    
    return _data;
  }
}

class Movie {
  final bool adult;
  final String backdroPath;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final double voteCount;

  Movie({
    required this.adult, 
    required this.backdroPath, 
    required this.genreIds, 
    required this.id, 
    required this.mediaType, 
    required this.originalLanguage, 
    required this.originalTitle, 
    required this.overview, 
    required this.popularity, 
    required this.posterPath, 
    required this.releaseDate, 
    required this.title, 
    required this.video, 
    required this.voteAverage, 
    required this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroPath = json['id'];
    name = json['name'];
    username = json['username'];
  }
  
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar_hash'] = gravatarHash;
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    
    return _data;
  }
}