import 'package:flutter/material.dart';

class Prives extends StatefulWidget {
  const Prives({super.key, required this.color});
  final Color color;
  @override
  State<Prives> createState() => _PrivesState();
}

class _PrivesState extends State<Prives> {
  bool _isfavorite = false;
  int nombre = 0;

  _toggleFavorite() {
    setState(() {
      if (_isfavorite) {
        _isfavorite = false;
        nombre -= 1;
      } else {
        _isfavorite = true;
        nombre += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 40,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            IconButton(
              onPressed: _toggleFavorite,
              icon: _isfavorite
                  ? const Icon(
                      Icons.lock,
                      color: Colors.red,
                    )
                  : const Icon(Icons.lock_outline_rounded, color: Colors.red),
              color: Theme.of(context).primaryColor,
            ),
            // Text(
            //   "$nombre",
            //   style: TextStyle(
            //     color: Theme.of(context).primaryColor,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
