import 'dart:math'; // Correct import for min function

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/model/movies.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopContainer extends StatefulWidget {
  final Future<List<Movie>> moviesfuture;
  const TopContainer({super.key, required this.moviesfuture});

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: widget.moviesfuture,
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
          final displayedMovies = min(movies.length, 10);

          return Stack(
            children: [
              Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: displayedMovies,
                    itemBuilder: (context, index, realIndex) {
                      final movie = movies[index];
                      return SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 350,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 27, 27, 27),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Watch Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 27, 27, 27),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: displayedMovies,
                    effect: const JumpingDotEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('asset/img/Disney+ Hotstar.png'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 218, 163, 15),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Color.fromARGB(255, 218, 163, 15),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
