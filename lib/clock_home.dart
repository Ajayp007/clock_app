import 'dart:math';
import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
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
        body: Center(
          child: Stack(
            children: [
              Visibility(
                visible: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: (pi * 2) * second! / 60,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: (pi * 2) * minuite! / 60,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: (pi * 2) * hour! / 12,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$hour : $minuite : $second",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                        Text(
                          "$day/$month/$year",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                visible: true,
                child: Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: List.generate(
                        60,
                        (index) => Transform.rotate(
                          angle: (pi * 2) * index / 60,
                          child: Divider(
                            color: index % 5 == 0 ? Colors.red : Colors.black,
                            endIndent: index % 5 == 0
                                ? MediaQuery.sizeOf(context).width * 0.90
                                : MediaQuery.sizeOf(context).width * 0.95,
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Transform.rotate(
                          angle: (pi * 2 * hour!) / 12,
                          child: Divider(
                            endIndent: MediaQuery.sizeOf(context).width / 2,
                            thickness: 4,
                            color: Colors.blue,
                            indent: 100,
                          ),
                        ),
                        Transform.rotate(
                          angle: (pi * 2 * minuite!) / 60,
                          child: Divider(
                            endIndent: MediaQuery.sizeOf(context).width / 2,
                            thickness: 4,
                            color: Colors.green,
                            indent: 80,
                          ),
                        ),
                        Transform.rotate(
                          angle: (pi * 2 * second!) / 60,
                          child: Divider(
                            endIndent: MediaQuery.sizeOf(context).width / 2,
                            thickness: 4,
                            color: Colors.purple,
                            indent: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
