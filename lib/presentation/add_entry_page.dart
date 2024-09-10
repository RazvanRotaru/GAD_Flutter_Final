import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/presentation/widgets/custom_form.dart';
import 'package:movie_db/presentation/widgets/submittable_form.dart';
import 'package:redux/redux.dart';

import '../container/new_entry_container.dart';
import '../models/index.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({super.key});

  @override
  State<AddEntryPage> createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _barcodeRegistered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BarcodeKeyboardListener(
        onBarcodeScanned: (String barcode) {
          if (barcode.isEmpty) {
            return;
          }
          setState(() {
            _barcodeController.text = barcode;
          });
          _onBarcodeSubmitted(barcode);
        },
        child: PopScope(
          onPopInvokedWithResult: (bool didPop, Object? result) {
            if (didPop)
            {
              final Store<AppState> store = StoreProvider.of<AppState>(context);
              store.dispatch(const ClearCurrentEntryAction());
            }
          },
          child: NewEntryContainer(
            builder: (BuildContext context, ProductEntry? entry) {
              if (entry != null) {
                _barcodeController.text = entry.product.barcode.toString();
                _nameController.text = entry.product.name.toString();
                _priceController.text = entry.product.price.toString();
                _focusNode.requestFocus();
              }
              _barcodeRegistered = entry != null;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: SubmittableForm(
                    // TODO: title: _nameController.text.isNotEmpty ? _nameController.text : DefaultNewProductName,
                    title: 'Intrare noua',
                    submitText: 'Salveaza detalii',
                    onSubmit: _createNewEntry,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFormField(
                        title: 'Denumire',
                        hintText: 'Scrieti denumirea produsului',
                        validator: (String? s) => _validateNotEmpty(_nameController.text),
                        textController: _nameController,
                        readOnly: _barcodeRegistered,
                        textInputAction: TextInputAction.next,
                      ),
                      CustomFormField(
                        title: 'Cod de bare',
                        hintText: 'Scanati codul de bare al produsului',
                        validator: (String? s) => _validateNotEmpty(_barcodeController.text),
                        onSubmitted: _onBarcodeSubmitted,
                        textController: _barcodeController,
                        keyboardType: TextInputType.none,
                        textInputAction: TextInputAction.next,
                      ),
                      CustomFormField(
                        title: 'Cantitate',
                        hintText: 'Scrieti cantitatea produsului',
                        validator: (String? s) => _validateIsNumber(_quantityController.text),
                        textController: _quantityController,
                        keyboardType: TextInputType.none,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.next,
                      ),
                      CustomFormField(
                        title: 'Pret',
                        hintText: 'Scrieti pretul produsului',
                        validator: (String? s) => _validateIsNumber(_priceController.text),
                        textController: _priceController,
                        keyboardType: TextInputType.none,
                        // readOnly: _barcodeRegistered,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              );
            },
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
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(CreateNewEntryAction(_nameController.text, _barcodeController.text, _quantityController.text, _priceController.text));
  }

  void _onBarcodeSubmitted(String barcode) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    if (_validateIsNumber(barcode) == null) {
      store.dispatch(GetProductByBarcodeAction(num.parse(barcode)));
    } else {
      store.dispatch(const ClearCurrentEntryAction());
    }
  }
}
