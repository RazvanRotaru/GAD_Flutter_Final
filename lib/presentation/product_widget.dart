import 'package:flutter/material.dart';
import 'package:movie_db/models/index.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(
                product.name,
                softWrap: true,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          product.barcode.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 2,
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          '${product.price.toString()} RON',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
