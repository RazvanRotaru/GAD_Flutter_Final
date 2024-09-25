import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:movie_db/epics/reception_epic.dart';
import 'package:movie_db/presentation/add_entry_page.dart';
import 'package:movie_db/presentation/home_page.dart';
import 'package:movie_db/presentation/inventory_details_page.dart';
import 'package:movie_db/presentation/inventory_page.dart';
import 'package:movie_db/presentation/product_details_page.dart';
import 'package:movie_db/presentation/reception_details_page.dart';
import 'package:movie_db/strings.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'actions/index.dart';
import 'data/product_api.dart';
import 'data/reception_api.dart';
import 'epics/product_epic.dart';
import 'models/index.dart';
import 'presentation/new_reception_page.dart';
import 'reducer/reducer.dart';

Future<void> main() async {
  const String uri = 'data/dummy_data.xlsx';
  const String deploymentId = 'AKfycbzYTo5Z99CnWgvwxi_OyC4Uq6-hWlBetaHJuUhEKc16X97AJATt9-Ty_jOPKURLo2TF';
  const String dbSheetID = '1y3A4fjTF4U7m-KboDTxdF8JqCyCpSvGNYnauCs8a2cc';
  final ProductEpics productEpics = ProductEpics(api: ProductApi(uri: uri, deploymentId: deploymentId, sheetId: dbSheetID));
  final ReceptionEpics receptionEpics = ReceptionEpics(api: ReceptionApi());
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(productEpics.epics),
      EpicMiddleware<AppState>(receptionEpics.epics),
      const NavigationMiddleware<AppState>(),
    ],
  );

  store.dispatch(const GetProductsAction());
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        navigatorKey: NavigatorHolder.navigatorKey,
        home: const HomePage(),
        theme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          Routes.newReception: (BuildContext context) {
            return const NewReceptionPage();
          },
          Routes.addEntry: (BuildContext context) {
            return const AddEntryPage();
          },
          Routes.receptionDetails: (BuildContext context) {
            return const ReceptionDetailsPage();
          },
          Routes.inventoryDetails: (BuildContext context) {
            return const InventoryDetailsPage();
          },
          Routes.productDetails: (BuildContext context) {
            return const ProductDetailsPage();
          },
          Routes.newInventory: (BuildContext context) {
            return const InventoryPage();
          }
        },
      ),
    );
  }
}
