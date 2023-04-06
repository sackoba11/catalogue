// import 'package:catalogue/widget/favoris.dart';
import 'package:flutter/material.dart';
import 'package:catalogue/data/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../main.dart';
import '../../widget/favoris.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    super.key,
    required this.datas,
  });
  final Box<Contact>? datas;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
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
            String d = typeLiens[c.typeLiens]!;
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
                child: (d == "Liens Web")
                    ? Column(
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
                              child: Flexible(child: Text(b.description))),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Center());
          },
        );
      },
    );
  }
}
