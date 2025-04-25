import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:voyage/menu/drawer.widget.dart";
import "package:voyage/pages/galerie-details.page.dart";

class GaleriePage extends StatelessWidget {
  //const MeteoPage({super.key}); // Ajout du constructeur const + super.key
  TextEditingController txt_image = new TextEditingController();

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "keyword",
                hintText: "keyword",
                prefixIcon: Icon(Icons.image),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2),
                ),
              ),
              controller:txt_image ,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
               getGalleryData(context); // _ car private
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
  void getGalleryData (BuildContext context) {
String image=txt_image.text;
Navigator.push(
context,
MaterialPageRoute (
 builder: (context) => GalerieDetailsPage(keyword: image),));
txt_image.text = "";}
}
