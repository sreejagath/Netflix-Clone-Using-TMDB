import 'dart:ui';

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
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    print(futureAlbum);
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
            ),            Row(
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
            ),            Row(
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
            ),            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
