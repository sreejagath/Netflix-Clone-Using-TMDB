import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/category_details.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

List catogories = [
  'All',
  'Action',
  'Comedy',
  'Drama',
  'Horror',
  'Romance',
  'Thriller',
  'Sci-Fi',
  'Mystery',
  'Fantasy',
  'Crime',
  'Adventure',
];

List catogoriesWithIds = [
  {'id': 'all', 'name': 'All'},
  {'id': 28, 'name': 'Action'},
  {'id': 35, 'name': 'Comedy'},
  {'id': 18, 'name': 'Drama'},
  {'id': 27, 'name': 'Horror'},
  {'id': 10749, 'name': 'Romance'},
  {'id': 53, 'name': 'Thriller'},
  {'id': 878, 'name': 'Sci-Fi'},
  {'id': 9648, 'name': 'Mystery'},
  {'id': 14, 'name': 'Fantasy'},
  {'id': 80, 'name': 'Crime'},
  {'id': 12, 'name': 'Adventure'},
];

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
    children: <Widget>[
      ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: catogories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              catogoriesWithIds[index]['name'],
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CategoryDetails(categoryId: catogoriesWithIds[index]['id'], categoryName: catogoriesWithIds[index]['name']);
              }));
            },
          );
        },
      ),
    ],
      ),
    );
  }
}
