// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final DatabaseReference _tempRef =
      FirebaseDatabase.instance.ref().child("Temperature/LivingRoom/value");
  double temp = 0;
  @override
  void initState() {
    super.initState();
    debugPrint("hello");
    _tempRef.once().then((event) {
      final dataSnapshot = event.snapshot;
      temp = dataSnapshot.value != null ? dataSnapshot.value as double : 0;
      debugPrint("$temp");
      setState(() {
        
      });
    });
  }

  bool isSwitched = false;
  bool isFanOn = false;
  double heating = 12;
  double fan = 15;

  @override
  Widget build(BuildContext context) {
    //return StatefulBuilder(builder: (context, setState) {

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
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      //alignment:MainAxisAlignment,
                      child: const Text(
                        "Living Room Thermostat",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 29),
                    Container(
                        margin: const EdgeInsets.only(left: 75),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "$temp",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.thermostat,
                              color: Colors.indigo,
                              size: 35,
                            ),
                          ],
                        )),
                    CircularPercentIndicator(
                      radius: 180,
                      lineWidth: 14,
                      percent: temp / 100,
                      progressColor: Colors.indigo,
                      //linearGradient: LinearGradient.lerp(LinearGradient(colors: [Colors.indigo, Colors.indigo]), LinearGradient(colors:[Colors.indigo, Colors.pink]), 1),
                      center:  Text(
                        '$temp\u00B0 C',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // SfRadialGauge(
                    //   axes: <RadialAxis>[
                    //     RadialAxis(
                    //       minimum: -60,
                    //       maximum: 120,
                    //       interval: 20,
                    //       startAngle: 115,
                    //       endAngle: 65,
                    //       ticksPosition: ElementsPosition.outside,
                    //       labelsPosition: ElementsPosition.outside,
                    //       minorTicksPerInterval: 5,
                    //       axisLineStyle: AxisLineStyle(
                    //         thicknessUnit: GaugeSizeUnit.factor,
                    //         thickness: 0.1,
                    //       ),
                    //       axisLabelStyle: GaugeTextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 16),
                    //       radiusFactor: 0.97,
                    //       majorTickStyle: MajorTickStyle(
                    //           length: 0.1,
                    //           thickness: 2,
                    //           lengthUnit: GaugeSizeUnit.factor),
                    //       minorTickStyle: MinorTickStyle(
                    //           length: 0.05,
                    //           thickness: 1.5,
                    //           lengthUnit: GaugeSizeUnit.factor),
                    //       ranges: <GaugeRange>[
                    //         GaugeRange(
                    //           startValue: -60,
                    //           endValue: 120,
                    //           startWidth: 0.1,
                    //           sizeUnit: GaugeSizeUnit.factor,
                    //           endWidth: 0.1,
                    //           gradient: SweepGradient(
                    //             stops: <double>[0.2, 0.5, 0.75],
                    //             colors: <Color>[
                    //               Colors.green,
                    //               Colors.yellow,
                    //               Colors.red
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //       pointers: <GaugePointer>[
                    //         NeedlePointer(

                    //             value: 20,
                    //             needleColor: Colors.black,
                    //             tailStyle: TailStyle(
                    //                 length: 0.18,
                    //                 width: 8,
                    //                 color: Colors.black,
                    //                 lengthUnit: GaugeSizeUnit.factor),
                    //             needleLength: 0.68,
                    //             needleStartWidth: 1,
                    //             needleEndWidth: 8,
                    //             knobStyle: KnobStyle(
                    //                 knobRadius: 0.07,
                    //                 color: Colors.white,
                    //                 borderWidth: 0.05,
                    //                 borderColor: Colors.black),
                    //             lengthUnit: GaugeSizeUnit.factor)
                    //       ],
                    //       annotations: <GaugeAnnotation>[
                    //         GaugeAnnotation(
                    //             widget: Text(
                    //               '°F',
                    //               style: TextStyle(
                    //                   fontSize: 20,
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //             positionFactor: 0.8,
                    //             angle: 90)
                    //       ],
                    //     ),
                    //     RadialAxis(
                    //       backgroundImage:
                    //           const AssetImage('images/light_frame.png'),
                    //       minimum: -50,
                    //       maximum: 50,
                    //       interval: 10,
                    //       radiusFactor: 0.5,
                    //       showAxisLine: false,
                    //       labelOffset: 5,
                    //       useRangeColorForAxis: true,
                    //       axisLabelStyle:
                    //           GaugeTextStyle(fontWeight: FontWeight.bold),
                    //       ranges: <GaugeRange>[
                    //         GaugeRange(
                    //             startValue: -50,
                    //             endValue: -20,
                    //             sizeUnit: GaugeSizeUnit.factor,
                    //             color: Colors.green,
                    //             endWidth: 0.03,
                    //             startWidth: 0.03),
                    //         GaugeRange(
                    //             startValue: -20,
                    //             endValue: 20,
                    //             sizeUnit: GaugeSizeUnit.factor,
                    //             color: Colors.yellow,
                    //             endWidth: 0.03,
                    //             startWidth: 0.03),
                    //         GaugeRange(
                    //             startValue: 20,
                    //             endValue: 50,
                    //             sizeUnit: GaugeSizeUnit.factor,
                    //             color: Colors.red,
                    //             endWidth: 0.03,
                    //             startWidth: 0.03),
                    //       ],
                    //       annotations: <GaugeAnnotation>[
                    //         GaugeAnnotation(
                    //             widget: Text(
                    //               '°C',
                    //               style: TextStyle(
                    //                   fontSize: 20,
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //             positionFactor: 0.8,
                    //             angle: 90)
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    // const Center(
                    //   child: Text(
                    //     'TEMPERATURE',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, color: Colors.black54),
                    //   ),
                    // ),
                    // const SizedBox(height: 32),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     _roundedButton(title: 'GENERAL', isActive: true),
                    //     _roundedButton(title: 'SERVICES'),
                    //   ],
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 120, left: 20),
                                child: Text(
                                  'HEATING',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Switch(
                                value: isSwitched,
                                onChanged: (bool value) =>
                                    setState(() => isSwitched = value),
                              ),
                            ],
                          ),
                          Slider(
                            value: heating,
                            onChanged: (newHeating) {
                              setState(() => heating = newHeating);
                            },
                            max: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('0\u00B0'),
                                Text('15\u00B0'),
                                Text('30\u00B0'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 70, left: 20),
                                child: Text(
                                  'LIVING ROOM FAN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Switch(
                                value: isFanOn,
                                onChanged: (bool value) =>
                                    setState(() => isFanOn = value),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'FAN SPEED',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          Slider(
                            value: fan,
                            onChanged: (newFan) {
                              setState(() => fan = newFan);
                            },
                            max: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('LOW'),
                                Text('MID'),
                                Text('HIGH'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     _fan(title: 'FAN 1', isActive: true),
                    //     _fan(title: 'FAN 2', isActive: true),
                    //     _fan(title: 'FAN 3'),
                    //   ],
                    // ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _fan({
  //   required String title,
  //   bool isActive = false,
  // }) {
  //   return Column(
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.all(18),
  //         decoration: BoxDecoration(
  //           color: isActive ? Colors.indigo : Colors.white,
  //           borderRadius: BorderRadius.circular(18),
  //         ),
  //         child: Image.asset(
  //           isActive ? 'assets/images/fan-2.png' : 'assets/images/fan-1.png',
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Text(
  //         title,
  //         style: TextStyle(
  //           color: isActive ? Colors.black87 : Colors.black54,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _roundedButton({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
