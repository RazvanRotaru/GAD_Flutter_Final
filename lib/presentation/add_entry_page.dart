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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InputBoxWidget(
          title: 'Denumire',
          hint: 'Scrieti denumirea produsului',
          onSubmitted: (String s) => setState(() => name = s),
        ),
        InputBoxWidget(
          title: 'Cod de bare',
          hint: 'Scanati codul de bare al produsului',
          onSubmitted: (String s) => setState(() => barcode = s),
        ),
        InputBoxWidget(
          title: 'Cantitate',
          hint: 'Scrieti cantitatea produsului',
          onSubmitted: (String s) => setState(() => quantity = s),
        ),
        InputBoxWidget(
          title: 'Pret',
          hint: 'Scrieti pretul produsului',
          onSubmitted: (String s) => setState(() => price = s),
        ),
        MaterialButton(
          child: Text("Salveaza detalii"),
          color: Colors.green,
          onPressed: _createNewEntry,
        )
      ],
    );
  }

  void _createNewEntry() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(CreateNewEntryAction(name, barcode, quantity, price));
    Navigator.pushNamed(context, '/new_reception');
  }
}
