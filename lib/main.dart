import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  bool show = true;

  void toggle() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              titleLarge: TextStyle(
        color: Colors.red,
      ))),
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'count',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.black,
                ),
              ),
              show ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                iconSize: 70,
                color: Colors.purple,
                onPressed: toggle,
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    print("hi");
  }

  @override
  void dispose() {
    super.dispose();
    print("hey");
  }

  @override
  Widget build(BuildContext context) {
    print("bye");
    return Text(
      'large title',
      style: TextStyle(
        fontSize: 80,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
