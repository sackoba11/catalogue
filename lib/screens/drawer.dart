import 'package:catalogue/screens/favorispage.dart';
import 'package:catalogue/screens/lien.dart';
import 'package:catalogue/screens/private.dart';
// import 'package:catalogue/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'lien1.dart';
import 'profilpage.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 40),
              child: Text(
                "catalogue",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // const GSectionTitle(
            //   "catalogue",
            // ),
            GDrawerListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: "Profil",
              // trailing: const Text("1"),
              selected: true,
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => const ProfilPage());
                Navigator.of(context).push(route);
              },
            ),

            GDrawerListTile(
              leading: const Icon(Icons.add_link_outlined),
              title: "Ajouter un lien",
              // trailing: const Text("10"),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => const Liens());
                Navigator.of(context).push(route);
              },
            ),
            GDrawerListTile(
              leading: const Icon(Icons.favorite_border),
              title: "Favoris",
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => const FavorisPage());
                Navigator.of(context).push(route);
              },
            ),
            GDrawerListTile(
              leading: const Icon(Icons.lock),
              title: "Privés",
              // trailing: const Text("10"),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => const Private());
                Navigator.of(context).push(route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
