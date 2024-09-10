import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/feedback_container.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/pending_receptions_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/strings.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final double elementHeight = 100;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _refresh() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    if (!store.state.isLoading) {
      store.dispatch(const ReloadProductsAction());
    }
  }

  void _showFeedback(String message) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(ShowFeedbackAction(context, message));
  }

  @override
  Widget build(BuildContext context) {

    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(const LoadPendingReceptionsAction());

    return Scaffold(
        appBar: AppBar(
          title: const Text(HomeTitle),
        ),
        floatingActionButton: LoadingContainer(
          builder: (BuildContext context, bool isLoading) {
            if (isLoading) {
              return const SizedBox(width: 0, height: 0,);
            }
            return FloatingActionButton(
              onPressed: _refresh,
              child: const Icon(Icons.refresh),
            );
          },
        ),
        body: PopScope(
          canPop: false,
          child: FeedbackContainer(
            builder: (BuildContext context, String? feedback) {
              if (feedback != null && feedback.isNotEmpty) {
                _showFeedback(feedback);
              }

              return Center(
                child: LoadingContainer(
                  builder: (BuildContext context, bool isLoading) {
                    if (isLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: _createNewReception,
                          child: const Text(CreateNewReception),
                        ),
                        PendingReceptionsContainer(
                          builder: (BuildContext context, List<String>? receptions) {
                            if (receptions == null || receptions.isEmpty) {
                              return const SizedBox(width: 0, height: 0,);
                            }
                            return OutlinedButton(
                              onPressed: () => _sendPendingReceptions(receptions),
                              child: Text('${receptions.length} receptii netrimise'),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ));
  }

  void _createNewReception() {
    Navigator.pushNamed(context, Routes.receptionDetails);
  }

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

  void _sendPendingReceptions(List<String> pendingReceptions) {
    _withConfirmation(() {
      final Store<AppState> store = StoreProvider.of<AppState>(context);
      store.dispatch(SendPendingAction(pendingReceptions));
    }, text: 'Trimiteti receptiile?');
  }
}
