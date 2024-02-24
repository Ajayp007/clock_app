import 'dart:math';
import 'package:flutter/material.dart';

class ClockApp2 extends StatefulWidget {
  const ClockApp2({super.key});

  @override
  State<ClockApp2> createState() => _ClockApp2State();
}

class _ClockApp2State extends State<ClockApp2> {
  int? hour, minuite, second;
  int? year, month, day;

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "My Clock",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Visibility(
            visible: true,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: (pi * 2) * second! / 60,
                  child: Container(
                    height: 250,
                    width: MediaQuery.sizeOf(context).width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.orange.withOpacity(0.5)
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft)),
                  ),
                ),
                Transform.rotate(
                  angle: (pi * 2) * minuite! / 60,
                  child: Container(
                    height: 250,
                    width: MediaQuery.sizeOf(context).width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.2)
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft)),
                  ),
                ),
                Transform.rotate(
                  angle: (pi * 2) * hour! / 12,
                  child: Container(
                    height: 250,
                    width: MediaQuery.sizeOf(context).width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [
                              Colors.green.withOpacity(0.7),
                              Colors.green.withOpacity(0.2)
                            ],
                            end: Alignment.centerRight,
                            begin: Alignment.centerLeft)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$hour : $minuite : $second",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "$day-$month-$year",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void timer() {
    setState(() {
      hour = DateTime.now().hour;
      minuite = DateTime.now().minute;
      second = DateTime.now().second;

      day = DateTime.now().day;
      month = DateTime.now().month;
      year = DateTime.now().year;
    });
    Future.delayed(const Duration(seconds: 1), () {
      timer();
    });
  }
}
