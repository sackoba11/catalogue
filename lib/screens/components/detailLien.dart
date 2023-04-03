// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../data/data.dart';
// import '../../widget/favoris.dart';

// class DetailLien extends StatelessWidget {
//   final List<DataBase> data;

//   const DetailLien({
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
//           padding: EdgeInsets.only(top: 50.0),
//           child: Center(
//               child: Text(
//             "pas de contenu ",
//             style: TextStyle(fontSize: 18),
//           )),
//         )
//     ]);
//   }
// }

// class ModelDetail extends StatelessWidget {
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
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onLongPress: () {
//         showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (_) => AlertDialog(
//             content: const Text(
//               "Voulez-vous ajouter ce lien au privés ?",
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("NON"),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               TextButton(
//                 child: const Text("OUI"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   // await box.deleteAt(index);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//       onTap: () {
//         launch(subtitle);
//         // launchUrl(Uri.http(authority) subtitle )
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//               title: Padding(
//                 padding: const EdgeInsets.only(bottom: 5.0),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       decorationThickness: 2),
//                 ),
//               ),
//               subtitle: Text(
//                 subtitle,
//                 style: const TextStyle(
//                     color: Colors.green, decorationThickness: 2),
//               ),
//               trailing: const Favorite(
//                 color: Colors.grey,
//               )),
//           Padding(
//               padding: const EdgeInsets.only(left: 15, bottom: 8.0, right: 15),
//               child: SizedBox(
//                 // width: size.width / 1.1,
//                 height: 80,
//                 child: Flexible(child: Text(description)),
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
