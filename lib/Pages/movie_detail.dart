import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  const MovieDetail({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List? movieData = [];
  Future? getMovieDetails;
  @override
  void initState() {
    super.initState();
    getMovieDetails = getTheMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(children: [
                    FutureBuilder(
                      future: getMovieDetails,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          //convert the data to a list
                          movieData = [snapshot.data];
                          print(movieData);
                          //List movie = snapshot.data! as List;
                          //print(movie);
                          return Container(
                            //margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //itemCount: movie.length,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://assets.gadgets360cdn.com/pricee/assets/product/202104/The-Misfits-250x358_1619719871.jpg'
                                          //imageUrl + movie[0]['backdrop_path'],
                                          ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              // child: Container(
                              //   width: MediaQuery.of(context).size.width,
                              //   height: MediaQuery.of(context).size.height * 0.3,
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       image: NetworkImage(movieData.isEmpty
                              //           ? 'https://www.filmibeat.com/img/320x100x392/popcorn/trending_news/tom-hardy-venom-2-arriving-early-in-india-5682-20210929165419.jpg'
                              //           : imageUrl + movieData[0]['backdrop_path']),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
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
                                  onPressed: () {},
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
                ),
              ]))
        ])));
  }
}
