import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActeursWidget extends StatefulWidget {
  const ActeursWidget({super.key, required this.title});

  final String title;

  @override
  State<ActeursWidget> createState() => _ActeursWidgetState();
}

class _ActeursWidgetState extends State<ActeursWidget> {
  bool _searchBoolean = false;
  List webdata = [];
  final myController = TextEditingController();

  Future<List<dynamic>> getData(String value) async {
    var url = value == ''
        ? Uri.https('api.themoviedb.org', '/3/person/popular')
        : Uri.https('api.themoviedb.org', '3/search/person', {'query': value});

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4'
    });

    Map<String, dynamic> root = jsonDecode(response.body);
    return root['results'];
  }

@override
  void initState() {
    getData('').then((value) => setState(() => webdata = value));

    myController.addListener(() {
      getData(myController.text)
          .then((value) => setState(() => webdata = value));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(""),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) =>
          ListView.builder(
              itemCount: webdata.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'FilmPage', arguments: {
                      'id': webdata[index]['id'],
                      'nom': webdata[index]['name']
                    });
                  },
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'inconnu.jpg',
                          image:
                              "https://www.themoviedb.org/t/p/w100_and_h100_bestv2${webdata[index]["profile_path"]}")),
                  title: Text(webdata[index]['name']))),
    ));
  }
}
