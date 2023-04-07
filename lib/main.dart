import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/home.dart';
import 'theme.dart';
part 'main.g.dart';

// import 'screens/homepage.dart';

const String catalogueBoxName = "DBcatalogues";
const favoritesBox = 'favoriteLink';
const privateBox = "privateLink";

@HiveType(typeId: 2)
enum StatutLien {
  @HiveField(0)
  Public,
  @HiveField(1)
  Prive,
}

const statutLiens = <StatutLien, String>{
  StatutLien.Public: "Public",
  StatutLien.Prive: "Prive",
};

@HiveType(typeId: 1)
enum Relationship {
  @HiveField(0)
  Liens_Web,
  @HiveField(1)
  Page_Facebook,
  @HiveField(2)
  Page_Instagram,
  @HiveField(3)
  Page_Tiktok,
  @HiveField(4)
  Page_Twitter,
  @HiveField(5)
  Autres
}

const typeLiens = <Relationship, String>{
  Relationship.Liens_Web: "Liens Web",
  Relationship.Page_Facebook: "Page Facebook",
  Relationship.Page_Instagram: "Page Instagram",
  Relationship.Page_Tiktok: "Page Tiktok",
  Relationship.Page_Twitter: "Page Twitter",
  Relationship.Autres: "Autres"
};

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  Relationship typeLiens;
  @HiveField(3)
  String description;
  @HiveField(4)
  StatutLien statut;

  Contact(
      this.title, this.subtitle, this.description, this.typeLiens, this.statut);
}

Box<Contact> openBoxContact = Hive.box<Contact>(catalogueBoxName);

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(RelationshipAdapter());
  Hive.registerAdapter(StatutLienAdapter());
  await Hive.openBox<Contact>(catalogueBoxName);
  await Hive.openBox<String>(favoritesBox);
  await Hive.openBox<Contact>(privateBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleUI(
      builder: (context, theme, darkTheme) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Catalogue",
          // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          // darkTheme: darkTheme,
          // theme: theme,
          home: Home(),
        );
      },
    );
  }
}
