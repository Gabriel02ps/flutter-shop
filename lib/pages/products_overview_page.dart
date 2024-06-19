import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/cart_badge.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text('Minha Loja', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.favorite,
                      child: Text('Somente Favoritos'),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('Todos'),
                    )
                  ],
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              }),
          Consumer<Cart>(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.cart);
                  },
                  icon: const Icon(Icons.shopping_cart)),
              builder: (ctx, cart, child) => CartBadge(
                    value: cart.itemsCount.toString(),
                    child: child!,
                  ))
        ],
      ),
      body: const ProductGrid(),
      drawer: const AppDrawer(),
    );
  }
}
