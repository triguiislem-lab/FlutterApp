import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";

class GaleriePage extends StatelessWidget {
  const GaleriePage({super.key}); // Ajout du constructeur const + super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Galerie".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome to Galerie Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
