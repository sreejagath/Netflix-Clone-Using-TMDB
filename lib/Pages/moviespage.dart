import 'dart:ui';
import 'dart:math';
import 'package:netflix_clone/Pages/movie_detail.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';
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
  final random = Random();
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
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageUrl +
                                            movie[randomNumber]['poster_path'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: const [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          Text('My List')
                                        ],
                                      ),
                                      const SizedBox(
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
                                          children: const [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              'Play',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Stack(children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[900],
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            15))),
                                                            height: 350,
                                                            //color: Colors.black,
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                150,
                                                                            child:
                                                                                Image.network(imageUrl + movie[randomNumber]['poster_path'], fit: BoxFit.cover)),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            Container(
                                                                              width: 200,
                                                                              child: Text(
                                                                                movie[randomNumber]['title'] ?? '--No Title Availiable--',
                                                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              width: 200,
                                                                              child: Text(
                                                                                movie[randomNumber]['release_date'].length > 4 ? movie[randomNumber]['release_date'].substring(0, 4) : '--No Release Date Availiable--',
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              width: 200,
                                                                              child: Text(
                                                                                movie[randomNumber]['overview'].length > 100 ? movie[randomNumber]['overview'].substring(0, 100) + '...' : movie[randomNumber]['overview'],
                                                                                //?? '--No Overview Availiable--',
                                                                                style: TextStyle(fontSize: 15, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              200,
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                                                return MovieDetail(
                                                                                  id: movie[randomNumber]['id'],
                                                                                );
                                                                              }));
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              primary: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.download,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Text('Download')
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              25,
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.play_arrow_outlined,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Text('Preview')
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(),
                                                                  ListTile(
                                                                      title: Text(
                                                                          'Episodes & Info',
                                                                          style: TextStyle(
                                                                              color: Colors
                                                                                  .white)),
                                                                      leading: Icon(
                                                                          Icons
                                                                              .info,
                                                                          color: Colors
                                                                              .white),
                                                                      trailing: Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              Colors.white))
                                                                ])),
                                                        Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Colors
                                                                      .white)),
                                                        )
                                                      ]);
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.info,
                                                color: Colors.white,
                                              )),
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
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const SizedBox(
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
                                              movie[index]['poster_path'],
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
                                              movie[index]['poster_path'],
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
                                              movie[index]['poster_path'],
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
                                              movie[index]['poster_path'],
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
