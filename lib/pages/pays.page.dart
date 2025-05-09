import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";
import "package:voyage/pages/meteo-details.page.dart";
import "package:voyage/pages/pays-details.page.dart";

class PaysPage extends StatelessWidget {
  //const MeteoPage({super.key}); // Ajout du constructeur const + super.key
  TextEditingController txt_pays = new TextEditingController();

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Pays",
                hintText: "Entrer votre Pays",
                prefixIcon: Icon(Icons.villa),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2),
                ),
              ),
              controller:txt_pays ,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
               onGetPaysDetails(context); // _ car private
              },
              child: Text(
                " Chercher",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void onGetPaysDetails (BuildContext context) {
String pays=txt_pays.text;
Navigator.push(
context,
MaterialPageRoute (
builder: (context) => PaysDetailsPage(pays)));
txt_pays.text = "";}
}
