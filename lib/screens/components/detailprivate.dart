// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../data/data.dart';
// import '../../widget/favoris.dart';

// class DetailPrivate extends StatelessWidget {
//   final List<DataBase> data;
//   const DetailPrivate({
//     super.key,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: [
//       if (data.isNotEmpty)
//         for (var i in data)
//           ModelDetail(
//             title: i.titre,
//             subtitle: i.soustitre,
//             description: i.description,
//           )
//       else
//         const Padding(
//           padding: const EdgeInsets.only(top: 50.0),
//           child: Center(
//               child: Text(
//             "pas de contenu ",
//             style: TextStyle(fontSize: 18),
//           )),
//         )
//     ]);
//   }
// }

// class ModelDetail extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final String description;

//   const ModelDetail({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.description,
//   });

//   @override
//   State<ModelDetail> createState() => _ModelDetailState();
// }

// class _ModelDetailState extends State<ModelDetail> {
//   bool _isfavorite = true;

//   _toggleFavorite() {
//     setState(() {
//       if (_isfavorite) {
//         _isfavorite = false;
//       } else {
//         _isfavorite = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         launch(widget.subtitle);
//         // launchUrl(Uri.http(authority) subtitle )
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             title: Padding(
//               padding: const EdgeInsets.only(bottom: 5.0),
//               child: Text(
//                 widget.title,
//                 style: const TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                     decorationThickness: 2),
//               ),
//             ),
//             subtitle: Text(
//               widget.subtitle,
//               style:
//                   const TextStyle(color: Colors.green, decorationThickness: 2),
//             ),
//             trailing: _isfavorite
//                 ? IconButton(
//                     onPressed: _toggleFavorite,
//                     icon: const Icon(
//                       Icons.lock,
//                       // color: Colors.red,
//                     ),

//                     // const Icon(Icons.favorite_border, color: Colors.red),
//                     color: Theme.of(context).primaryColor,
//                   )
//                 : null,
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 15, bottom: 8.0, right: 15),
//               child: SizedBox(
//                 // width: size.width / 1.1,
//                 height: 80,
//                 child: Flexible(child: Text(widget.description)),
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
