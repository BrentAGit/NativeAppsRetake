import 'package:flutter/material.dart';

import 'package:retake_flutter/pages/homepage/homepage.dart';
import 'package:retake_flutter/pages/timezonepage/timezonepage.dart';
import 'package:retake_flutter/pages/favoritespage//favoritespage.dart';
import 'package:retake_flutter/pages/timezonedetailpage/timezonedetailpage.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  Widget build(BuildContext buildContext) => MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              bottomNavigationBar: Material(
                color: Colors.blue,
                child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.home_outlined)),
                      Tab(icon: Icon(Icons.access_time_rounded)),
                      Tab(icon: Icon(Icons.star_outline_sharp)),
                    ]),
              ),
              body: TabBarView(children: <Widget>[
                HomePage(),
                TimeZonePage(),
                FavoritesPage(),
              ]),
            )),
      );
}
