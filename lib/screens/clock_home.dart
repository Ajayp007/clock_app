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

  bool digital = false;
  bool analog = true;
  bool strack = false;

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
        body: Center(
          child: Stack(
            children: [
              Visibility(
                visible: digital,
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
                              begin: Alignment.centerLeft),
                        ),
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
                              begin: Alignment.centerLeft),
                        ),
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
                              begin: Alignment.centerLeft),
                        ),
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
              Visibility(
                visible: analog,
                child: Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: List.generate(
                        60,
                        (index) => Transform.rotate(
                          angle: (pi * 2) * index / 60,
                          child: Divider(
                            color: index % 5 == 0
                                ? const Color(0xff7c302c)
                                : Colors.white,
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
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: (pi * 2 * hour!) / 12,
                            child: Divider(
                              endIndent: MediaQuery.sizeOf(context).width / 2,
                              thickness: 4,
                              color: Colors.white,
                              indent: 100,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: (pi * 2 * minuite!) / 60,
                            child: Divider(
                              endIndent: MediaQuery.sizeOf(context).width / 2,
                              thickness: 4,
                              color: Colors.green,
                              indent: 80,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: (pi * 2 * second!) / 60,
                            child: Divider(
                              endIndent: MediaQuery.sizeOf(context).width / 2,
                              thickness: 4,
                              color: Colors.orange,
                              indent: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: strack,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        value: (second! * 1) / 60,
                        color: Colors.orange,
                        backgroundColor: Colors.orange.withOpacity(0.5),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 20,
                      ),
                    ),
                    SizedBox(
                      height: 260,
                      width: 260,
                      child: CircularProgressIndicator(
                        value: (minuite! * 1) / 60,
                        color: Colors.white.withOpacity(0.8),
                        backgroundColor: Colors.white.withOpacity(0.5),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 20,
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      width: 220,
                      child: CircularProgressIndicator(
                        value: (hour! * 1) / 12,
                        color: Colors.green,
                        backgroundColor: Colors.green.withOpacity(0.5),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 20,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Wednesday",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          "$day - $month - $year",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "$hour : $minuite",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    digital == true;
                    analog == false;
                    strack == false;
                    Navigator.pop(context);
                  });
                },
                child: const Text("Digital Watch"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    digital == false;
                    analog == true;
                    strack == false;
                    Navigator.pop(context);
                  });
                },
                child: const Text("Analog Watch"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    digital == false;
                    analog == false;
                    strack == true;
                    Navigator.pop(context);
                  });
                },
                child: const Text("Strap Watch"),
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
