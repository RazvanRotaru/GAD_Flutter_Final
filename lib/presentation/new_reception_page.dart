import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/new_reception_container.dart';
import 'package:movie_db/container/product_entry_container.dart';
import 'package:movie_db/debouncer.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/loading_dialog.dart';
import 'package:movie_db/presentation/product_entry_card.dart';
import 'package:movie_db/strings.dart';
import 'package:redux/redux.dart';

class NewReceptionPage extends StatefulWidget {
  const NewReceptionPage({super.key});

  @override
  State<NewReceptionPage> createState() => _NewReceptionPageState();
}

class _NewReceptionPageState extends State<NewReceptionPage> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  void _addNewEntry() {
    Navigator.pushNamed(context, Routes.addEntry);
  }

  void _onBarcodeScanned(String barcode) {
    _debouncer.run(() {
      if (barcode.isEmpty) {
        return;
      }
      final Store<AppState> store = StoreProvider.of<AppState>(context);
      print('barcode scanned: $barcode');
      store.dispatch(GetProductByBarcodeAction(num.parse(barcode)));
      Navigator.pushNamed(context, Routes.addEntry);
    });
  }

  void _finalizeReception(Reception reception) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(FinalizeReceptionAction(reception));
  }

  @override
  Widget build(BuildContext context) {
    return LoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return Scaffold(
          floatingActionButton: LoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              return FloatingActionButton(
                onPressed: _addNewEntry,
                child: const Icon(Icons.add),
              );
            },
          ),
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: NewReceptionContainer(
                  builder: (BuildContext context, Reception? reception) {
                    return ProductEntryContainer(
                      builder: (BuildContext context, List<ProductEntry> entries) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            BarcodeKeyboardListener(
                              bufferDuration: const Duration(milliseconds: 200),
                              onBarcodeScanned: _onBarcodeScanned,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: entries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      // TODO: onTap: () => _selectEntry(index),
                                      child: ProductEntryCard(entry: entries[index]),
                                    );
                                  }),
                            ),
                            if (entries.isNotEmpty)
                              MaterialButton(
                                child: const Text('Finalizeaza receptioa'),
                                color: Colors.green,
                                onPressed: () => _finalizeReception(reception!),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              if (isLoading) const LoadingDialog(),
            ],
          ),
        );
      },
    );
  }
}
