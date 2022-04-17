import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  late Stopwatch stopwatch;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String formattedString() {
    var milis = stopwatch.elapsed.inMilliseconds;
    String milisecond = (milis % 1000).toString();
    String milisecondShow = (milis % 10).toString();
    String second = ((milis ~/ 1000) % 60).toString().padLeft(2, '0');
    String min = ((milis ~/ 1000) ~/ 60).toString().padLeft(2, '0');
    return "$min:$second:$milisecondShow";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    timer = Timer.periodic(Duration(microseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 182, 144),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 218, 209, 222),
                      width: 4,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    formattedString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 119, 114, 121),
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  stopwatch.reset();
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 83, 78, 78)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
