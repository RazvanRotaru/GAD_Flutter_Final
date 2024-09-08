import 'dart:convert';
import 'dart:io';

import 'package:built_value/json_object.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/models/serializers.dart';
import 'package:movie_db/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReceptionApi {
  ReceptionApi();

  Future<String> get _receptionsDir async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/receptions/';
  }

  Future<String> get _pendingReceptionsDir async {
    final String receptionDir = await _receptionsDir;
    return '$receptionDir/pending/';
  }

  Future<String> get _sentReceptionsDir async {
    final String receptionDir = await _receptionsDir;
    return '$receptionDir/sent/';
  }

  Future<String> finalizeReception(Reception reception) async {
    final String receptionFolder = await saveReception(reception);
    return send(reception.invoiceNr, receptionFolder);
  }

  Future<String> saveReception(Reception reception) async {
    final String receptionFolder = await createReceptionFolder(reception.invoiceNr);
    final String jsonData = jsonEncode(serializers.serialize(reception));

    final File dataFile = File('$receptionFolder/data.json');
    if (!dataFile.existsSync()) {
      await dataFile.create(recursive: true);
    }

    await dataFile.writeAsString(jsonData);

    // await createExcelReception(reception, receptionFolder);
    await createPdf(reception, receptionFolder);

    return receptionFolder;
  }

  Future<String> createReceptionFolder(String receptionId) async {
    final String date = DateFormat('yy/MM/dd').format(DateTime.now());
    final String folderPath = '${await _pendingReceptionsDir}/$date/$receptionId';

    final Directory directory = Directory(folderPath);
    if (!directory.existsSync()) {
      directory.create(recursive: true);
    }

    return folderPath;
  }

  Future<String> send(String receptionId, String receptionFolder) async {
    final Directory dir = Directory(receptionFolder);
    final List<String> receptionDataFiles = await dir.list().asyncMap((FileSystemEntity entry) => entry.path).toList();

    final Email email = Email(
      body: DefaultEmailBody,
      subject: '$DefaultEmailSubject $receptionId',
      recipients: <String>[DefaultEmailToAddress],
      attachmentPaths: receptionDataFiles,
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Receptia $receptionId a fost trimisa cu success';

      receptionDataFiles.forEach((String file) async {
        final String newFile = file.replaceFirst('pending', 'sent');
        await File(newFile).create(recursive: true);
        await File(file).rename(newFile);
      });
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    return platformResponse;
  }

  void showResponse(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<String> createExcelReception(Reception reception, String directory) async {
    var data = await rootBundle.load('data/layout.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    var sheet = excel['Sheet1'];

    var companyNameIndex = 'B1';
    var invoiceNrIndex = 'B2';
    var userIndex = 'C2';

    sheet.cell(CellIndex.indexByString(companyNameIndex)).value = TextCellValue(reception.company);
    sheet.cell(CellIndex.indexByString(invoiceNrIndex)).value = TextCellValue(reception.invoiceNr);
    sheet.cell(CellIndex.indexByString(userIndex)).value = TextCellValue(reception.creatorName);

    var insertRowIndex = 3;

    for (var entry in reception.entries) {
      if (insertRowIndex > sheet.maxRows) {
        sheet.insertRow(insertRowIndex);
      }

      var row = sheet.row(insertRowIndex);

      row[0]?.value = TextCellValue(entry.product.name);
      row[1]?.value = IntCellValue(entry.product.barcode!.toInt());
      row[2]?.value = IntCellValue(entry.quantity.toInt());
      row[3]?.value = DoubleCellValue(entry.product.price!.toDouble());

      if (insertRowIndex.isEven) {
        var celStyle = CellStyle(backgroundColorHex: ExcelColor.grey);
        row[0]?.cellStyle = celStyle;
        row[1]?.cellStyle = celStyle;
        row[2]?.cellStyle = celStyle;
        row[3]?.cellStyle = celStyle;
      }
      insertRowIndex++;
    }

    var fileBytes = excel.save();

    var filePath = '$directory/data_intrare.xlsx';

    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    return filePath;
  }

  Future<String> createPdf(Reception reception, String directory) async {
    final pw.Document doc = pw.Document();

    doc.addPage(
      pw.MultiPage(
        maxPages: 100,
        pageTheme: _buildTheme(
          PdfPageFormat.a4,
          await PdfGoogleFonts.robotoRegular(),
          await PdfGoogleFonts.robotoBold(),
          await PdfGoogleFonts.robotoItalic(),
        ),
        build: (pw.Context context) => <pw.Widget>[
          _contentTable(context, reception.entries.toList()),
        ],
      ),
    );

    var path = '$directory/date_intrare.pdf';
    final File file = await File(path).create(recursive: true);
    await file.writeAsBytes(await doc.save());

    return path;
  }

  pw.PageTheme _buildTheme(PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      // buildBackground: (context) => pw.FullPage(
      //   ignoreMargins: true,
      //   child: pw.SvgImage(svg: _bgShape!),
      // ),
    );
  }

  pw.Table _contentTable(pw.Context context, List<ProductEntry> entries) {
    var header = pw.TableRow(
      decoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
        color: PdfColors.green,
      ),
      children: [
        pw.Text(
          'Denumire',
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'Cod Bare',
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'Cant',
          textAlign: pw.TextAlign.right,
        ),
        pw.Text(
          'Pret',
          textAlign: pw.TextAlign.right,
        ),
      ],
    );

    final pw.Table table = pw.Table(
      children: <pw.TableRow>[
        header,
        ...entries.indexed.map<pw.TableRow>((e) {
          return _tableRow(e.$2, e.$1 % 2 == 0);
        }).toList(),
      ],
    );

    return table;
  }

  pw.TableRow _tableRow(ProductEntry entry, bool isOdd) {
    return pw.TableRow(
      children: <pw.Widget>[
        pw.Center(
          child: pw.Text(
            entry.product.name,
            textAlign: pw.TextAlign.left,
          ),
        ),
        pw.Container(
          height: 40,
          width: 60,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.code128(),
            data: entry.product.barcode.toString(),
            drawText: true,
          ),
        ),
        pw.Center(
          child: pw.Text(
            entry.quantity.toString(),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Center(
          child: pw.Text(
            entry.product.price.toString(),
            textAlign: pw.TextAlign.right,
          ),
        ),
      ],
      decoration: pw.BoxDecoration(
        color: isOdd ? PdfColors.white : PdfColors.grey,
        border: const pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.black,
            width: .5,
          ),
        ),
      ),
    );
  }

// Future<String> sendPending() async {
//   final Directory dir = Directory('$_pendingReceptionsDir');
//   final List<String> pendingReceptions = await dir.list().asyncMap((
//       FileSystemEntity entry) => entry.path).toList();
//
//   String message;
//   try {
//     for (var reception in pendingReceptions) {
//       send(reception);
//     }
//     message = 'success';
//   } catch (error) {
//     print(error);
//     message = error.toString();
//   }
//
//   return message;
// }
}
