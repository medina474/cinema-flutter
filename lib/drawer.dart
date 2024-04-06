import 'package:cinema_flutter/acteurs.dart';
import 'package:flutter/material.dart';
import 'package:cinema_flutter/video.dart';

class CinemaDrawer extends StatelessWidget {
  const CinemaDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
          child: Text('Mon Cinéma',
              style: TextStyle(color: Colors.white, fontSize: 28.0))),
      ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ActeursWidget(title: 'song'),
              ),
            );
          },
          leading: const Icon(Icons.thumb_up),
          title: const Text('Acteurs populaires')),
      ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VideoPage(title: 'video'),
              ),
            );
          },
          leading: Icon(Icons.thumb_up),
          title: Text('Video')),
      ListTile(
          /*
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartePage(title: 'video'),
              ),
            );
          },*/
          leading: Icon(Icons.thumb_up),
          title: Text('Carte')),
      const ListTile(leading: Icon(Icons.info), title: Text('A propos'))
    ]));
  }
}
