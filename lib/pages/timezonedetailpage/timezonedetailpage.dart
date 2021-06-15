import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:audioplayers/audio_cache.dart';

import 'package:retake_flutter/bibliotheek/location.dart';
import 'package:retake_flutter/bibliotheek/library.dart';

class TimeZoneDetailPage extends StatefulWidget {
  final Location location;

  TimeZoneDetailPage(this.location);

  TimeZoneDetailPageState createState() => TimeZoneDetailPageState(location);
}

class TimeZoneDetailPageState extends State<TimeZoneDetailPage> {
  final Location location;

  TimeZoneDetailPageState(this.location);

  bool isFavoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    final double timeInTimeZone = this.location.gmtOffset / 3600;
    var time =
        DateTime.fromMillisecondsSinceEpoch(this.location.currentTime * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(time);
    isFavoriteIcon = favoriteList.contains(location);
    final AudioCache audioPlayer = AudioCache();

    void _toggleFavorite() {
      setState(() {
        if (isFavoriteIcon) {
          isFavoriteIcon = false;
          favoriteList.remove(location);
          print(favoriteList);
        } else {
          isFavoriteIcon = true;
          favoriteList.add(location);
          print(favoriteList);
        }
        audioPlayer.play('audio/favorite.mp3');
        _showMaterialDialog();
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(location.zoneName),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(children: [
        Container(
            padding: const EdgeInsets.only(top: 280),
            margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Timezone: GMT " + timeInTimeZone.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            )),
        Container(
            margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    text: "Current time: " + formattedDate,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            )),
        Container(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              child: isFavoriteIcon == false
                  ? Text("Add to favorites")
                  : Text("Remove from favorites"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: _toggleFavorite),
        )),
      ]),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              content: isFavoriteIcon == false
                  ? Text("Removed location from favorites")
                  : Text("Added location to favorites"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
