import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/model/movies.dart';
import 'package:hotstar/view/new&hot/widgets/freeNewly.dart';
import 'package:hotstar/view/new&hot/widgets/shots.dart';

import 'comingsoon.dart';

class HotAndNewTabBar extends StatefulWidget {
  final Future<List<Movie>>moviesfuture;
  const HotAndNewTabBar({super.key, required this.moviesfuture});

  @override
  State<HotAndNewTabBar> createState() => _HotAndNewTabBarState();
}

class _HotAndNewTabBarState extends State<HotAndNewTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TMDBService _tmdbService=TMDBService();
    late Future<List<Movie>>_topten;

  @override
  void initState() {
    _topten=fetchTopRated();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          color: Colors.black, // Background color for the TabBar section
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: "Free-Newly Added"),
              Tab(text: "Coming Soon"),
              Tab(text: "Shots"),
            ],
          ),
        ),
       Expanded(
  child: TabBarView(
    controller: _tabController,
    children: [
      Freenewly(moviesfuture: _topten), // Pass _topten properly
      const Comingsoon(),
      const Shots(),
    ],
  ),
),

      ],
    );
  }
  Future<List<Movie>> fetchTopRated() async {
    final results = await _tmdbService.fetchTopRated();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }
}



