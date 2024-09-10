import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/widgets/custom_form.dart';
import 'package:movie_db/presentation/widgets/submittable_form.dart';
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
          children: [
            CustomFormField(
              title: 'Nume partener',
              hintText: 'Introdu numele partenerului',
              validator: (_) => _validateNotEmpty(_companyController.text),
              textController: _companyController,
              textInputAction: TextInputAction.next,
            ),
            CustomFormField(
              title: 'Nume angajat',
              hintText: 'Introdu numele tau',
              validator: (_) => _validateNotEmpty(_userController.text),
              textController: _userController,
              textInputAction: TextInputAction.next,
            ),
            CustomFormField(
              title: 'Numar factura',
              hintText: 'Introdu numarul de factura',
              validator: (_) => _validateNotEmpty(_invoiceController.text),
              textController: _invoiceController,
              textInputAction: TextInputAction.done,
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
