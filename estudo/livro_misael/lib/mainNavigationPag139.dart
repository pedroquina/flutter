import 'package:flutter/material.dart';
import 'product.dart';
import 'ProductPage.dart';

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
      home: MyHomePage(title: 'Navegação de páginas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: ProdutBox(item: items[index]),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(item: items[index])),
                );
                setState(() {});
              });
        },
      ),
    );
  }
}

class ProdutBox extends StatelessWidget {
  ProdutBox({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/' + this.item.image),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.item.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.item.description),
                          Text("Price :" + this.item.price.toString()),
                          RatingBox(this.item)
                        ]),
                  ),
                )
              ]),
        ));
  }
}

class RatingBox extends StatefulWidget {
  RatingBox(this.item);

  final Product item;

  @override
  State<StatefulWidget> createState() {
    return _RatingBoxState();
  }
}

class _RatingBoxState extends State<RatingBox> {
  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(this.widget.item.rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: _setRatingAsOne,
            icon: (this.widget.item.rating >= 1
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(Icons.star_border, size: _size)),
            color: Colors.red[500],
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: _setRatingAsTwo,
            icon: (this.widget.item.rating >= 2
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(Icons.star_border, size: _size)),
            color: Colors.red[500],
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: _setRatingAsThree,
            icon: (this.widget.item.rating >= 3
                ? Icon(
                    Icons.star,
                    size: _size,
                  )
                : Icon(Icons.star_border, size: _size)),
            color: Colors.red[500],
            iconSize: _size,
          ),
        )
      ],
    );
  }

  void _setRatingAsOne() {
    setState(() {
      this.widget.item.rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      this.widget.item.rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      this.widget.item.rating = 3;
    });
  }
}
