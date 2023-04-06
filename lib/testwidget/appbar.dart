// import 'package:flutter/material.dart';

// class ApBar extends StatefulWidget {
//   ApBar({Key? key, required this.recherche}) : super(key: key);
//   final recherche;
//   @override
//   State<ApBar> createState() => _ApBarState();
// }

// class _ApBarState extends State<ApBar> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController rechercheController = TextEditingController();
//     var width = MediaQuery.of(context).size.width;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // const GSectionTitle("App Bar"),
//         Padding(
//           padding:
//               EdgeInsets.only(left: width / 80, right: width / 80, bottom: 3),
//           child: AppBar(
//             elevation: 0,
//             title: const Text("Catalogue"),
//             // centerTitle: true,
//             actions: [CircleAvatar(child: Icon(Icons.person))],
//           ),
//         ),
//         Padding(
//           padding:
//               EdgeInsets.only(left: width / 80, right: width / 80, bottom: 6),
//           child: Container(
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 0,
//                     blurRadius: 1,
//                     offset: Offset(0, 3),
//                   )
//                 ],
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(30)),
//             child: TextField(
//               onChanged: widget.recherche,
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               controller: rechercheController,
//               decoration: InputDecoration(
//                   icon: Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: Icon(Icons.search, color: Colors.blue),
//                   ),
//                   border: InputBorder.none,
//                   hintText: "Recherchez vos sites",
//                   hintStyle: TextStyle(color: Colors.black),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: SizedBox(
//                       width: 80,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(3.0),
//                             child: Icon(
//                               Icons.mic_none_rounded,
//                               color: Colors.blue,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(Icons.camera_alt_outlined,
//                                 color: Colors.blue),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
