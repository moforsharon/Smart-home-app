// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

class LightsPage extends StatefulWidget {
  const LightsPage({Key? key}) : super(key: key);

  @override
  _LightsPageState createState() => _LightsPageState();
}

class _LightsPageState extends State<LightsPage> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  // ignore: non_constant_identifier_names
  final DBref = FirebaseDatabase.instance.ref();
  bool bedRoomLightOn = false;
  bool kitchenLightOn = false;
  bool livingRoomLightOn = false;
  bool frontyardLightOn = false;

  void LedOn() async {
    await DBref.child("Lights").child("BedRoom").update({'status': 'true'});
  }

  void LedOFF() async {
    await DBref.child("Lights").child("BedRoom").update({'status': 'true'});
  }

  void getStatus() async {
    String newValue = (await FirebaseDatabase.instance
            .ref()
            .child("Lights/BedRoom/status")
            .once())
        .toString();
    // print(isSwitched);
    // print(newValue);
    setState(() {
      if (newValue == 'TRUE') {
        bedRoomLightOn = true;
      } else {
        bedRoomLightOn = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 249, 250),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.indigo,
                      ),
                    ),
                    const RotatedBox(
                      quarterTurns: 135,
                      child: Icon(
                        Icons.bar_chart_rounded,
                        color: Colors.indigo,
                        size: 28,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 32),
                      Container(
                        child: const Text(
                          "Home Lights",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 65,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Bedroom Lights",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Color.fromARGB(255, 6, 6, 6),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Switch(
                                  value: bedRoomLightOn,
                                  activeColor:
                                      Color.fromARGB(255, 246, 207, 89),
                                  onChanged: (bool value) => setState(
                                    () {
                                      bedRoomLightOn = value;
                                      DatabaseReference _lightsRef =
                                          FirebaseDatabase.instance
                                              .ref()
                                              .child("Lights/BedRoom/status");
                                      _lightsRef.set(bedRoomLightOn);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 42,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Living Room Lights",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Switch(
                                  value: livingRoomLightOn,
                                  activeColor:
                                      Color.fromARGB(255, 246, 207, 89),
                                  onChanged: (bool value) => setState(
                                    () {
                                      livingRoomLightOn = value;
                                      DatabaseReference _lightsRef =
                                          FirebaseDatabase.instance.ref().child(
                                              "Lights/LivingRoom/status");
                                      _lightsRef.set(livingRoomLightOn);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 80,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "Kitchen Lights",
                                    style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Color.fromARGB(255, 10, 10, 10),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Switch(
                                  value: kitchenLightOn,
                                  activeColor:
                                      Color.fromARGB(255, 246, 207, 89),
                                  onChanged: (bool value) => setState(() {
                                    kitchenLightOn = value;
                                    DatabaseReference _lightsRef =
                                        FirebaseDatabase.instance
                                            .ref()
                                            .child("Lights/Kitchen/status");
                                    _lightsRef.set(kitchenLightOn);
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Card(
                        child: Container(
                          height: 70,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 58,
                                  left: 10,
                                ),
                                child: Text(
                                  "Front Yard Lights",
                                  style: TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    color: Color.fromARGB(255, 10, 10, 10),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Switch(
                                value: frontyardLightOn,
                                activeColor: Color.fromARGB(255, 246, 207, 89),
                                onChanged: (bool value) => setState(() {
                                  frontyardLightOn = value;
                                  DatabaseReference _lightsRef =
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child("Lights/FrontYard/status");
                                  _lightsRef.set(frontyardLightOn);
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
