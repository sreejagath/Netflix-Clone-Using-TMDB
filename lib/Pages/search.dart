import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';
import 'package:netflix_clone/Pages/movie_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future? fetchTrendingMovies;
  Future? searchedMoviesList;
  @override
  void initState() {
    super.initState();
    fetchTrendingMovies = fetchTrendingMovie();
    //searchedMoviesList = searchMovies(query: searchQuery.text);
  }

  String searchText = "";
  List searchedData = [];

  @override
  Widget build(BuildContext context) {
    GlobalKey searchKey = GlobalKey();
    TextEditingController searchQuery = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Form(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: searchQuery,
                onChanged: (value) {
                  searchText = value;
                  searchedMoviesList = searchMovies(searchText);
                },
                decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    fillColor: Colors.grey[800],
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey[400]),
                    hintText: 'Search for programmes, movies, genres etc.',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white),
          )),

          searchText.isEmpty
              ? FutureBuilder(
                  future: fetchTrendingMovies,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      List movie = snapshot.data! as List;

                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: movie.length,
                            itemBuilder: (BuildContext context, int index) {
                              int movieId = movie[index]['id'];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MovieDetail(
                                                  id: movieId,
                                                )));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    color: Colors.grey[900],
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 50,
                                          //color: Colors.black,
                                          child: Image.network(
                                            imageUrl +
                                                movie[index]['poster_path'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                movie[index]['title'] ??
                                                    '-- No Title Availiable --',
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                )
              : Container(),
          //decoration: InputDecoration(hintText: 'Search'))),
        ])));
  }
}
