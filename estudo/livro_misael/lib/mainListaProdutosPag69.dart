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
      home: const MyHomePage(title: 'Layout de produtos'),
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
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(3.0, 10, 2, 10),
        children: [
          ProdutBox(
              name: 'Produto 1',
              description: "Esse é o produto 1",
              price: 11,
              image: "produto1.png"),
          ProdutBox(
              name: 'Produto 2',
              description: "Esse é o produto 1",
              price: 11,
              image: "produto2.png"),
          ProdutBox(
              name: 'Produto 3',
              description: "Esse é o produto 1",
              price: 11,
              image: "produto3.png"),
          ProdutBox(
              name: 'Produto 4',
              description: "Esse é o produto 1",
              price: 11,
              image: "produto4.png"),
        ],
      ),
    );
  }
}

class ProdutBox extends StatelessWidget {
  ProdutBox(
      {Key? key,
      this.name = "",
      this.description = "",
      this.price = 0,
      this.image = ""})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/' + image),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.description),
                        Text("Price :" + this.price.toString())
                      ]),
                ))
              ]),
        ));
  }
}
