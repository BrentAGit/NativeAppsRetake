import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retake_flutter/bibliotheek/location.dart';

class Service {
  List<Location> parseLocation(String responseBody) {
    final zones = jsonDecode(responseBody);
    final parsed = zones['zones'].cast<Map<String, dynamic>>();
    return parsed.map<Location>((json) => Location.fromJson(json)).toList();
  }

  Future<List<Location>> fetchAllLocations() async {
    String url = 'http://api.timezonedb.com/v2.1/list-time-zone?key=EXKA1Y1NLDPF&format=json&country=US';
    if (queryData.searchName != null && queryData.searchName != ""){
      String extra = "&zone=*" +  queryData.searchName + "*";
      url += extra;
    }

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      try {
        return parseLocation(response.body);

      } catch (e, stacktrace) {
        print(e);
        print(stacktrace);
      }
    } else {
      throw Exception('Unable to fetch bugs from the REST API');
    }
  }
}

class QueryData {
  String searchName = "";
  final String urlDomain = 'http://api.timezonedb.com/v2.1/list-time-zone?key=EXKA1Y1NLDPF&format=json&country=US';
}
QueryData queryData = new QueryData();

var favoriteList = new List();