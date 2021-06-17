import 'package:flutter/material.dart';

import 'package:retake_flutter/bibliotheek/library.dart';
import 'package:retake_flutter/bibliotheek/location.dart';

import 'package:retake_flutter/pages/timezonedetailpage/timezonedetailpage.dart';

class TimeZonePage extends StatefulWidget {
  TimeZonePageState createState() => TimeZonePageState();
}

class TimeZonePageState extends State<TimeZonePage> {
  final Service service = Service();
  final formKey = GlobalKey<FormState>();
  String name = "";
  String flagURL = "";

  Future<void> showDialogInfo(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        if (!value.isEmpty) {
                          name = value;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.of(context).pop();
                      setState(() {
                        queryData.searchName = "";
                        if (name != null) {
                          queryData.searchName = name;
                        }
                        name = null;
                        print(queryData.searchName);
                      });
                    }
                  },
                  child: Text("Filter"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Filter',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                    ),
                  ),
                ),
              ),
              ListTile(
                  title:  ElevatedButton(
                    child: Text("Search by name"),
                    onPressed: () async {
                      showDialogInfo(context);
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
                  )
              ),
              ListTile(
                  title:  ElevatedButton(
                    child: Text("EU Countries Only"),
                    onPressed: () {
                      setState(() {
                        queryData.continentName = "Europe";
                        print(queryData.continentName);
                      });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
                  )
              ),
              ListTile(
                  title:  ElevatedButton(
                    child: Text("US Countries Only"),
                    onPressed: () {
                      setState(() {
                        queryData.continentName = "America";
                        print(queryData.continentName);
                      });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
                  )
              ),
              ListTile(
                  title:  ElevatedButton(
                    child: Text("Asian Countries Only"),
                    onPressed: () {
                      setState(() {
                        queryData.continentName = "Asia";
                        print(queryData.continentName);
                      });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
                  )
              ),
              ListTile(
                  title:  ElevatedButton(
                    child: Text("Reset Filters"),
                    onPressed: () {
                      setState(() {
                        queryData.continentName = "";
                      });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
                  )
              ),
            ],
          ),
        ),
      body: FutureBuilder(
        future: service.fetchAllLocations(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Location>> snapshot) {
          if (snapshot.hasData) {
            List<Location> location = snapshot.data;
            return ListView(
              children:
              location
                  .map(
                    (Location f) =>
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(f.zoneName.contains("America") ? 'assets/images/FlagUS.jpg' : 'assets/images/FlagEU.png',
                          width: 50,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(f.countryName),
                      subtitle: Text(f.zoneName,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing:  ElevatedButton(
                          child: Icon(Icons.access_time),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () =>
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => TimeZoneDetailPage(f)))
                          }),
                    ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

