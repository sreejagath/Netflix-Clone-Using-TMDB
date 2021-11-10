import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const ListTile(
        title: Text('Smart Downloads', style: TextStyle(color: Colors.grey)),
        //subtitle: Text('Downloads'),
        trailing: Icon(Icons.edit, color: Colors.grey),
        leading: Icon(Icons.settings, color: Colors.grey),
      ),
      const Divider(
        color: Colors.grey,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Introducing Downloads for You',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "We'll download a personalised selection of films and programmes for you, so there's always something to watch on your mobile",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        children: [
          Positioned(
            top: 0,
            left: -200,
            right: 0,
            child: Transform.rotate(
              angle: -0.2,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Transform.rotate(
          //   angle: -0.5,
          //   child: Container(
          //     height: 200,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         image: DecorationImage(
          //           image: NetworkImage(
          //               'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg'),
          //         )),
          //   ),
          // ),
          Positioned(
            top: 0,
            left: 200,
            right: 0,
            child: Transform.rotate(
              angle: 0.2,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg'),
                )),
          ),
          
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'SET UP',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    ]));
  }
}
