import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:movie_db/models/index.dart';
import 'package:path_provider/path_provider.dart';

class ProductApi {
  ProductApi({required this.uri, required this.deploymentId, required this.sheetId}) : client = Client();

  final String uri;
  final String deploymentId;
  final String sheetId;
  late String apiUri = 'https://script.google.com/macros/s/$deploymentId/exec';

  final Client client;

  Future<File> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/barcode_db.csv';
    final File file = File(path);
    if (!file.existsSync()) {
      file.create(recursive: true);
    }
    return file;
  }

  Future<String> readDataFromDisk() async {
    final File file = await _localPath;
    return file.readAsString();
  }

  Future<void> writeDataOnDisk(String data) async {
    final File file = await _localPath;
    await file.writeAsString(data);
  }

  Future<List<Product>> getProducts() async {
    final String csvData = await readDataFromDisk();
    final List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(csvData);

    final List<Product> data = <Product>[];

    for (final List<dynamic> row in rowsAsListOfValues) {
      final String name = row[0].toString();
      final num? barcode = num.tryParse(row[1].toString() ?? '');
      final num? price = num.tryParse(row[2].toString() ?? '');
      if (name == null || price == null || barcode == null) {
        // log error
        continue;
      }

      data.add(Product((ProductBuilder b) => b
        ..name = name
        ..barcode = barcode
        ..price = price));
    }

    return data;
  }

  Future<List<Product>> getProductsFromRemote() async {
    final Uri uri = Uri.parse('$apiUri?sheetId=$sheetId');
    final Response resp = await client.get(uri);

    if (resp.statusCode >= 400) {
      throw StateError('Unsuccessful connection: ${resp.body}');
    }

    final Map<dynamic, dynamic> body = jsonDecode(resp.body) as Map<dynamic, dynamic>;
    final List<List<dynamic>> productList = List<List<dynamic>>.from(body['data'] as List<dynamic>);

    final String csvData = const ListToCsvConverter().convert(productList);
    writeDataOnDisk(csvData);

    return productList //
        .skip(1)
        .map((List<dynamic> data) => Product((ProductBuilder b) {
              b
                ..name = data[0].toString()
                ..barcode = num.tryParse(data[1].toString())
                ..price = num.tryParse(data[2].toString());
            }))
        .toList();
  }

// Future<Product> getProductByBarcode(String barcode) async {
//   final Uri uri = Uri.parse('$apiUri?sheetId=$sheetId&barcode=$barcode');
//   final Response resp = await client.get(uri);
//
//   if (resp.statusCode >= 400) {
//     throw StateError('Unsuccessful connection: ${resp.body}');
//   }
//
//   final Map<dynamic, dynamic> body = jsonDecode(resp.body) as Map<dynamic, dynamic>;
//   final List<dynamic> data = body['data'] as List<dynamic>;
//
//   return Product((ProductBuilder b) {
//     b
//       ..name = data[0]
//       ..barCode = data[1].toString()
//       ..price = num.tryParse(data[2]);
//   });
// }
}
