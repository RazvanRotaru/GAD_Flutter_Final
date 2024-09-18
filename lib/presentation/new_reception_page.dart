import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/new_reception_container.dart';
import 'package:movie_db/container/product_entry_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/widgets/loading_dialog.dart';
import 'package:movie_db/presentation/widgets/product_entry_card.dart';
import 'package:movie_db/strings.dart';
import 'package:redux/redux.dart';

class NewReceptionPage extends StatefulWidget {
  const NewReceptionPage({super.key});

  @override
  State<NewReceptionPage> createState() => _NewReceptionPageState();
}

class _NewReceptionPageState extends State<NewReceptionPage> {
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

  void _selectEntry(String id) {
    _withConfirmation(
      () => _removeEntry(id),
      text: 'Stergeti intrarea?',
    );
  }

  Future<bool?> _showBackDialog() {
    return _withConfirmation(() => Navigator.pop(context),
        text: 'Vreti sa parasiti receptia?\nAtentie! Toate datele introduse se vor pierde');
  }

  void _addNewEntry() {
    Navigator.pushNamed(context, Routes.addEntry);
  }

  void _finalizeReception(Reception reception) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(FinalizeReceptionAction(reception));
  }

  void _removeEntry(String id) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(RemoveEntryAction(id));
  }

  @override
  Widget build(BuildContext context) {
    return NewReceptionContainer(
      builder: (BuildContext context, Reception? reception) {
        return Scaffold(
          body: LoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              return Scaffold(
                floatingActionButton: !isLoading && (reception?.entries.isNotEmpty ?? false)
                    ? FloatingActionButton(
                        onPressed: () => _withConfirmation(() => _finalizeReception(reception!), text: 'Vreti sa trimiteti receptia?'),
                        child: const Icon(
                          Icons.check,
                        ),
                      )
                    : null,
                body: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                      child: ProductEntryContainer(
                        builder: (BuildContext context, List<ProductEntry> entries) {
                          return PopScope(
                            canPop: false,
                            onPopInvokedWithResult: (bool didPop, Object? result) async {
                              if (didPop) {
                                return;
                              }

                              if (entries.isEmpty) {
                                Navigator.of(context).pop();
                                return;
                              }
                              final bool shouldPop = await _showBackDialog() ?? false;
                              if (context.mounted && shouldPop) {
                                Navigator.pop(context, result);
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: entries.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return GestureDetector(
                                          onLongPress: () => _selectEntry(entries[index].id),
                                          child: ProductEntryCard(entry: entries[index]),
                                        );
                                      }),
                                ),
                                MaterialButton(
                                  child: const Text('Adauga intrare'),
                                  color: Colors.green,
                                  onPressed: _addNewEntry,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (isLoading)
                      const PopScope(
                        canPop: false,
                        child: AbsorbPointer(
                          child: LoadingDialog(
                            message: 'Asteptati.\nSe trimite receptia...',
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
