import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  const InputBoxWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.onSubmitted});

  final String title;
  final String hint;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: Text(
                softWrap: true,
                title,
                style: const TextStyle(fontSize: 10, color: Colors.green),
              ),
            ),
            SizedBox(width: 100, child: TextField(onChanged: onSubmitted))
          ],
        ),
      ),
    );
  }
}
