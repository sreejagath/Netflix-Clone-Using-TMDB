import 'package:flutter/material.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';
import 'package:readmore/readmore.dart';

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
          child: FutureBuilder(
            future: getMovieDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //convert the data to a list
                movieData = [snapshot.data];
                return Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          //'https://assets.gadgets360cdn.com/pricee/assets/product/202104/The-Misfits-250x358_1619719871.jpg'
                          imageUrl + movieData![0]['backdrop_path'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Container(
                    //   //margin: EdgeInsets.symmetric(vertical: 20.0),
                    //   height: 200,

                    // ),
                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          //margin: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            movieData![0]['title'] ?? '--No Title Availiable--',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          //margin: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            movieData![0]['release_date'].length > 4
                                ? movieData![0]['release_date'].substring(0, 4)
                                : movieData![0]['release_date'],
                            style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey[100]),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          child: ReadMoreText(
                            movieData![0]['overview'],
                            trimLength: 200,
                            colorClickableText: Colors.white,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read More',
                            trimExpandedText: 'Read Less',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ]))
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ])),
    );
  }
}
