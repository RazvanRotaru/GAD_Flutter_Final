import 'package:flutter/material.dart';
import 'package:movie_db/models/index.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Center(
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
                  product.barcode.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 8),
                ),
                const VerticalDivider(),
                Text(product.price.toString(), style: const TextStyle(fontSize: 10)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
