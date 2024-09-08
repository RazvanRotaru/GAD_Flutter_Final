import 'package:flutter/material.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/product_widget.dart';

class ProductEntryCard extends StatelessWidget {
  const ProductEntryCard({super.key, required this.entry});

  final ProductEntry entry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 100,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ProductWidget(product: entry.product),
                ),
                const VerticalDivider(
                  thickness: 2.0,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    entry.quantity.toString(),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
