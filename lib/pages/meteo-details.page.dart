import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  final String ville;

  const MeteoDetailsPage(this.ville, {super.key});

  @override
  _MeteoDetailsPageState createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  Future<void> getMeteoData(String ville) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$ville&appid=c109c07bc4df77a88c923e6407aef864";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          meteoData = json.decode(response.body);
        });
      } else {
        setState(() {
          meteoData = null;
        });
      }
    } catch (err) {
      setState(() {
        meteoData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Meteo Details  ${widget.ville}"),
        backgroundColor: Colors.blue,
      ),
      body: meteoData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: meteoData['list'].length,
              itemBuilder: (context, index) {
                final data = meteoData['list'][index];
                final weatherMain = data['weather'][0]['main'].toString().toLowerCase();
                final description = data['weather'][0]['description'];
                final temp = (data['main']['temp'] - 273.15).round(); // Convert to °C
                final timestamp = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
                final dateStr = DateFormat('E-dd/MM/yyyy').format(timestamp);
                final timeStr = DateFormat('HH:mm').format(timestamp);

                return Card(
                  color: Colors.blue[300],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("images/$weatherMain.png"),
                    ),
                    title: Text("$dateStr\n$timeStr | $description"),
                    trailing: Text(
                      "$temp °C",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
