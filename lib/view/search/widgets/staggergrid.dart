import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Staggergrid extends StatelessWidget {
  const Staggergrid({super.key});

  @override
  Widget build(BuildContext context) {
   

    return GridView.custom(
  gridDelegate: SliverQuiltedGridDelegate(
    crossAxisCount: 3,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    repeatPattern: QuiltedGridRepeatPattern.inverted,
    pattern: [
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 1),

      QuiltedGridTile(2, 2),
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 1),

    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => Container(color: Colors.amber,height: 50,width: 50,
    child: Image.network("https://instagram.fccj6-2.fna.fbcdn.net/v/t51.2885-15/464669166_17875461321187530_4016580900929622222_n.jpg?stp=dst-jpg_e15_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDI0eDEyODAuc2RyLmY3NTc2MS5kZWZhdWx0X2ltYWdlIn0&_nc_ht=instagram.fccj6-2.fna.fbcdn.net&_nc_cat=106&_nc_ohc=yyiGszvQ9-sQ7kNvgEyLJ5o&_nc_gid=481c4634faba4ffeb14b013b5f25810f&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzQ4NzQ3MjA0MTg2MTkyMDcyOQ%3D%3D.3-ccb7-5&oh=00_AYBvXWUvT_vDgtox-DhSOhexqrYkzoFTKYH2rK_l03Y57Q&oe=67606062&_nc_sid=10d13b",fit: BoxFit.cover,),),
  ),
);
  }
}
