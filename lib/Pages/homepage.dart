import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/categories.dart';
import 'package:netflix_clone/Pages/coming_soon.dart';
import 'package:netflix_clone/Pages/downloads.dart';
import 'package:netflix_clone/Pages/home.dart';
import 'package:netflix_clone/Pages/moviespage.dart';
import 'package:netflix_clone/Pages/series.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    ComingSoon(),
    Text(
      'Index 2: School',
    ),
    Downloads()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          //leading: Icon(Icons.menu),
          backgroundColor: const Color(0x44000000),
          title: const SizedBox(
              width: 20,
              child: Image(image: AssetImage('assets/images/main_logo.png'))),
          //centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person))
          ],
        ),
        // body: const TabBarView(
        //     children: [SeriesPage(), MoviesPage(), CategoriesPage()]),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_widgetOptions.elementAt(_selectedIndex)],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          backgroundColor: Colors.grey[900],
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.grey[500]),
          //fixedColor: Colors.grey[800],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Coming Soon',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              label: 'Quick Laughs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline_outlined),
              label: 'Downloads',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.grey[500]),
          unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
          unselectedItemColor: Colors.grey[500],
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text(
            'Play Something',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.shuffle),
          backgroundColor: Colors.white.withAlpha(200),
        ),
      ),
    );
  }
}
