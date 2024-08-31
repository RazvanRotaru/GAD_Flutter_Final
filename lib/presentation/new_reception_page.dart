import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/product_entry_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/presentation/product_entry_card.dart';
import 'package:redux/redux.dart';

import '../container/error_container.dart';

class NewReceptionPage extends StatefulWidget {
  const NewReceptionPage({super.key});

  @override
  State<NewReceptionPage> createState() => _NewReceptionPageState();
}

class _NewReceptionPageState extends State<NewReceptionPage> {
  void _addNewEntry() {
    Navigator.pushNamed(context, '/add_entry');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          return FloatingActionButton(
            onPressed: _addNewEntry,
            child: const Icon(Icons.add),
          );
        },
      ),
      body: ProductEntryContainer(builder: (BuildContext context, List<ProductEntry> entries) {
      return LoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          // return ;
          return ErrorContainer(
            builder: (BuildContext context, String? errMessage) {
              if (errMessage != null) {
                return ErrorWidget(errMessage);
              }

              return ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      // TODO: onTap: () => _selectEntry(index),
                      child: ProductEntryCard(entry: entries[index]),
                    );
                  });
            },
          );
        },
      );
    }));
  }
}
