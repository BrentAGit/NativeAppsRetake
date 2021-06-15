import 'package:flutter/material.dart';

import 'package:retake_flutter/bibliotheek/library.dart';
import 'package:retake_flutter/pages/timezonedetailpage/timezonedetailpage.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Favorites"),
        ),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        var currentItem = favoriteList[index];
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/images/FlagUS.jpg',
              width: 50,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(currentItem.countryName),
          subtitle: Text(
            currentItem.zoneName,
            style: TextStyle(fontSize: 12),
          ),
          trailing: ElevatedButton(
              child: Icon(Icons.access_time),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () =>
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TimeZoneDetailPage(currentItem)))
              }),
        );
      },
    );
  }
}
