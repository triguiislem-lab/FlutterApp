import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/menu/drawer.widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> _onDeconnecter(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/inscription',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerwidget(),
      appBar: AppBar(
        title: Text(
          "Page Home".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/meteo.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/meteo');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/contact.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/contacts');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/parametres.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/parametre');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/gallerie.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/galerie');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/pays.png'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/pays');
              },
            ),
            InkWell(
              child: Ink.image(
                height: 180,
                width: 180,
                image: AssetImage('Images/deconnexion.png'),
              ),
              onTap: () async {
                 await FirebaseAuth.instance.signOut();
              // Redirection après déconnexion
              Navigator.pushReplacementNamed(context, '/authentification');
            
              },
            ),
          ],
        ),
      ),
    );
  }
}
