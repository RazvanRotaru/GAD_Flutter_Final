import 'package:flutter/material.dart';
import 'package:movie_db/presentation/product_card.dart';

import '../models/index.dart';

class ProductEntryCard extends StatelessWidget {
  const ProductEntryCard({super.key, required this.entry});

  final ProductEntry entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProductCard(product: entry.product),
        const VerticalDivider(),
        Text(
          entry.quantity.toString(),
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
