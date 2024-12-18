import 'package:flutter/material.dart';
import 'package:hotstar/model/movies.dart';

class Freenewly extends StatefulWidget {
  final Future<List<Movie>> moviesfuture;
  const Freenewly({super.key, required this.moviesfuture});

  @override
  State<Freenewly> createState() => _FreenewlyState();
}

class _FreenewlyState extends State<Freenewly> {
  bool _isExpanded = false;

  final String fullDescription =
      "A special investigator discovers a case of serial killings, that is not what it seems to be and leading down this path is only going to end in a war between everyone involved.";

  List<String> descriptionLines = [];

  @override
  void initState() {
    super.initState();
    descriptionLines.add("${fullDescription.split(',')[0]}");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: widget.moviesfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "No movies available",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          final movies = snapshot.data!;
          return SafeArea(
            child: ListView.builder(
              itemCount: movies.length,
              shrinkWrap: true, // Prevent unnecessary scroll conflicts
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                color: Colors.black,
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image section
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movies[index].posterPath}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200, // Limit image height
                    ),

                    // Category
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Blockbuster",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    // Info Row
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Wrap(
                        spacing: 5, // Add spacing between elements
                        children: [
                          Text("2022",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 15)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Colors.white60),
                          Text("2h 51m",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 15)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Colors.white60),
                          Text("5 Languages",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 15)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Colors.white60),
                          Text("Action",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 15)),
                          CircleAvatar(
                              radius: 2, backgroundColor: Colors.white60),
                          Text("Thriller",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 15)),
                        ],
                      ),
                    ),

                    // Description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                            descriptionLines = _isExpanded
                                ? fullDescription.split(',')
                                : ["${fullDescription.split(',')[0]}"];
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              descriptionLines.join(','),
                              style:
                                  const TextStyle(color: Colors.white60),
                              maxLines: _isExpanded ? null : 2, // Limit lines
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _isExpanded ? "See Less" : "See More",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Buttons Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow,
                                  color: Colors.black),
                              label: const Text("Watch Free",
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 67, 61, 61),
                              minimumSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
