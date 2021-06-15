import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  //VideoPlayerController videoController = VideoPlayerController.asset("assets/video/TimeZonesVidShort.mp4");

  Widget build(BuildContext context) {
    //videoController.initialize();
    //videoController.play();

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/FlutterBG.jpg',
                fit:BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 330),
                child: Text(
                  'Time Tracker',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 65.0, fontFamily: 'ViaodaLibre'),
                )
            ),
            Container(
              padding: const EdgeInsets.only(top:400),
              child: VideoTree()
            )
          ],
        ),
      ),
    );
  }
}

class VideoTree extends StatefulWidget{
  _AppTreeState createState() => _AppTreeState();
}

class _AppTreeState extends State<VideoTree> {
  VideoPlayerController videoController = VideoPlayerController.asset("assets/video/TimeZonesVidShort.mp4");

  void initState() {
    videoController.initialize();
    videoController.play();
    videoController.setLooping(true);
    //videoController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  Widget build(BuildContext context) {
    bool isVisible = true;

    /*return Container(
        child: VideoPlayer(videoController)
    );*/
    return ListView(
        children: <Widget>[
          /*Container(
              height: 360,
              child: AspectRatio(
                  aspectRatio: 640 / 360,
                  child: VideoPlayer(videoController)
              ),
          )*/
          Container(
            height: 360,
            child: VideoPlayer(videoController)
          )          /*AspectRatio(
              aspectRatio: 640 / 360,
              child: VideoPlayer(videoController)
          ),*/
        ]
    );
  }
}