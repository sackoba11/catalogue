// import 'package:catalogue/data/data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';

class Private extends StatefulWidget {
  const Private({super.key});

  @override
  State<Private> createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Privés"),
        ),
        body: ValueListenableBuilder(
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
                    child: (statut == "Prive")
                        ? ModelDetail(
                            title: c.title,
                            subtitle: c.subtitle,
                            description: c.description,
                          )
                        : Center());
              },
            );
          },
        )

        // ListView(children: [
        //   if (data.isNotEmpty)
        //     for (var i in dataBases)
        //       ModelDetail(
        //         title: i.titre,
        //         subtitle: i.soustitre,
        //         description: i.description,
        //       )
        //   else
        //     const Padding(
        //       padding: const EdgeInsets.only(top: 50.0),
        //       child: Center(
        //           child: Text(
        //         "pas de contenu ",
        //         style: TextStyle(fontSize: 18),
        //       )),
        //     )
        // ])
        );
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
              style:
                  const TextStyle(color: Colors.green, decorationThickness: 2),
            ),
            trailing: _isfavorite
                ? IconButton(
                    onPressed: _toggleFavorite,
                    icon: const Icon(
                      Icons.lock,
                      // color: Colors.red,
                    ),

                    // const Icon(Icons.favorite_border, color: Colors.red),
                    color: Theme.of(context).primaryColor,
                  )
                : null,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 8.0, right: 15),
              child: SizedBox(
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
