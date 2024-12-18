

import 'package:flutter/material.dart';

class Comingsoon extends StatefulWidget {
  const Comingsoon({super.key});

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search Screen",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}