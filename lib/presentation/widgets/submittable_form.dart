import 'package:flutter/material.dart';
import 'package:movie_db/presentation/widgets/input_box_widget.dart';
import 'package:movie_db/strings.dart';

class SubmittableForm extends StatefulWidget {
  const SubmittableForm(
      {super.key,
      required this.title,
      required this.children,
      this.subtitle,
      this.width,
      this.height = 500,
      this.submitText,
      this.onSubmit,
      this.mainAxisAlignment = MainAxisAlignment.start});

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final double? width;
  final double? height;
  final String? submitText;
  final Function? onSubmit;
  final MainAxisAlignment mainAxisAlignment;

  @override
  State<SubmittableForm> createState() => _SubmittableFormState();
}

class _SubmittableFormState extends State<SubmittableForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (widget.onSubmit != null) {
        widget.onSubmit!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    if (widget.subtitle?.isNotEmpty ?? false)
                      Expanded(
                        child: Text(
                          widget.subtitle!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  flex: 5,
                  child: FocusTraversalGroup(
                    child: ListView(
                      cacheExtent: 3,
                      addAutomaticKeepAlives: true,
                      // itemExtent: 3,

                      controller: ScrollController(),
                      children: widget.children,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: MaterialButton(
                    child: Text(widget.submitText ?? DefaultSubmitText),
                    color: Colors.green,
                    onPressed: _onSubmit,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
