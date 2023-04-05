import 'package:catalogue/screens/favorispage.dart';
import 'package:catalogue/screens/lien.dart';
import 'package:catalogue/screens/private.dart';
import 'package:catalogue/screens/profilpage.dart';
import 'package:flutter/material.dart';

import '../lien1.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return Container(
      color: Theme.of(context).cardColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Column(
              children: const [
                Icon(
                  Icons.person_2_outlined,
                ),
                Text("Profil")
              ],
            ),
            onTap: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => ProfilPage());
              Navigator.of(context).push(route);
            },
          ),
          GestureDetector(
            child: Column(
              children: const [
                Icon(
                  Icons.add_link_outlined,
                  // color: Colors.red,
                ),
                Text("Ajouter lien")
              ],
            ),
            onTap: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => const Liens());
              Navigator.of(context).push(route);
            },
          ),
          GestureDetector(
            child: Column(
              children: const [
                Icon(
                  Icons.favorite_border_outlined,
                ),
                Text("Favoris")
              ],
            ),
            onTap: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => FavorisPage());
              Navigator.of(context).push(route);
            },
          ),
          GestureDetector(
            child: Column(
              children: const [
                Icon(
                  Icons.lock_outline_rounded,
                ),
                Text("Privés")
              ],
            ),
            onTap: () {
              var route = MaterialPageRoute(
                  builder: (BuildContext context) => Private());
              Navigator.of(context).push(route);
            },
          ),
        ],
      ),
    );
  }
}
