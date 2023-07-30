import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/bagdee.dart';
import 'package:shop/components/product_grid_item.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/utils/app_routes.dart';

import '../components/product_grid.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../models/product_list.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewPage extends StatefulWidget {
  ProductOverviewPage({super.key});

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha Loja'), actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            const PopupMenuItem(
              child: Text('Somente Favoritos'),
              value: FilterOptions.Favorite,
            ),
            const PopupMenuItem(
              child: Text('Todos'),
              value: FilterOptions.All,
            ),
          ],
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Favorite) {
                _showFavoriteOnly = true;
              } else {
                _showFavoriteOnly = false;
              }
            });
          },
        ),
        Consumer<Cart>(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CART);
            },
            icon: Icon(Icons.shopping_cart),
          ),
          builder: (ctx, cart, child) => Badgee(
            value: cart.itemsCount.toString(),
            child: child!,
          ),
        ),
      ]),
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
      drawer: AppDrawer(),
    );
  }
}
