import 'package:flutter/material.dart';
import 'package:movie_db/presentation/product_widget.dart';

import '../models/index.dart';

class ProductEntryCard extends StatelessWidget {
  const ProductEntryCard({super.key, required this.entry});

  final ProductEntry entry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Row(
          children: <Widget>[
            ProductWidget(product: entry.product),
            VerticalDivider(),
            Text(
              entry.quantity.toString(),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
