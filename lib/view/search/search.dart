import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/model/movies.dart';
import 'package:hotstar/view/search/horizondal.dart';
import 'package:hotstar/view/search/widgets/grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MySearchState();
}

class _MySearchState extends State<Search> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _carouselMovies;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _debouncer;
  bool searchVisibility = false;

  @override
  void initState() {
    _carouselMovies = fetchMovies();
    super.initState();
  }

  @override
  void dispose() {
    _debouncer?.cancel(); // Clean up the timer to avoid memory leaks
    _searchController.dispose(); // Clean up the text controller
    super.dispose();
  }

  Future<List<Movie>> fetchMovies() async {
    final results = await _tmdbService.fetcPopularMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  List<Movie> _filteredMovies(List<Movie> movies) {
    return movies.where((movie) {
      final title = movie.title.toLowerCase();
      final searchQuery = _searchQuery.toLowerCase();
      return title.contains(searchQuery);
    }).toList();
  }

  void _onSearchChange(String query) {
    if (_debouncer?.isActive ?? false) _debouncer!.cancel();
    _debouncer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Movie>>(
        future: _carouselMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else {
            final movies = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: _searchController,
                        onTap: () {
                          setState(() {
                            searchVisibility = true;
                          });
                        },
                        onChanged: _onSearchChange,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Movies, shows and more',
                          prefixIcon: const Icon(Icons.search, size: 25),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchVisibility = false;
                                _searchController.clear();
                                _searchQuery = '';
                                FocusScope.of(context).unfocus();
                              });
                            },
                            icon: const Icon(Icons.close, size: 25),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: HorizontalViewItems(),
                  ),
                  GridViews(movies: _filteredMovies(movies)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
