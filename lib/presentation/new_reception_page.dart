import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/widgets/action_with_confirmation_configuration.dart';
import 'package:movie_db/presentation/widgets/generic_product_list.dart';
import 'package:redux/redux.dart';

class NewReceptionPage extends StatefulWidget {
  const NewReceptionPage({super.key});

  @override
  State<NewReceptionPage> createState() => _NewReceptionPageState();
}

class _NewReceptionPageState extends State<NewReceptionPage> {
  void _finalizeReception(Reception reception) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(FinalizeReceptionAction(reception));
  }

  @override
  Widget build(BuildContext context) {
    return GenericProductList(
      submitAction: ActionWithConfirmationConfiguration<Reception>(
        execute: _finalizeReception,
        confirmationText: 'Trimiteti receptia?',
        loadingText: 'Asteptati.\nSe trimite receptia...',
      ),
    );
  }
}
