import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int twentyfive = 3;
  int pomorodo = 0;
  int totalSeconds = twentyfive;
  bool isRunning = false;
  late Timer timer;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    print(duration.toString().split('.').first.substring(2));
    return duration.toString().split('.').first.substring(2);
  }

  void reset() {
    setState(() {
      totalSeconds = twentyfive;
      isRunning = false;
    });
    timer.cancel();
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        pomorodo++;
        totalSeconds = twentyfive;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    isRunning = true;
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(),
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 80,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: IconButton(
                        iconSize: 120,
                        color: Theme.of(context).cardColor,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                        icon: Icon(
                          isRunning
                              ? Icons.pause_circle_filled_outlined
                              : Icons.play_circle_fill_outlined,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: IconButton(
                        iconSize: 80,
                        color: Theme.of(context).cardColor,
                        onPressed: reset,
                        icon: const Icon(
                          Icons.restart_alt,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodoros',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '$pomorodo',
                            style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
