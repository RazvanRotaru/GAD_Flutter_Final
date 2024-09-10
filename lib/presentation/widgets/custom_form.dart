import 'package:flutter/material.dart';

class CustomFormField extends FormField<String?> {
  CustomFormField({
    super.key,
    CustomInputController? controller,
    ValueChanged<String?>? onChanged,
    String? title,
    FocusNode? focusNode,
    String? hintText,
    bool readOnly = false,
    TextInputType? keyboardType,
    TextEditingController? textController,
    TextInputAction? textInputAction,
    Function(String)? onSubmitted,
    super.validator,
    super.autovalidateMode,
  }) : super(
          initialValue: controller?.value,
          builder: (FormFieldState<String?> state) {
            void onChangedHandler(String? value) {
              state.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomField(
                    controller: controller,
                    side: state.hasError ? const BorderSide(color: Colors.red, width: 2) : BorderSide.none,
                    onChanged: onChangedHandler,
                    title: title,
                    focusNode: focusNode,
                    readOnly: readOnly,
                    hintText: hintText,
                    keyboardType: keyboardType,
                    textController: textController,
                    textInputAction: textInputAction,
                    onSubmitted: onSubmitted,
                  ),
                  if (state.hasError) ...<Widget>[
                    Text(
                      state.errorText!,
                      style: const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ],
                ],
              ),
            );
          },
        );
}

class CustomField extends StatefulWidget {
  const CustomField({
    Key? key,
    this.controller,
    this.onChanged,
    this.title,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.textController,
    this.textInputAction,
    this.onSubmitted,
    this.side = BorderSide.none,
    this.readOnly = false,
  }) : super(key: key);
  final CustomInputController? controller;
  final ValueChanged<String?>? onChanged;
  final BorderSide side;
  final String? title;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late CustomInputController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? CustomInputController();
    controller.addListener(() {
      widget.onChanged?.call(controller.value);
    });
  }

  @override
  void didUpdateWidget(covariant CustomField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      controller = widget.controller ?? CustomInputController();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 200,
      decoration: ShapeDecoration(
        // color: CardTheme.of(context).color,
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: widget.side,
        ),
      ),
      child: ValueListenableBuilder<String?>(
          valueListenable: controller,
          builder: (_, String? text, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.title != null)
                    Text(
                      softWrap: true,
                      widget.title!,
                      style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w300),
                    ),
                  const SizedBox(height: 4),
                  TextField(
                    focusNode: widget.focusNode,
                    readOnly: widget.readOnly,
                    onChanged: (String text) => controller.text = text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: widget.readOnly ? Colors.grey[700] : null,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    keyboardType: widget.keyboardType,
                    controller: widget.textController,
                    onSubmitted: widget.onSubmitted,
                    textInputAction: widget.textInputAction,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CustomInputController extends ValueNotifier<String?> {
  CustomInputController({String? initialValue}) : super(initialValue);

  set text(String newValue) {
    if (newValue == value) {
      return;
    }

    value = newValue;
    notifyListeners();
  }
}
