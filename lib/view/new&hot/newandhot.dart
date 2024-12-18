import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/model/movies.dart';
import 'package:hotstar/view/new&hot/widgets/tabbar.dart';

class HotAndNew extends StatefulWidget {
  const HotAndNew({super.key});

  @override
  State<HotAndNew> createState() => _HotAndNewState();
}

class _HotAndNewState extends State<HotAndNew> {
  final TMDBService _tmdbService=TMDBService();
  late Future<List<Movie>>_bestinSports;
  @override
  void initState(){
    _bestinSports =fetchUpcomingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.black,
      body:  Expanded
      (child: HotAndNewTabBar(moviesfuture: _bestinSports,),
      ),
      
    );
  }
  
  Future<List<Movie>> fetchUpcomingMovies() async {
    final results = await _tmdbService.fetchUpcomingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }
}
