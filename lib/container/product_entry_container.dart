import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class ProductEntryContainer extends StatelessWidget {
  const ProductEntryContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<ProductEntry>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ProductEntry>>(
      converter: (Store<AppState> store) {
        return store.state.ongoingReception?.entries.asList() ?? <ProductEntry>[];
      },
      builder: builder,
    );
  }
}
