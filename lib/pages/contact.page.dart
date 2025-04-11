import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";

class ContactPage extends StatelessWidget {
  const ContactPage({super.key}); // Ajout du constructeur const + super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Contact".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome to Contact Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
