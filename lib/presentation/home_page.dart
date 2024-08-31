import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

import '../strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final double elementHeight = 100;

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _refresh() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    if (!store.state.isLoading) {
      store.dispatch(ReloadProductsAction());
    }
  }

  //
  // void _selectMovie(int id) {
  //   final Store<AppState> store = StoreProvider.of<AppState>(context);
  //   store.dispatch(SelectMovieAction(id: id));
  //   Navigator.pushNamed(context, '/movie_details');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(HomeTitle),
        ),
        floatingActionButton: LoadingContainer(
          builder: (BuildContext context, bool isLoading) {
            return FloatingActionButton(
              onPressed: _refresh,
              child: const Icon(Icons.refresh),
            );
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[OutlinedButton(onPressed: _createNewReception, child: const Text(CreateNewReception))],
          ),
        ));
  }

  void _createNewReception() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(const CreateReceptionAction());
    Navigator.pushNamed(context, '/new_reception');
  }
}
