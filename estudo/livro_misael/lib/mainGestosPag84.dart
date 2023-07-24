import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          print('clique');
          _showDialog(context);
        },
        child: Text('Hello world'),
      )),
    );
  }

  _showDialog(BuildContext context) {
    print('showDialog');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Message'),
              content: Text('Hello world'),
              actions: <Widget>[
                TextButton(
                    style: ButtonStyle(),
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
