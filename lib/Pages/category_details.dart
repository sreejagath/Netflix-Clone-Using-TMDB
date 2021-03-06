import 'dart:ui';
import 'dart:math';
import 'package:netflix_clone/Pages/movie_detail.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';

class CategoryDetails extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  const CategoryDetails(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  Future? fetchMovieByCategory;
  final random = Random();
  @override
  void initState() {
    super.initState();
    fetchMovieByCategory = getMoviesCategoryWise(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(10);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: FutureBuilder(
                  future: fetchMovieByCategory,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          children: const [
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
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.categoryName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: fetchMovieByCategory,
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
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Suspenseful Actions',
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // FutureBuilder(
              //   future: fetchActionMovies,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       List movie = snapshot.data! as List;
              //       return Container(
              //           height: 200,
              //           width: double.infinity,
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.horizontal,
              //               itemCount: movie.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Row(
              //                   children: [
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) =>
              //                                 MovieDetail(id: movie[index]['id']),
              //                           ),
              //                         );
              //                       },
              //                       child: SizedBox(
              //                           height: 180,
              //                           width: 150,
              //                           child: ClipRRect(
              //                             borderRadius:
              //                                 BorderRadius.circular(10.0),
              //                             child: Image.network(
              //                               imageUrl +
              //                                   movie[index]['backdrop_path'],
              //                               fit: BoxFit.cover,
              //                             ),
              //                           )),
              //                     ),
              //                     const SizedBox(
              //                       width: 20,
              //                     )
              //                   ],
              //                 );
              //               }));
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Comedy',
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // FutureBuilder(
              //   future: fetchComedyMovies,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       List movie = snapshot.data! as List;
              //       return Container(
              //           height: 200,
              //           width: double.infinity,
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.horizontal,
              //               itemCount: movie.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Row(
              //                   children: [
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) =>
              //                                 MovieDetail(id: movie[index]['id']),
              //                           ),
              //                         );
              //                       },
              //                       child: SizedBox(
              //                           height: 180,
              //                           width: 150,
              //                           child: ClipRRect(
              //                             borderRadius:
              //                                 BorderRadius.circular(10.0),
              //                             child: Image.network(
              //                               imageUrl +
              //                                   movie[index]['backdrop_path'],
              //                               fit: BoxFit.cover,
              //                             ),
              //                           )),
              //                     ),
              //                     const SizedBox(
              //                       width: 20,
              //                     )
              //                   ],
              //                 );
              //               }));
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Crime Thrillers',
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // FutureBuilder(
              //   future: fetchCrimeMovies,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       List movie = snapshot.data! as List;
              //       return Container(
              //           height: 200,
              //           width: double.infinity,
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.horizontal,
              //               itemCount: movie.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Row(
              //                   children: [
              //                     GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (context) =>
              //                                 MovieDetail(id: movie[index]['id']),
              //                           ),
              //                         );
              //                       },
              //                       child: SizedBox(
              //                           height: 180,
              //                           width: 150,
              //                           child: ClipRRect(
              //                             borderRadius:
              //                                 BorderRadius.circular(10.0),
              //                             child: Image.network(
              //                               imageUrl +
              //                                   movie[index]['backdrop_path'],
              //                               fit: BoxFit.cover,
              //                             ),
              //                           )),
              //                     ),
              //                     const SizedBox(
              //                       width: 20,
              //                     )
              //                   ],
              //                 );
              //               }));
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
