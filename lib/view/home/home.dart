import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/model/movies.dart';
import 'package:hotstar/view/home/widgets/listselection.dart';
import 'package:hotstar/view/home/widgets/topcontainer.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final TMDBService _tmdbService=TMDBService();
  late Future<List<Movie>>_latestrelease;
  late Future<List<Movie>>_bestinSports;
  late Future<List<Movie>>_topten;
  late Future<List<Movie>>_entertainment;

  @override
  void initState() {
    _latestrelease=fetchMovies();
    _bestinSports=fetchUpcomingMovies();
    _topten=fetchTopRated();
    _entertainment=fetchNowPlayings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopContainer(moviesfuture: _latestrelease,),
           
              ListSection(
                title: "Latest release",
                itemHeight: 150,
                itemWidth: 120,
                itemCount: 10,
                 moviesfuture:_bestinSports ,
               
              ),
              ListSection(
                title: "Best in Sports",
                itemHeight: 100,
                itemWidth: 160,
                itemCount: 10, 
                moviesfuture:_topten ,
                
              ),
              ListSection(title: "Top 10 in india Today", 
              itemHeight: 140,
               itemWidth: 120, 
               itemCount: 10,
                numbers: true,
                 moviesfuture:_entertainment ,
                ),
                ListSection(title: "Entertainment All-Rounders",
                 itemHeight: 140,
                  itemWidth: 120,
                   itemCount: 10,
                    moviesfuture:_bestinSports ,)
             
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Movie>> fetchMovies() async {
    final results = await _tmdbService.fetcPopularMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    final results = await _tmdbService.fetchUpcomingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> fetchTopRated() async {
    final results = await _tmdbService.fetchTopRated();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> fetchNowPlayings() async {
    final results = await _tmdbService.fetchNowPlayingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }
}
 
 

