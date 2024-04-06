import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatefulWidget {
  final String title;

  VideoPage({super.key, required this.title});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: '0SSs52ZRZis',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
