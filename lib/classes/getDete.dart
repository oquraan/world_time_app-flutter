import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountry {
  String flag;
  String countryName;
  String link;

  AllCountry({required this.countryName, required this.flag,required this.link});

  String timeNow = "";
  String timezone = "";
  String imagState = "";

  getDataLoading() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map receivedData = jsonDecode(response
        .body); //return Data Map  if you want know what is the key you can go to link and retreive key like you ex ["utc_datetime"]
    String datetime = receivedData["utc_datetime"];
    String offset = receivedData["utc_offset"].substring(0,
        3); // without that it will retreive +03:00 you cant convert":" to intger fot that use substring
    int intoffset = int.parse(offset);
    // print(datetime);
    // print(offset);
    // print(intoffset);
    DateTime d1 = DateTime.parse(datetime);

    DateTime realDateTime = d1.add(Duration(hours: intoffset));
    if (realDateTime.hour > 5 && realDateTime.hour < 18) {
      imagState = "assets/day.png";
    } else {
      imagState = "assets/night.png";
    }
    // print("_____________${realDateTime.hour}_________");

    timeNow = DateFormat("hh:mm a").format(realDateTime);
    timezone = receivedData["timezone"];
    // print("${realDateTime.hour}:${realDateTime.minute}");
    // print(DateFormat("hh:mm a").format(realDateTime));
    // print(timezone);
  }
}
