import 'package:flutter/material.dart';

class Shots extends StatefulWidget {
  const Shots({super.key});

  @override
  State<Shots> createState() => _ShotsState();
}

class _ShotsState extends State<Shots> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Settings Screen",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}