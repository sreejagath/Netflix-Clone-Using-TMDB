import 'package:http/http.dart' as http;
import 'dart:convert';
import './default_datas.dart';
// Future<http.Response> fetchAlbum() {
//   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
// }

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Trending {
  final String title;
  final int id;
  final String imagePath;

  Trending({
    required this.imagePath,
    required this.id,
    required this.title,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      title: json['title'],
      imagePath: json['backdrop_path'],
      id: json['id'],
    );
  }
}

Future<Trending> fetchTrending() async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'trending/all/week?api_key=' + api + '&language=en-US'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    // print(jsonData['results']);

    return Trending.fromJson(jsonData['results'][0]);
  } else {
    throw Exception('Failed to load album');
  }
}

Future fetchTrendingMovie() async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'trending/all/week?api_key=' + api + '&language=en-US'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}

Future fetchActionMovie() async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'discover/movie?api_key=' + api + '&with_genres=28'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}

Future fetchComedyMovie() async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'discover/movie?api_key=' + api + '&with_genres=35'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}

Future fetchCrimeMovie() async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'discover/movie?api_key=' + api + '&with_genres=80'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}

Future getTheMovie(int id) async {
  final response = await http.get(Uri.parse(
      defaultUrl + 'movie/' + id.toString()+ '?api_key=' + api + '&language=en-US'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Failed to load album');
  }
}

Future getMoviesCategoryWise(int id)async{
  final response = await http.get(Uri.parse(
      defaultUrl + 'discover/movie?api_key=' + api + '&with_genres=' + id.toString()));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}
