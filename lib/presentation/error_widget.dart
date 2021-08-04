import 'package:flutter/widgets.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
