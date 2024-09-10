import 'package:flutter/material.dart';

class ConfirmationButton extends StatefulWidget {
  const ConfirmationButton({super.key, required this.onPressed, required this.child, this.color, this.questionText});

  final Function() onPressed;
  final Widget child;
  final Color? color;
  final String? questionText;

  @override
  State<ConfirmationButton> createState() => _ConfirmationButtonState();
}

class _ConfirmationButtonState extends State<ConfirmationButton> {
  void _showConfirmation()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(widget.questionText ?? 'Sunteti sigur?'),
        actions: <Widget>[
          MaterialButton(
            color: Colors.green,
            colorBrightness: Brightness.dark,
            child: const Text('Da'),
            onPressed: () {
              widget.onPressed();
              Navigator.pop(context);
            },
          ),
          MaterialButton(
            color: Colors.red,
            colorBrightness: Brightness.dark,
            child: const Text('Nu'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _showConfirmation,
      color: widget.color,
      child: widget.child,
    );
  }
}
