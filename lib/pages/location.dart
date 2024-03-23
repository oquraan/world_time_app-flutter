// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getDete.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

List<AllCountry> allCountries = [
  AllCountry(
      link: 'Asia/Amman',
      countryName: 'Jordan - Amman',
      flag: 'jordan.png'),
  AllCountry(
      link: 'Africa/Tunis',
      countryName: 'Tunisia - Tunis',
      flag: 'tunisia.png'),
  AllCountry(
      link: 'Africa/Algiers',
      countryName: 'Algeria - Algiers',
      flag: 'algeria.png'),
  AllCountry(
      link: 'Australia/Sydney',
      countryName: 'Australia - Sydney',
      flag: 'australia.png'),
  AllCountry(
      link: 'America/Toronto',
      countryName: 'Canada - Toronto',
      flag: 'canada.png'),
  AllCountry(
      link: 'Asia/Riyadh',
      countryName: '	Saudi Arabia - Riyadh',
      flag: 'sa.png'),
];

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    //    automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose Location ",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: allCountries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      AllCountry c1 = AllCountry(
                          countryName: allCountries[index].countryName,
                          flag: allCountries[index].flag,
                          link: allCountries[index].link);
                      await c1.getDataLoading();
                      Navigator.pop(
                          context, [c1.timeNow,c1.timezone, c1.imagState]);
                    },
                    //  {"time":"10:00","location":"ebsar","daystate":"assets/night.png"}
                    title: Text(allCountries[index].countryName),
                    leading: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(allCountries[index].flag),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
