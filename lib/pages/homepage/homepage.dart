import 'package:flutter/material.dart';

//import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
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
              //child: VideoTree()
            )
          ],
        ),
      ),
    );
  }
}

/*class VideoTree extends StatefulWidget{
  _AppTreeState createState() => _AppTreeState();
}

class _AppTreeState extends State<VideoTree> {
  VideoPlayerController videoController = VideoPlayerController.asset("assets/video/TimeZoneVid.mp4");

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  Widget build(BuildContext context) {

    return ListView(
        children: <Widget>[
          Container(
              height: 360,
              child: VideoPlayer(videoController)
          )
        ]
    );
  }
}*/