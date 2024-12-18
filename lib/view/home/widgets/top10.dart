//  import 'package:flutter/material.dart';

// // ignore: non_constant_identifier_names
// Widget Top10ListSection({
//    required String title,
//     required String buttonLabel,
//     required int itemCount,
//     required VoidCallback onPressed,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Top 10 in  india Today',style: TextStyle(
//               color: Color.fromARGB(255, 206, 196, 196),
//               fontSize: 20,
//             ),
//             ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: 40,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: itemCount,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     onPressed: onPressed,
//                     style: ButtonStyle(
//                       backgroundColor:
//                           WidgetStateProperty.all(Colors.white24),
//                     ),
//                     child: Text(
//                       buttonLabel,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         ListView.builder(
//           itemBuilder:(context,index){
//            return Container(
//                   height: itemHeight,
//                   width: itemWidth,
//                   margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                   decoration: BoxDecoration(
//                     color: Colors.yellow,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 );
//           } ,
//           itemCount: 10,
//         )
//       ],
//     );
    
//   }