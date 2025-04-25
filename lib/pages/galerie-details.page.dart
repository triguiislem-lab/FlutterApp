import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GalerieDetailsPage extends StatefulWidget {
  final String keyword;

  const GalerieDetailsPage({Key? key, required this.keyword}) : super(key: key);

  @override
  _GalerieDetailsPageState createState() => _GalerieDetailsPageState();
}

class _GalerieDetailsPageState extends State<GalerieDetailsPage> {
  int currentPage =1;
  int size =10;
  int totalPages=0;
  ScrollController _scrollController= new ScrollController();
  List<dynamic> hits = [];
  Map<String, dynamic>? galleryData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    _scrollController.addListener(() {
  if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    if (currentPage < totalPages) {
      currentPage++;
      getGalleryData(widget.keyword);
    }
  }
});

  }

  Future<void> getGalleryData(String keyword) async {
    String url = "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=$keyword&page=$currentPage&per_page=$size";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        galleryData = json.decode(response.body);

        hits.addAll(galleryData!['hits']);
        totalPages=(galleryData!['totalHits']/size).ceil();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception("Erreur lors du chargement des données");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:totalPages==null?Text('chargement'):totalPages==0?Text('pas de resultat'):Text(" ${widget.keyword}, Page ${currentPage}/$totalPages"),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hits.isEmpty
              ? Center(child: Text("Aucune image trouvée"))
              : ListView.builder(
                  itemCount: (galleryData==null?0:hits.length),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    var image = hits[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Image.network(image['webformatURL']),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              image['tags'] ?? '',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
  @override
  void dispose(){
  super.dispose();
  _scrollController.dispose();
}
}
