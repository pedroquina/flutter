import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/product.dart';
import '../models/product_list.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
                },
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Produto'),
                      content: Text('Tem certeza ?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<ProductList>(context, listen: false)
                                .removeProduct(product);
                            Navigator.of(context).pop();
                          },
                          child: Text('Sim'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error)
          ],
        ),
      ),
    );
  }
}
