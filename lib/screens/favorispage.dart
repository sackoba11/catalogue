import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/data.dart';
import '../main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavorisPage extends StatefulWidget {
  const FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  Box<Contact> data = Hive.box<Contact>(catalogueBoxName);

  Box<String>? favoriteBooksBox;
  @override
  void initState() {
    super.initState();
    favoriteBooksBox = Hive.box(favoritesBox);
  }

  void onFavoritePress(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      favoriteBooksBox!.delete(index);
      setState(() {});
      return;
    }
    favoriteBooksBox!.put(index, data.getAt(index).toString());
    setState(() {});
  }

  Widget getIcon(int index) {
    if (favoriteBooksBox!.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Favoris",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[100],
        ),
        body: Container(
          color: Colors.grey[300],
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Contact>(catalogueBoxName).listenable(),
            builder: (context, Box<Contact> box, _) {
              if (box.values.isEmpty) {
                return const Center(
                  child: Text("Aucun lien n'a été trouvé"),
                );
              }
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  Contact c = box.getAt(index)!;
                  String statut = statutLiens[c.statut]!;
                  return InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => AlertDialog(
                            content: Text(
                              "Voulez-vous supprimer ce lien: ${c.title}?",
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
                        launch(c.subtitle);
                        // launchUrl(Uri.http(authority) subtitle )
                      },
                      child: (favoriteBooksBox?.values.length != null)
                          ? ((favoriteBooksBox!.containsKey(index))
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          c.title,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              decorationThickness: 2),
                                        ),
                                      ),
                                      subtitle: Text(
                                        c.subtitle,
                                        style: const TextStyle(
                                            color: Colors.green,
                                            decorationThickness: 2),
                                      ),
                                      trailing: IconButton(
                                        icon: getIcon(index),
                                        onPressed: () => onFavoritePress(index),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 0.0, right: 15),
                                        child: Flexible(
                                            child: Text(c.description))),
                                    const Divider()
                                  ],
                                )
                              : Center())
                          : const Center(
                              child: Text(
                                "data",
                                style: TextStyle(color: Colors.black),
                              ),
                            ));
                },
              );
            },
          ),
        ));
  }
}

class ModelDetail extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;

  const ModelDetail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<ModelDetail> createState() => _ModelDetailState();
}

class _ModelDetailState extends State<ModelDetail> {
  bool _isfavorite = true;

  _toggleFavorite() {
    setState(() {
      if (_isfavorite) {
        _isfavorite = false;
      } else {
        _isfavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(widget.subtitle);
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
                  widget.title,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 2),
                ),
              ),
              subtitle: Text(
                widget.subtitle,
                style: const TextStyle(
                    color: Colors.green, decorationThickness: 2),
              ),
              trailing: _isfavorite
                  ? IconButton(
                      onPressed: _toggleFavorite,
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  : null),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8.0, right: 15),
              child: Container(
                // width: size.width / 1.1,
                // height: 80,
                child: Flexible(child: Text(widget.description)),
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
