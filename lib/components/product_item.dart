import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            title: Text(product.title, textAlign: TextAlign.center),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).hintColor,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).hintColor,
            ),
            backgroundColor: Colors.black54),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productDetail,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
