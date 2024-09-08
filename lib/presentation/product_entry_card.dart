import 'package:flutter/material.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/product_widget.dart';


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
            const VerticalDivider(thickness: 2.0,),
            Text(
              entry.quantity.toString(),
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
