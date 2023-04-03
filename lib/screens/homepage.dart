// import 'package:catalogue/screens/appbar.dart';
import 'dart:io';

import 'package:catalogue/screens/components/menubuttons.dart';
import 'package:catalogue/screens/components/detailHome.dart';
import 'package:catalogue/screens/drawer.dart';
import 'package:catalogue/data/data.dart';
import 'package:catalogue/screens/profilpage.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rechercheController = TextEditingController();
  }

  List<DataBase> searchs = [];
  late TextEditingController rechercheController;

  bool platform() {
    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }

  search(String recherhe) {
    if (recherhe.isNotEmpty) {
      searchs = dataBases
          .where((element) =>
              element.titre.toLowerCase().contains(recherhe.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: categorie.length,
      child: Scaffold(
        drawer: (platform()) ? null : const DrawerPage(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 135,
                // title:  ApBar(recherche: search(recherhe),),
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
                                  image: DecorationImage(
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
                                offset: const Offset(0, 3),
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
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.camera_alt_outlined,
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                // backgroundColor: Colors.amber,
                automaticallyImplyLeading: false,
                // pinned: true,
                floating: true,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    for (var element in categorie)
                      Tab(
                        child: Text(element),
                      )
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              for (var i = 0; i < categorie.length; i++)
                DetailHome(
                  data:
                      (rechercheController.text.isEmpty) ? dataBases : searchs,
                ),
            ],
          ),
        ),
        bottomNavigationBar: (platform()) ? const MenuButton() : null,
      ),
    );
  }
}
