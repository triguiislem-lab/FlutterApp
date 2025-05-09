import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaysDetailsPage extends StatefulWidget {
  final String pays; // This should be a country name like "us", "tunisia", etc.

  const PaysDetailsPage(this.pays, {super.key});

  @override
  _PaysDetailsPageState createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  var paysData;

  @override
  void initState() {
    super.initState();
    getPaysData(widget.pays);
  }

  Future<void> getPaysData(String pays) async {
    final String url = "https://restcountries.com/v2/name/$pays";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final String decodedBody = utf8.decode(response.bodyBytes);
        final List data = json.decode(decodedBody);
        if (data.isNotEmpty) {
          setState(() {
            paysData = data[0]; // we take the first match
          });
        } else {
          setState(() {
            paysData = null;
          });
        }
      } else {
        setState(() {
          paysData = null;
        });
      }
    } catch (err) {
      setState(() {
        paysData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      if (widget.pays.toLowerCase() == "israel") {
    // Display custom message and flag for Tunisia
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page pays Details: Free Palestine"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Free Palestine!!!! ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Image.network(
              'https://flagcdn.com/w320/ps.png', // Tunisia flag image
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
   return Scaffold(
  appBar: AppBar(
    title: Text("Page pays Details: ${widget.pays}"),
    backgroundColor: Colors.blue,
  ),
  body: paysData == null
      ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    paysData['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (paysData['flags'] != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        paysData['flags']['png'],
                        height: 120,
                      ),
                    ),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: const Icon(Icons.translate),
                    title: const Text('Name (Persian Translation)'),
                    subtitle: Text(paysData['translations']['fa'] ?? 'N/A'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text('Capital'),
                    subtitle: Text(paysData['capital'] ?? 'N/A'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.public),
                    title: const Text('Region'),
                    subtitle: Text(paysData['region'] ?? 'N/A'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text('Population'),
                    subtitle: Text('${paysData['population']}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.map),
                    title: const Text('Area'),
                    subtitle: Text('${paysData['area'] ?? 'N/A'} km²'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.money),
                    title: const Text('Currency'),
                    subtitle: Text(
                      paysData['currencies'] != null && paysData['currencies'].isNotEmpty
                          ? paysData['currencies'][0]['name']
                          : 'N/A',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Languages'),
                    subtitle: Text(
                      paysData['languages'] != null
                          ? paysData['languages'].map((lang) => lang['nativeName']).join(', ')
                          : 'N/A',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
);
}
}
