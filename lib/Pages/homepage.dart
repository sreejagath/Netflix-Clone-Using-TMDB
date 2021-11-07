import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/categories.dart';
import 'package:netflix_clone/Pages/moviespage.dart';
import 'package:netflix_clone/Pages/series.dart';
import 'package:netflix_clone/Data Fetch/fetch_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: [
                const Tab(
                  child: Text(
                    'Series',
                  ),
                ),
                const Tab(
                  text: 'Movies',
                ),
                Row(
                  children: [
                    const Tab(
                      text: 'Categories',
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(
              children: [SeriesPage(), MoviesPage(), CategoriesPage()]),
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
      ),
    );
  }
}
