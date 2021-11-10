// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/categories.dart';
import 'package:netflix_clone/Pages/moviespage.dart';
import 'package:netflix_clone/Pages/series.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          controller: _tabController,
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
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(child: const SeriesPage()),
              Container(child: const MoviesPage()),
              Container(child: const CategoriesPage()),
            ],
          ),
        ),
      ],
    )));
  }
}
