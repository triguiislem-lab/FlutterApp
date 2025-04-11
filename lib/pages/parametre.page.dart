import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";

class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key}); // Ajout du constructeur const + super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Parametre".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome to Parametre Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
