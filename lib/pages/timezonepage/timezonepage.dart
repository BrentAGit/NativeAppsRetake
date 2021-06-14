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
        title: ElevatedButton(
          child: Icon(Icons.search),
          onPressed: () async {
            await showDialogInfo(context);
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent)),
        )
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
                        child: Image.asset('assets/images/FlagUS.jpg',
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

