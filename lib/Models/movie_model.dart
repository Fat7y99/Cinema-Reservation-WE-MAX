import 'package:intl/intl.dart';

class MovieModel {
  int id;

  String title;

  DateTime startTime;

  DateTime endTime;

  int screenRoom;

  String imageURL;

  MovieModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.screenRoom,
    required this.imageURL,
  });

  @override
  String toString() {
    return 'MovieModel[id=$id, title=$title, startTime=$startTime, endTime=$endTime, screenRoom=$screenRoom, posterImage=$imageURL, ]';
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      startTime: DateTime.parse(json['startDateTime']),
      endTime: DateTime.parse(json['endDateTime']),
      screenRoom: json['screenRoom'],
      imageURL: json['posterImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startTime': DateFormat("yyyy-MM-dd HH:mm:ss").format(startTime),
      'endTime': DateFormat("yyyy-MM-dd HH:mm:ss").format(endTime),
      'screenRoom': screenRoom,
      'posterImage': imageURL
    };
  }

  static List<MovieModel> listFromJson(List<dynamic> json) {
    return json.map((value) => MovieModel.fromJson(value)).toList();
  }

  static Map<String, MovieModel> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = Map<String, MovieModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = MovieModel.fromJson(value));
    }
    return map;
  }
}

List<MovieModel> movies = [
  MovieModel(
    id: 1,
    title: 'The Irishman',
    startTime: DateTime(10 - 10 - 2021),
    endTime: DateTime(10 - 10 - 2021),
    screenRoom: 1,
    imageURL:
        'https://lh6.googleusercontent.com/proxy/Q7IxHgbc0KPJJXyz3iG4YtLoZ2tujvlF4_NOHJWj54bnD133PH4LJQb_vyrUSQ45rL8XHe-doyHDp9SY9vA3pn43e-iQA236PQ',
  ),
  MovieModel(
    id: 2,
    title: 'JOKER',
    startTime: DateTime(10 - 10 - 2021),
    endTime: DateTime(10 - 10 - 2021),
    screenRoom: 2,
    imageURL:
        'https://mir-s3-cdn-cf.behance.net/project_modules/1400/c58b4681277211.5cfa6e54a6d3d.jpg',
  ),
  MovieModel(
    id: 3,
    title: 'Avengers: Endgame',
    startTime: DateTime(10 - 10 - 2021),
    endTime: DateTime(10 - 10 - 2021),
    screenRoom: 2,
    imageURL:
        'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
  ),
  MovieModel(
    id: 4,
    title: 'Spider-Man: No Way Home',
    startTime: DateTime(10 - 10 - 2021),
    endTime: DateTime(10 - 10 - 2021),
    screenRoom: 1,
    imageURL:
        'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2021/11/Spider-Man-No-Way-Home-new-poster.jpeg?q=50&fit=contain&w=960&h=500&dpr=1.5 ',
  ),
];

bool insertMovies(MovieModel movie) {
  if (movies.contains(movie) || getMovieByID(movie.id).id != -1) {
    return false;
  } else {
    movies.add(movie);
    return true;
  }
}

void updateMovies(List<MovieModel> m2) {
  movies = m2;
}

void update(int id, MovieModel movie) {
  movies[id] = movie;
}

MovieModel getMovieByID(int id) {
  for (MovieModel movie in movies) {
    if (movie.id == id) {
      return movie;
    }
  }
  MovieModel dummyMovie = movies[0];
  dummyMovie.id = -1;
  dummyMovie.title = 'Movie not found';
  return dummyMovie;
}
