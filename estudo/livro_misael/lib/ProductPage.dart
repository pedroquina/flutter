import 'package:flutter/material.dart';
import 'mainNavigationPag139.dart';
import 'product.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.item.name),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, "valor retornado");
            return false;
          },
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/" + this.item.image),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(this.item.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(this.item.description),
                                  Text("Price : " + this.item.price.toString()),
                                  RatingBox(this.item),
                                ],
                              )))
                    ],
                  ))),
        ));
  }
}
