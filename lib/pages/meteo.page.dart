import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";
import "package:voyage/pages/meteo-details.page.dart";

class MeteoPage extends StatelessWidget {
  //const MeteoPage({super.key}); // Ajout du constructeur const + super.key
  TextEditingController txt_ville = new TextEditingController();

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "ville",
                hintText: "Entrer votre ville",
                prefixIcon: Icon(Icons.villa),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2),
                ),
              ),
              controller:txt_ville ,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
               onGetMeteoDetails(context); // _ car private
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
  void onGetMeteoDetails (BuildContext context) {
String ville=txt_ville.text;
Navigator.push(
context,
MaterialPageRoute (
builder: (context) => MeteoDetailsPage(ville)));
txt_ville.text = "";}
}
