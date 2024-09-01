import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/presentation/input_box_widget.dart';
import 'package:redux/redux.dart';

import '../container/new_entry_container.dart';
import '../models/index.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({super.key});

  @override
  State<AddEntryPage> createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NewEntryContainer(
      builder: (BuildContext context, ProductEntry? entry) {
        if (entry != null) {
          _barcodeController.text = entry.product.barcode.toString();
          _nameController.text = entry.product.name.toString();
          _priceController.text = entry.product.price.toString();
        }

        return SizedBox(
          width: 100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                          validate: (String? s) => _validateNotEmpty(s),
                          controller: _nameController,
                        ),
                        InputBoxWidget(
                          title: 'Cod de bare',
                          hint: 'Scanati codul de bare al produsului',
                          validate: (String? s) => _validateNotEmpty(s),
                          onSubmit: _onBarcodeSubmitted,
                          controller: _barcodeController,
                          keyboardType: TextInputType.none,
                        ),
                        InputBoxWidget(
                          title: 'Cantitate',
                          hint: 'Scrieti cantitatea produsului',
                          validate: (String? s) => _validateIsNumber(s),
                          controller: _quantityController,
                          keyboardType: TextInputType.none,
                        ),
                        InputBoxWidget(
                          title: 'Pret',
                          hint: 'Scrieti pretul produsului',
                          validate: (String? s) => _validateIsNumber(s),
                          controller: _priceController,
                          keyboardType: TextInputType.none,
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
      },
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
    if (emptyValidation != null) {
      return emptyValidation;
    }

    if (num.tryParse(value!) == null) {
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
      store.dispatch(CreateNewEntryAction(
          _nameController.text, _barcodeController.text, _quantityController.text, _priceController.text));
      Navigator.pushNamed(context, '/new_reception');
    }
  }

  void _onBarcodeSubmitted(String barcode) {
    if (_validateIsNumber(barcode) == null) {
      final Store<AppState> store = StoreProvider.of<AppState>(context);
      store.dispatch(GetProductByBarcodeAction(num.parse(barcode)));
    }
  }
}
