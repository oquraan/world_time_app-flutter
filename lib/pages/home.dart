// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imag = "";
  List recievedData = [];
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////data from loading page
    recievedData = recievedData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as List
        : recievedData;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recievedData[2]), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    if (result == null) {
                      result[0] = "";
                      result[1] = "Please choose a location ";
                      result[2] = "assets/day2.png";
                    }
                    else
                    recievedData = result;
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(0, 90, 103, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                color: Color.fromARGB(120, 0, 0, 0),
                padding: EdgeInsets.symmetric(vertical: 33),
                height: 200,
                width: double.infinity,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      recievedData[0],
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      recievedData[1],
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
