import 'package:flutter/material.dart';
import 'package:netflix_clone/Data%20Fetch/fetch_movie.dart';
import 'package:netflix_clone/Data Fetch/default_datas.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  Future? fetchTrendingMovies;
  @override
  void initState() {
    super.initState();
    fetchTrendingMovies = fetchTrendingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
      ),
      FutureBuilder(
          future: fetchTrendingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List movie = snapshot.data as List;
              print(movie);
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        movie[index]['backdrop_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${movie[index]['backdrop_path']}'
                            : 'https://www.freeiconspng.com/uploads/no-image-icon-6.png',
                        width: 100,
                        height: 150,
                      ),
                      title: Text(
                        movie[index]['title'],
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      subtitle: Text(
                        movie[index]['overview'].length>30?movie[index]['overview'].substring(0,30)+'...':movie[index]['overview'],
                        style: TextStyle(fontSize: 15,color: Colors.white),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          })
    ]));
  }
}
