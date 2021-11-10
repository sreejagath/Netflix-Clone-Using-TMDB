// import 'package:flutter/material.dart';

// class MoviesPage extends StatefulWidget {
//   const MoviesPage({Key? key}) : super(key: key);

//   @override
//   _MoviesPageState createState() => _MoviesPageState();
// }

// class _MoviesPageState extends State<MoviesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'dart:ui';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Pages/movie_detail.dart';
import '../Data Fetch/default_datas.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future? fetchCrimeMovies;
  Future? fetchComedyMovies;
  Future? fetchTrendingMovies;
  Future? fetchActionMovies;
  final random = new Random();
  //late Future<Trending>
  @override
  void initState() {
    super.initState();
    fetchCrimeMovies = fetchCrimeMovie();
    fetchComedyMovies = fetchComedyMovie();
    fetchTrendingMovies = fetchTrendingMovie();
    fetchActionMovies = fetchActionMovie();
  }

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(10);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: FutureBuilder(
                future: fetchTrendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List movie = snapshot.data! as List;
                    return Column(
                      children: [
                        Stack(children: [
                          Container(
                            //margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movie.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageUrl +
                                            movie[randomNumber]
                                                ['backdrop_path'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            //title and play button
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.height * 0.2,
                              left: MediaQuery.of(context).size.width * 0.2,
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height * 0.1,
                                  // ),
                                  // Text(
                                  //   movieData.isEmpty
                                  //       ? 'Trending Movies'
                                  //       : movieData[0]['title'],
                                  //   style: TextStyle(
                                  //       fontSize: 25,
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.white),
                                  // ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Icon(
                                      //   Icons.play_circle_outline,
                                      //   color: Colors.white,
                                      //   size: 30,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          Text('My List')
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return MovieDetail(
                                              id: movie[randomNumber]['id'],
                                            );
                                          }));
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              'Play',
                                              style: TextStyle(
                                                color: Colors.black,
                                                //fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.info,
                                            color: Colors.white,
                                          ),
                                          Text('Info')
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ]),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Trending Now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: fetchTrendingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List movie = snapshot.data! as List;
                  return Container(
                      //margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetail(id: movie[index]['id']),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          imageUrl +
                                              movie[index]['backdrop_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Suspenseful Actions',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: fetchActionMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List movie = snapshot.data! as List;
                  return Container(
                      //margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetail(id: movie[index]['id']),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          imageUrl +
                                              movie[index]['backdrop_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Comedy',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: fetchComedyMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List movie = snapshot.data! as List;
                  return Container(
                      //margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetail(id: movie[index]['id']),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          imageUrl +
                                              movie[index]['backdrop_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Crime Thrillers',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: fetchCrimeMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List movie = snapshot.data! as List;
                  return Container(
                      //margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetail(id: movie[index]['id']),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          imageUrl +
                                              movie[index]['backdrop_path'],
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
