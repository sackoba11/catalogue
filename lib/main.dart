import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'screens/home.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleUI(
      builder: (context, theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Catalogue",
          theme: theme,
          themeMode: ThemeMode.system,
          // darkTheme: darkTheme,
          home: const Home(),
        );
      },
    );
  }
}
