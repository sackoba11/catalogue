import 'dart:io';
import 'package:catalogue/screens/components/menubuttons.dart';
import 'package:catalogue/screens/components/detailHome.dart';
import 'package:catalogue/screens/components/drawer.dart';
import 'package:catalogue/data/data.dart';
import 'package:catalogue/screens/profilpage.dart';
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';
import 'components/facebookPage.dart';
import 'components/instagramPage.dart';
import 'components/otherPage.dart';
import 'components/tiktokPage.dart';
import 'components/twitterPage.dart';
import 'components/webPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Box<Contact>? datas;
  Box<Contact> data = Hive.box<Contact>(catalogueBoxName);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox<Contact>(catalogueBoxName);
    rechercheController = TextEditingController();
    var data = Hive.box<Contact>(catalogueBoxName);
  }

  late TextEditingController rechercheController;

  bool platform() {
    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }

  // List<DataBase> searchs = [];
  late Box<Contact> searchs;
  search(String recherhe) {
    if (recherhe.isNotEmpty) {
      searchs = data.values.where((element) =>
              element.title.toLowerCase().contains(recherhe.toLowerCase()))
          as Box<Contact>;

      // .where((element) =>
      //     element.titre.toLowerCase().contains(recherhe.toLowerCase()))
      // .toList();
    }
    setState(() {});
  }
  // search(String recherhe) {
  //   if (recherhe.isNotEmpty) {
  //     searchs = dataBases
  //         .where((element) =>
  //             element.titre.toLowerCase().contains(recherhe.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: typeLiens.values.toList().length + 1,
      child: Scaffold(
        drawer: (platform()) ? null : const DrawerPage(),
        appBar: AppBar(
            toolbarHeight: 150,
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const GSectionTitle("App Bar"),
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 80, right: width / 80, bottom: 3),
                  child: AppBar(
                    elevation: 0,
                    title: const Text("Catalogue"),
                    // centerTitle: true,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ProfilPage());
                          Navigator.of(context).push(route);
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/1.jpg",
                                  // width: 50,
                                  // height: 50,
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 80, right: width / 80, bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 1,
                            // offset: const Offset(0, 0),
                          )
                        ],
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      onChanged: search,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      controller: rechercheController,
                      decoration: InputDecoration(
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search, color: Colors.blue),
                          ),
                          border: InputBorder.none,
                          hintText:
                              "Recherchez des sites,pages réseaux sociaux...",
                          hintStyle: const TextStyle(color: Colors.black),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.mic_none_rounded,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child: Icon(Icons.camera_alt_outlined,
                                  //       color: Colors.blue),
                                  // ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
            bottom: TabBar(isScrollable: true, tabs: [
              const Tab(
                child: Text("Tout"),
              ),
              for (var element in typeLiens.values.toList())
                Tab(
                  child: Text(element),
                ),
            ])),
        body: TabBarView(
          children: <Widget>[
            // for (var i = 0; i < data.length; i++)

            DetailHome(
              datas: data,
              recherche: rechercheController.text,
            ),
            // for (var i = 0; i < categorie.length; i++)
            WebPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),
            // if(openBoxContact.values.)
            FacebookPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),
            InstagramPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),
            TiktokPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),
            TwitterPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),

            OtherPage(
              datas: (rechercheController.text.isEmpty) ? data : searchs,
            ),
          ],
        ),
        bottomNavigationBar: (platform()) ? const MenuButton() : null,
      ),
    );
  }
}
