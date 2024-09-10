import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class PendingReceptionsContainer extends StatelessWidget {
  const PendingReceptionsContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<String>?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<String>?>(
      converter: (Store<AppState> store) {
        return store.state.pendingReceptions;
      },
      builder: builder,
    );
  }
}
