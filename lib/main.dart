import 'package:flutter/material.dart';
import 'package:hotstar/view/splash.dart';

main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: const MySplashScreen(),
    );
  }
}