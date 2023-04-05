// import 'package:catalogue/widget/favoris.dart';
import 'package:flutter/material.dart';
import 'package:catalogue/data/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../main.dart';
import '../../widget/favoris.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({
    super.key,
    required this.datas,
  });
  final Box<Contact>? datas;

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  // List<DataBase> dataBases = data
  //     .map((e) => DataBase(
  //         titre: e["title"]!,
  //         soustitre: e["subtitle"]!,
  //         description: e["description"]!))
  //     .toList();

  Box<String>? favoriteBooksBox;
  @override
  void initState() {
    super.initState();
    favoriteBooksBox = Hive.box(favoritesBox);
  }

  Widget getIcon(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      favoriteBooksBox!.delete(index);
      setState(() {});
      return;
    }
    favoriteBooksBox!.put(index, widget.datas!.getAt(index).toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Contact>(catalogueBoxName).listenable(),
      builder: (context, Box<Contact> box, _) {
        if (box.values.isEmpty)
          return Center(
            child: const Text("Aucun lien n'a été trouvé"),
          );
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            Contact c = box.getAt(index)!;
            Contact b = widget.datas!.getAt(index)!;

            // box.values.where(
            //   (element) => element.title.toLowerCase().contains(c.toString()),
            // );
            // String statut = typeLiens[c.typeLiens]!;
            return InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => AlertDialog(
                      content: Text(
                        "Voulez-vous supprimer ce lien: ${b.title}?",
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text("NON"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          child: Text("OUI"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await box.deleteAt(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
                onTap: () {
                  launch(b.subtitle);
                  // launchUrl(Uri.http(authority) subtitle )
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          b.title,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decorationThickness: 2),
                        ),
                      ),
                      subtitle: Text(
                        b.subtitle,
                        style: const TextStyle(
                            color: Colors.green, decorationThickness: 2),
                      ),
                      trailing: IconButton(
                        icon: getIcon(index),
                        onPressed: () => onFavoritePress(index),
                      ),
                      // const Favorite(
                      //   color: Colors.grey,
                      // )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, bottom: 8.0, right: 15),
                        child: Container(
                          // width: size.width / 1.1,
                          // height: 80,
                          child: Flexible(child: Text(b.description)),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       const Favorite(color: Colors.grey),
                    //       const SizedBox(
                    //         width: 50,
                    //       ),
                    //       GestureDetector(
                    //         child: Prives(
                    //           color: Colors.grey,
                    //         ),
                    //         // const Icon(Icons.lock_outline_rounded

                    //         onTap: () {},
                    //       )
                    //     ],
                    //   )
                  ],
                )
                // ModelDetail(
                //   title: b.title,
                //   subtitle: b.subtitle,
                //   description: b.description,
                // )
                );
          },
        );
      },
    );
  }
}

// class ModelDetail extends StatefulWidget {
//   final Contact title;
//   // final String subtitle;
//   // final String description;

//   const ModelDetail({
//     super.key,
//     required this.title,
//     // required this.subtitle,
//     // required this.description,
//   });

//   @override
//   State<ModelDetail> createState() => _ModelDetailState();
// }

// class _ModelDetailState extends State<ModelDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ListTile(
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
//             trailing: const Favorite(
//               color: Colors.grey,
//             )),
//         Padding(
//             padding: const EdgeInsets.only(left: 15, bottom: 8.0, right: 15),
//             child: Container(
//               // width: size.width / 1.1,
//               // height: 80,
//               child: Flexible(child: Text(widget.description)),
//             )),
//         const SizedBox(
//           height: 10,
//         ),
//         //   Row(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     children: [
//         //       const Favorite(color: Colors.grey),
//         //       const SizedBox(
//         //         width: 50,
//         //       ),
//         //       GestureDetector(
//         //         child: Prives(
//         //           color: Colors.grey,
//         //         ),
//         //         // const Icon(Icons.lock_outline_rounded

//         //         onTap: () {},
//         //       )
//         //     ],
//         //   )
//       ],
//     );
//   }
// }
