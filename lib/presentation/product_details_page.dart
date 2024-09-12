import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/product_entry_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

import '../container/new_entry_container.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  void _onBarcodeScanned(String barcode) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    if (_validateIsNumber(barcode) == null) {
      store.dispatch(GetProductByBarcodeAction(num.parse(barcode)));
    }
  }

  void _clearProduct() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(const ClearCurrentEntryAction());
  }

  String? _validateIsNumber(String? value) {
    if (num.tryParse(value ?? 'not a number') == null) {
      return 'Valoarea acestui camp nu este un numar';
    }

    return null;
  }

  Future<bool?> _withConfirmation(Function callback, {String? text}) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
          child: Text(
            text ?? 'Sunteti sigur?',
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            color: Colors.green,
            colorBrightness: Brightness.dark,
            child: const Text('Da'),
            onPressed: () {
              callback();
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

  Future<bool?> _showBackDialog() {
    return _withConfirmation(() => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) {
            return;
          }

          final bool shouldPop = await _showBackDialog() ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context, result);
          }
        },
        child: BarcodeKeyboardListener(
          onBarcodeScanned: _onBarcodeScanned,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: _clearProduct,
                child: const AbsorbPointer(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            'Scanati un produs pentru a afla detaliile',
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NewEntryContainer(
                builder: (BuildContext context, ProductEntry? productEntry) {
                  if (productEntry != null) {
                    return Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                productEntry.product.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('Pret ${productEntry.product.price?.toStringAsFixed(2) ?? 'N/A'} RON',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 0,
                    width: 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
