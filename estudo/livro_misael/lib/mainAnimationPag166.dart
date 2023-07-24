import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          MyHomePage(title: 'Navegação de páginas', animation: this.animation),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.animation})
      : super(key: key);

  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: ProdutBox(
                    name: "produto1",
                    description: "produto 1",
                    price: 1000,
                    image: "produto1.png"),
                opacity: animation),
            MyAnimateWidget(
                child: ProdutBox(
                  name: "produto2",
                  description: "produto 2",
                  price: 2000,
                  image: "produto2.png",
                ),
                animation: animation),
            ProdutBox(
              name: "produto3",
              description: "produto 3",
              price: 3000,
              image: "produto3.png",
            ),
            ProdutBox(
              name: "produto4",
              description: "produto 4",
              price: 4000,
              image: "produto4.png",
            ),
          ]),
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
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/' + this.image),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price :" + this.price.toString()),
                        ]),
                  ),
                )
              ]),
        ));
  }
}

class MyAnimateWidget extends StatelessWidget {
  MyAnimateWidget({required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
          child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
            child: Opacity(
          opacity: animation.value,
          child: child,
        )),
        child: child,
      ));
}
