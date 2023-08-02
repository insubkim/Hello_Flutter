import 'package:flutter/material.dart';

class Player {
  String? name;

  Player({required this.name});
}

void main() {
  var nico = Player(name: 'nico');
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onPressed() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Click Count',
                style: TextStyle(color: Colors.amber, fontSize: 50),
              ),
              Text('$counter',
                  style: const TextStyle(color: Colors.pink, fontSize: 50)),
              IconButton(
                  iconSize: 100,
                  onPressed: onPressed,
                  icon: const Icon(Icons.add_box_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
