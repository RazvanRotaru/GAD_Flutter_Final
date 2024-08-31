import 'package:flutter/material.dart';
import 'package:movie_db/models/index.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            product.name,
            style: const TextStyle(fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                product.barCode,
                style: const TextStyle(color: Colors.grey),
              ),
              const VerticalDivider(),
              Text(product.price.toString()),
            ],
          )
        ],
      ),
    );
  }
}
