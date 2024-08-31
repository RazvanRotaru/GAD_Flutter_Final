import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/presentation/home_page.dart';
import 'package:movie_db/presentation/product_card.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'actions/index.dart';
import 'data/product_api.dart';
import 'epics/product_epic.dart';
import 'models/index.dart';
import 'presentation/new_reception_page.dart';
import 'reducer/reducer.dart';

void main() {
  const String uri = 'data/dummy_data.xlsx';
  final ProductEpics productEpics = ProductEpics(api: ProductApi(uri: uri));

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(productEpics.epics),
    ],
  );

  store.dispatch(const GetProductsAction());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: const HomePage(),
        theme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          '/new_reception': (BuildContext context) {
            return const NewReceptionPage();
          },
        },
      ),
    );
  }
}
