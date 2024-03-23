// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:world_time_app/classes/getDete.dart';

class Lodaing extends StatefulWidget {
  const Lodaing({super.key});

  @override
  State<Lodaing> createState() => _LodaingState();
}

class _LodaingState extends State<Lodaing> {
  getData() async {
    AllCountry oneCountry = AllCountry(link:"Asia/Amman",countryName: "jordan",flag: "jordan.png");

    await oneCountry.getDataLoading();

    Navigator.pushReplacementNamed(context, "/home",
        //

         arguments: [oneCountry.timeNow,oneCountry.timezone, oneCountry.imagState]);
      //  arguments: {"time":oneCountry.timeNow,"loaction":oneCountry.timezone,"daystate":oneCountry.imagState


          
        
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            
            color:  Color.fromARGB(255, 70, 52, 52),
            size: 160,
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     getData();
          //     //Navigator.pushNamed(context, "/home");

          //   },
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.blue),
          //     padding: MaterialStateProperty.all(EdgeInsets.all(12)),
          //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8))),
          //   ),
          //   child: Text(
          //     "Go to home ",
          //     style: TextStyle(fontSize: 19),
          //   ),
          // ),
        ],
      )),
    );
  }
}
