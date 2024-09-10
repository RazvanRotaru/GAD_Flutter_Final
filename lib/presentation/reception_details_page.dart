import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/new_reception_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/input_box_widget.dart';
import 'package:movie_db/presentation/submittable_form.dart';
import 'package:movie_db/strings.dart';
import 'package:redux/redux.dart';

class ReceptionDetailsPage extends StatefulWidget {
  const ReceptionDetailsPage({super.key});

  @override
  State<ReceptionDetailsPage> createState() => _ReceptionDetailsPageState();
}

class _ReceptionDetailsPageState extends State<ReceptionDetailsPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _invoiceController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  void _createReceptionWithDetails() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(CreateReceptionAction(
      user: _userController.text,
      company: _companyController.text,
      invoiceNr: _invoiceController.text,
    ));
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return EmptyFieldErrorMessage;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SubmittableForm(
          title: 'Receptie noua',
          subtitle: 'Completati datele receptiei',
          children: <InputBoxWidget>[
            InputBoxWidget(
              title: 'Nume partener',
              hint: 'Introdu numele partenerului',
              validate: _validateNotEmpty,
              controller: _companyController,
            ),
            InputBoxWidget(
              title: 'Nume angajat',
              hint: 'Introdu numele tau',
              validate: _validateNotEmpty,
              controller: _userController,
            ),
            InputBoxWidget(
              title: 'Numar factura',
              hint: 'Introdu numarul de factura',
              validate: _validateNotEmpty,
              controller: _invoiceController,
            ),
          ],
          submitText: 'Incepe receptia',
          onSubmit: _createReceptionWithDetails,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
