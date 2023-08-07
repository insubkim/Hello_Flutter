import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  '25:00',
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
                child: Container(
                  decoration: const BoxDecoration(),
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_fill_outlined,
                    ),
                  ),
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
                            '0',
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
