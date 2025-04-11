import 'package:flutter/material.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/home.page.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/galerie.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/parametre.page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => Home(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/meteo': (context) => MeteoPage(),
    '/galerie': (context) => GaleriePage(),
    '/pays':(context)=>PaysPage(),
    '/contacts':(context)=>ContactPage(),
    '/parametre':(context)=>ParametrePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home:FutureBuilder(future:SharedPreferences.getInstance(),builder:(context,snapshot){
        if(snapshot.hasData){
          bool c = snapshot.data?.getBool('connecte')??false;
          if (c)return Home();
        }
          return InscriptionPage();
        
      }) ,
      debugShowCheckedModeBanner: false,
    );
  }
}
