class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonListEntrante){

    if (jsonListEntrante == null) return;

    for (var item in jsonListEntrante) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.popularity,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> jsonEntrante){

    voteCount         = jsonEntrante['vote_count'];
    popularity        = jsonEntrante['popularity'] / 1;
    video             = jsonEntrante['video'];
    posterPath        = jsonEntrante['poster_path'];
    id                = jsonEntrante['id'];
    adult             = jsonEntrante['adult'];
    backdropPath      = jsonEntrante['backdrop_path'];
    originalLanguage  = jsonEntrante['original_language'];
    originalTitle     = jsonEntrante['original_title'];
    genreIds          = jsonEntrante['genre_ids'].cast<int>();
    title             = jsonEntrante['title'];
    voteAverage       = jsonEntrante['vote_average'] / 1;
    overview          = jsonEntrante['overview'];
    releaseDate       = jsonEntrante['release_date'];
  }

  getPosterImg(){

    if( posterPath==null){
      return 'https://es.zenit.org/wp-content/uploads/2018/05/no-image-icon.png';
    } else {    
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }

  }

}