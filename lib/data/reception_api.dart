import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:movie_db/models/index.dart';
import 'package:movie_db/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReceptionApi {
  ReceptionApi();

  Future<String> get _receptionsDir async {
    final Directory directory = (await getExternalStorageDirectory())!;
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

  Future<Reception> _getPendingReception(String path) async {
    final File dataFile = File('$path/data.json');
    var fileData = await dataFile.readAsString();
    final Map<String, dynamic> data = jsonDecode(fileData) as Map<String, dynamic>;
    return Reception.fromJson(data);
  }

  Future<List<String>> getPendingReceptions() async {
    final Directory dir = Directory(await _pendingReceptionsDir);
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    return dir.list().asyncMap((FileSystemEntity entry) async => entry.path).toList();
  }

  Future<void> sendPendingReceptions(List<String> paths) async {
    for (var path in paths) {
      var reception = await _getPendingReception(path);
      await sendMail(reception, path);
    }
  }

  Future<String> finalizeReception(Reception reception) async {
    final String receptionFolder = await saveReception(reception);
    return sendMail(reception, receptionFolder);
  }

  Future<String> saveReception(Reception reception) async {
    final String receptionFolder = await createReceptionFolder(reception.invoiceNr);
    final String jsonData = jsonEncode(reception.json);
    //
    final File dataFile = File('$receptionFolder/data.json');
    if (!dataFile.existsSync()) {
      await dataFile.create(recursive: true);
    }
    //
    await dataFile.writeAsString(jsonData);

    // await createExcelReception(reception, receptionFolder);
    await createPdf(reception, receptionFolder);

    return receptionFolder;
  }

  Future<String> saveInventory(Reception reception) async {
    final String receptionFolder = await createReceptionFolder(reception.invoiceNr);
    final String jsonData = jsonEncode(reception.json);
    //
    final File dataFile = File('$receptionFolder/data.json');
    if (!dataFile.existsSync()) {
      await dataFile.create(recursive: true);
    }
    //
    await dataFile.writeAsString(jsonData);

    // await createExcelReception(reception, receptionFolder);
    await createInventoryPdf(reception, receptionFolder);

    return receptionFolder;
  }

  Future<String> finalizeInventory(Reception reception) async {
    final String receptionFolder = await saveInventory(reception);
    return sendMail(reception, receptionFolder);
  }

  Future<String> createReceptionFolder(String receptionId) async {
    final String date = DateFormat('yy/MM/dd').format(DateTime.now());
    final String folderPath = '${await _pendingReceptionsDir}/$receptionId';

    final Directory directory = Directory(folderPath);
    if (!directory.existsSync()) {
      directory.create(recursive: true);
    }

    return folderPath;
  }

  Future<String> sendMail(Reception reception, String receptionFolder) async {
    final Directory dir = Directory(receptionFolder);

    final List<String> receptionDataFiles = await dir
        .list() //
        .asyncMap((FileSystemEntity entry) => entry.path)
        .where((String path) => path.contains('.pdf'))
        .toList();

    // final Email email = Email(
    //   body: DefaultEmailBody,
    //   subject: '$DefaultEmailSubject $receptionId',
    //   recipients: <String>[DefaultEmailToAddress],
    //   attachmentPaths: receptionDataFiles,
    //   isHTML: false,
    // );

    // Note that using a username and password for gmail only works if
    // you have two-factor authentication enabled and created an App password.
    // Search for "gmail app password 2fa"
    // The alternative is to use oauth.
    const String username = 'romotors8@gmail.com';
    const String password = 'xdng iirg xjlq nwpz';

    final SmtpServer smtpServer = gmail(username, password);

    String platformResponse;

    try {
      // await FlutterEmailSender.send(email);

      final Message message = Message()
        ..from = Address(username, reception.creatorName)
        ..recipients.add(DefaultEmailToAddress)
        ..attachments.addAll(receptionDataFiles.map((String file) => FileAttachment(File(file))))
        ..subject = '${reception.documentType} ${reception.invoiceNr}'
        ..text = DefaultEmailBody;
      final SendReport sendReport = await send(message, smtpServer);

      platformResponse = '${reception.documentType} ${reception.invoiceNr} a fost trimisa cu success';

      // final String newDirName = dir.path.replaceFirst('pending', 'sent');
      // await Directory(newDirName).create(recursive: true);
      //
      // await dir.rename(newDirName);
      var files = dir.list().map((e) => e.path);
      files.forEach((String file) async {
        final String newFile = file.replaceFirst('pending', 'sent');
        await File(newFile).create(recursive: true);
        await File(file).rename(newFile);
      });
      dir.delete(recursive: true);
    } catch (error) {
      print(error);
      platformResponse = 'S-a intampinat o eroare la trimiterea receptiei';
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

    sheet.cell(CellIndex.indexByString(companyNameIndex)).value = TextCellValue(reception.company!);
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

  Future<String> createInventoryPdf(Reception reception, String directory) async {
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
          _inventoryHeader(context, reception),
          _contentTable(
            context,
            reception.entries.toList(),
            _inventoryTableHeader,
            (int index, ProductEntry entry) => _inventoryTableRow(entry),
          ),
        ],
      ),
    );

    var path = '$directory/inventar.pdf';
    final File file = await File(path).create(recursive: true);
    await file.writeAsBytes(await doc.save());

    return path;
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
          _tableHeader(context, reception),
          _contentTable(
            context,
            reception.entries.toList(),
            _receptionTableHeader,
            (int index, ProductEntry entry) => _tableRow(entry, index.isEven),
          ),
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

  pw.Table _contentTable(
    pw.Context context,
    List<ProductEntry> entries,
    List<pw.Widget> header,
    pw.TableRow Function(int, ProductEntry) rowBuilder,
  ) {
    final pw.TableRow tableHeader = pw.TableRow(
      decoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
        color: PdfColors.green,
      ),
      children: header,
    );

    final pw.Table table = pw.Table(
      children: <pw.TableRow>[
        tableHeader,
        ...entries.indexed.map<pw.TableRow>(((int, ProductEntry) e) {
          return rowBuilder(e.$1, e.$2);
        }).toList(),
      ],
    );

    return table;
  }

  List<pw.Widget> get _receptionTableHeader {
    return <pw.Widget>[
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
    ];
  }

  List<pw.Widget> get _inventoryTableHeader {
    return <pw.Widget>[
      pw.Text(
        'Denumire',
        textAlign: pw.TextAlign.left,
      ),
      pw.Text(
        'Cantitate',
        textAlign: pw.TextAlign.left,
      ),
      pw.Text(
        'Pret',
        textAlign: pw.TextAlign.left,
      ),
      pw.Text(
        'Val. Total',
        textAlign: pw.TextAlign.right,
      )
    ];
  }

  pw.TableRow _tableRow(ProductEntry entry, bool isEven) {
    return pw.TableRow(
      children: <pw.Widget>[
        pw.Text(
          entry.product.name,
          textAlign: pw.TextAlign.left,
        ),
        pw.Container(
          height: 40,
          width: 80,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.code128(),
            data: entry.product.barcode.toString(),
            drawText: true,
          ),
        ),
        pw.Text(
          entry.quantity.toString(),
          textAlign: pw.TextAlign.right,
        ),
        pw.Text(
          entry.product.price.toString(),
          textAlign: pw.TextAlign.right,
        ),
      ],
      decoration: pw.BoxDecoration(
        color: isEven ? PdfColors.white : PdfColors.grey,
        border: const pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.black,
            width: .5,
          ),
        ),
      ),
    );
  }

  pw.TableRow _inventoryTableRow(ProductEntry entry) {
    return pw.TableRow(
      children: <pw.Widget>[
        pw.Text(
          entry.product.name,
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          entry.quantity.toString(),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          entry.product.price.toString(),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          '${((entry.product.price ?? 0) * entry.quantity).toStringAsFixed(2)} RON',
          textAlign: pw.TextAlign.right,
        ),
      ],
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.black,
            width: .5,
          ),
        ),
      ),
    );
  }

  pw.Widget _inventoryHeader(pw.Context context, Reception reception) {
    double total = 0;
    for (final ProductEntry entry in reception.entries) {
      total += entry.quantity * (entry.product.price ?? 0);
    }

    return pw.Container(
      decoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
      ),
      padding: const pw.EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 20),
      alignment: pw.Alignment.centerLeft,
      height: 80,
      child: pw.DefaultTextStyle(
        style: const pw.TextStyle(
          fontSize: 12,
        ),
        child: pw.Row(
          children: <pw.Widget>[
            pw.Expanded(
              flex: 1,
              child: pw.GridView(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: <pw.Widget>[
                  pw.Text('Data'),
                  pw.Text(DateFormat('yy/MM/dd').format(DateTime.now())),
                  pw.Text('Responsabil'),
                  pw.Text(reception.creatorName),
                  pw.Text('Locatie'),
                  pw.Text(reception.location!),
                ],
              ),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Column(
                children: [
                  pw.Text('Total', style: const pw.TextStyle(fontSize: 24)),
                  pw.FittedBox(
                    fit: pw.BoxFit.cover,
                    child: pw.Text(
                      '${total.toStringAsFixed(2)} RON',
                      style: const pw.TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget _tableHeader(pw.Context context, Reception reception) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
      ),
      padding: const pw.EdgeInsets.only(left: 40, top: 10, bottom: 10, right: 20),
      alignment: pw.Alignment.centerLeft,
      height: 50,
      child: pw.DefaultTextStyle(
        style: const pw.TextStyle(
          fontSize: 12,
        ),
        child: pw.GridView(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: <pw.Widget>[
            pw.Text('Factura #'),
            pw.Text(reception.invoiceNr),
            pw.Text('Data: '),
            pw.Text(DateFormat('yy/MM/dd').format(DateTime.now())),
            pw.Text('Responsabil: '),
            pw.Text(reception.creatorName),
            pw.Text('Partener: '),
            pw.Text(reception.company!),
          ],
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
