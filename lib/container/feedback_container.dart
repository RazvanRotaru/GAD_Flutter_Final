import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class FeedbackContainer extends StatelessWidget {
  const FeedbackContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<String?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String?>(
      converter: (Store<AppState> store) {
        return store.state.feedbackMessage;
      },
      builder: builder,
    );
  }
}
