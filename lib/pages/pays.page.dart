import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";

class PaysPage extends StatelessWidget {
  const PaysPage({super.key}); // Ajout du constructeur const + super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Pays".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome to Pays Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
