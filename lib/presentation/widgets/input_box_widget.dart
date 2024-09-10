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
      this.onSubmit,
      this.focusNode,
      this.readOnly = false});

  final String title;
  final String hint;
  final bool readOnly;
  final Function(String?) validate;
  final Function(String)? onSubmit;

  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 250,
              child: Text(
                softWrap: true,
                title,
                style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w300),
              ),
            ),
            LoadingContainer(builder: (BuildContext context, bool isLoading) {
              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: 30,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: TextFormField(
                    focusNode: focusNode,
                    readOnly: readOnly,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration.collapsed(
                      // isCollapsed: true,
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      hintText: hint,
                      // errorBorder: const OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(4)),
                      //   borderSide: BorderSide(
                      //     width: 1,
                      //     color: Colors.redAccent,
                      //   ),
                      // ),
                      // errorText: null,
                    ),
                    keyboardType: keyboardType,
                    controller: controller,
                    validator: (String? s) => validate(s),
                    onFieldSubmitted: onSubmit,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
