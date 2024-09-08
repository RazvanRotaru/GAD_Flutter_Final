import 'package:flutter/material.dart';
import 'package:movie_db/container/loading_container.dart';

class InputBoxWidget extends StatelessWidget {
  const InputBoxWidget(
      {super.key,
      required this.title,
      required this.hint,
      required this.validate,
      this.controller,
      this.keyboardType,
      this.onSubmit});

  final String title;
  final String hint;
  final Function(String?) validate;
  final Function(String)? onSubmit;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

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
                style: const TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
            LoadingContainer(builder: (BuildContext context, bool isLoading) {
              if (isLoading) {
                return const CircularProgressIndicator();
              }
              return SizedBox(
                width: 250,
                child: TextFormField(
                  keyboardType: keyboardType,
                  controller: controller,
                  validator: (String? s) => validate(s),
                  onFieldSubmitted: onSubmit,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
