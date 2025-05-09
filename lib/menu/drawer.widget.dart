import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 60,
                ),
              ),
            ),
            ListTile(
              title: const Text('Accueil', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Meteo', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/meteo'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Galerie', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/galerie'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Pays', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pays'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Contact', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contacts'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Parametre', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.home, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/parametre'); // Ferme le Drawer
              },
            ),
            Divider(height: 4, color: Colors.blue),
            ListTile(
              title: const Text('Deconnexion', style: TextStyle(fontSize: 22)),
              leading: const Icon(Icons.logout, color: Colors.blue),
              trailing: const Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () async {
               await FirebaseAuth.instance.signOut();
              // Redirection après déconnexion
              Navigator.pushReplacementNamed(context, '/authentification');
              }, 
            ),Divider(height: 4, color: Colors.blue),
            // Tu peux ajouter d'autres ListTile ici si besoin
          ],
        ),
      ),
    );
  }
}
