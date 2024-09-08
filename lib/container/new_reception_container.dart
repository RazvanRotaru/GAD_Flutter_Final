import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class NewReceptionContainer extends StatelessWidget {
  const NewReceptionContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<Reception?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Reception?>(
      converter: (Store<AppState> store) {
        return store.state.ongoingReception;
      },
      builder: builder,
    );
  }
}
