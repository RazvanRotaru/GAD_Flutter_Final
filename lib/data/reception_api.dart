import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:movie_db/models/index.dart';
import 'package:path_provider/path_provider.dart';

class ReceptionApi {
  ReceptionApi();

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/receptions/';
  }

  Future<String> saveReception(Reception reception) async {
    final String receptionFolder = await createReceptionFolder(reception.id);
    final String jsonData = jsonEncode(reception);

    final File dataFile = File('$receptionFolder/data.json');
    if (!dataFile.existsSync()) {
      dataFile.create(recursive: true);
    }

    dataFile.writeAsString(jsonData);

    return dataFile.path;
  }

  Future<String> createReceptionFolder(String receptionId) async {
    final String date = DateFormat.yMMMd().format(DateTime.now());
    final String folderPath = '$_localPath/$date/$receptionId';

    final Directory directory = Directory(folderPath);
    if (!directory.existsSync()) {
      directory.create(recursive: true);
    }

    return folderPath;
  }
  //
  // Future<String> sendEmail(String dataFilePath)
  // {
  //   emailSender.sendMessage("razvanrtr@outlook.com",
  //       "TESTETESTE", "ETETRSTESTE", "ASFAFA");
  // }
}
