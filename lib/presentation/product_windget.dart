import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: <Widget>[
          Text(
            "TITLE_PLACEHOLDER",
            style: TextStyle(fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("1245"),
              VerticalDivider(),
              Text("55555.55"),
            ],
          )
        ],
      ),
    );
  }
}
