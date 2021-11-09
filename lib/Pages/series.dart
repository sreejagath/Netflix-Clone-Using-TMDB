import 'dart:ui';
import 'package:http/http.dart' as http;
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
  List movieData = [];
  List actionMovieData = [];
  List comedyMovieData = [];
  //late Future<Trending>
  @override
  void initState() {
    super.initState();
    fetchMovie();
  }

  fetchMovie() async {
    movieData = await fetchTrendingMovie();
    actionMovieData = await fetchActionMovie();
    comedyMovieData = await fetchComedyMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Trending',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movieData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageUrl + movieData[index]['backdrop_path'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Action',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: actionMovieData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageUrl +
                                      actionMovieData[index]['backdrop_path'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    })),
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
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: comedyMovieData.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(comedyMovieData[index]['title']);
                      return Row(
                        children: [
                          SizedBox(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageUrl +
                                      comedyMovieData[index]['backdrop_path'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular On Netflix',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: moviePosters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  moviePosters[index],
                                  height: 150.0,
                                  width: 100.0,
                                ),
                              )
                              //SizedBox(width: 20,)
                              ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    })),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular On Netflix',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: moviePosters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  moviePosters[index],
                                  height: 150.0,
                                  width: 100.0,
                                ),
                              )
                              //SizedBox(width: 20,)
                              ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      );
                    })),
            SizedBox(
              height: 10,
            ),
            Container(

                //margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: moviePosters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  moviePosters[index],
                                  height: 150.0,
                                  width: 100.0,
                                ),
                              )
                              //SizedBox(width: 20,)
                              ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
