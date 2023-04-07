import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: const Text("Mon Profil"),
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(60),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Text(
                    "Sacko Allou-Badra",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "+225 0555324247",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: const [
                          CustomListtitle(
                              title: "Sacko", icon: "assets/icons/name2.png"),
                          Divider(),
                          CustomListtitle(
                              title: "Allou-Badra",
                              icon: "assets/icons/name3.png"),
                          Divider(),
                          CustomListtitle(
                              title: "+225 0555324247",
                              icon: "assets/icons/phone1.png"),
                          Divider(),
                          CustomListtitle(
                              title: "badrasacko@gmail.com",
                              icon: "assets/icons/email1.png"),
                          Divider(),
                          CustomListtitle(
                              title: "Abidjan (Côte D'Ivoire)",
                              icon: "assets/icons/locate1.png")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        // shape: Border.all(),
                        dense: true,
                        leading: Image.asset("assets/icons/disconnect.png",
                            height: 20, width: 20),
                        title: const Text(
                          "Se deconnecter",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomListtitle extends StatelessWidget {
  final String title;
  final String icon;

  const CustomListtitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListTile(
            dense: true,
            leading: Image.asset(icon, height: 20, width: 20),
            title: Text(title),
            // trailing: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
