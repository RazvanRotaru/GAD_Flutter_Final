import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class NewEntryContainer extends StatelessWidget {
  const NewEntryContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<ProductEntry?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductEntry?>(
      converter: (Store<AppState> store) {
        return store.state.newProductEntry;
      },
      builder: builder,
    );
  }
}
