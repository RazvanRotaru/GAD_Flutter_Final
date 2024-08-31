import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:movie_db/models/index.dart';

class ProductApi {
  ProductApi({required this.uri});

  final String uri;

  Future<List<Product>> getProducts() async {
    // Load the Excel file as a byte array
    final Uint8List bytes = await File.fromUri(Uri.parse(uri)).readAsBytes();
    final Excel excel = Excel.decodeBytes(bytes);

    // Get the first sheet
    final Sheet sheet = excel.sheets.values.first;

    // Iterate through the rows
    final List<Product> data = <Product>[];
    for (final List<Data?> row in sheet.rows) {
      final String? name = row[0]?.value.toString();
      final int? price = int.tryParse(row[1]?.value.toString() ?? '');
      final String? barcode = row[2]?.value.toString();
      if (name == null || price == null || barcode == null) {
        // log error
        continue;
      }

      data.add(Product((ProductBuilder b) => b
        ..name = name
        ..barCode = barcode
        ..price = price));
    }

    return data;
  }
}
