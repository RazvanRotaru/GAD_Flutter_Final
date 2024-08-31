import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/presentation/input_box_widget.dart';
import 'package:redux/redux.dart';

import '../models/index.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({super.key});

  @override
  State<AddEntryPage> createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  late String name;
  late String barcode;
  late String quantity;
  late String price;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InputBoxWidget(
                      title: 'Denumire',
                      hint: 'Scrieti denumirea produsului',
                      onSubmitted: (String s) => setState(() => name = s),
                      validate: (String? s) => _validateNotEmpty(s),
                    ),
                    InputBoxWidget(
                      title: 'Cod de bare',
                      hint: 'Scanati codul de bare al produsului',
                      onSubmitted: (String s) => setState(() => barcode = s),
                      validate: (String? s) => _validateNotEmpty(s),
                    ),
                    InputBoxWidget(
                      title: 'Cantitate',
                      hint: 'Scrieti cantitatea produsului',
                      onSubmitted: (String s) => setState(() => quantity = s),
                      validate: (String? s) => _validateIsNumber(s),
                    ),
                    InputBoxWidget(
                      title: 'Pret',
                      hint: 'Scrieti pretul produsului',
                      onSubmitted: (String s) => setState(() => price = s),
                      validate: (String? s) => _validateIsNumber(s),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                child: Text('Salveaza detalii'),
                color: Colors.green,
                onPressed: _createNewEntry,
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return _emptyFieldErrorMessage;
    }

    return null;
  }

  String? _validateIsNumber(String? value) {
    final String? emptyValidation = _validateNotEmpty(value);
    if (emptyValidation != null)
    {
      return emptyValidation;
    }

    if (num.tryParse(value!) == null)
    {
      return "Valoarea acestui camp nu este un numar";
    }

    return null;
  }

  String get _emptyFieldErrorMessage {
    return 'Acest camp este obligatoriu';
  }

  void _createNewEntry() {
    if (_formKey.currentState!.validate()) {
      final Store<AppState> store = StoreProvider.of<AppState>(context);
      store.dispatch(CreateNewEntryAction(name, barcode, quantity, price));
      Navigator.pushNamed(context, '/new_reception');
    }
  }
}
