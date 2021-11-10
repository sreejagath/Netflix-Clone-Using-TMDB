import 'dart:ui';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Pages/movie_detail.dart';
import '../Data Fetch/default_datas.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  _SeriesPageState createState() => _SeriesPageState();
}

List moviePosters = [
  'https://assets.gadgets360cdn.com/pricee/assets/product/202105/Shang-Chi-and-the-Legend-of-the-Ten-Rings-250x358_1620148205.jpg',
  'https://assets.gadgets360cdn.com/pricee/assets/product/202105/Last-Night-in-Soho-250_1622213167.jpg?downsize=215:293&output-quality=80',
  'https://www.filmibeat.com/img/320x100x392/popcorn/trending_news/tom-hardy-venom-2-arriving-early-in-india-5682-20210929165419.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvzGipSZjiSGIn0ggrexIXHiD9OR4NIhOsuA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh98s5uvVYTuiy8l7A60yUdTdcEqrDge9ATQ&usqp=CAU',
  'https://filmfare.wwmindia.com/content/2021/aug/hollywood-action-movies-in-hindi-mad-max-fury-road-41627886304.jpg',
  'https://assets.gadgets360cdn.com/pricee/assets/product/202104/The-Misfits-250x358_1619719871.jpg'
];

class _SeriesPageState extends State<SeriesPage> {
  late Future<Album> futureAlbum;
  late Future<Trending> futureTrending;
  Future? fetchCrimeMovies;
  Future? fetchComedyMovies;
  Future? fetchTrendingMovies;
  Future? fetchActionMovies;
  List movieData = [];
  List actionMovieData = [];
  List comedyMovieData = [];
  List crimeMovieData = [];
  final random = new Random();
  //late Future<Trending>
  @override
  void initState() {
    super.initState();
    setState(() {
      fetchMovie();
    });
    setState(() {
      movieData = movieData;
    });
    fetchCrimeMovies = fetchCrimeMovie();
    fetchComedyMovies = fetchComedyMovie();
    fetchTrendingMovies = fetchTrendingMovie();
    fetchActionMovies = fetchActionMovie();
  }

  fetchMovie() async {
    movieData = await fetchTrendingMovie();
    actionMovieData = await fetchActionMovie();
    comedyMovieData = await fetchComedyMovie();
    //crimeMovieData = await fetchCrimeMovie();
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
                                        builder: (context) => MovieDetail(
                                            id: movie[index]['id']),
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
                                        builder: (context) => MovieDetail(
                                            id: movie[index]['id']),
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
                                        builder: (context) => MovieDetail(
                                            id: movie[index]['id']),
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
                                        builder: (context) => MovieDetail(
                                            id: movie[index]['id']),
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
