import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  const InputBoxWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.onSubmitted,
      required this.validate});

  final String title;
  final String hint;
  final Function(String) onSubmitted;
  final Function(String?) validate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 250,
              child: Text(
                softWrap: true,
                title,
                style: const TextStyle(fontSize: 10, color: Colors.green),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                validator: (String? s) => validate(s),
                onChanged: onSubmitted,
              ),
            )
          ],
        ),
      ),
    );
  }
}
