import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";

class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key}); // Ajout du constructeur const + super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Meteo".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome to Meteo Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
