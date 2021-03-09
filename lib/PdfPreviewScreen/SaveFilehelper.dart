import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class SaveFilehelper {
  static Future<void> saveAndOpenFile(List<int> bytes) async {
//Get external storage directory
    final directory = await getExternalStorageDirectory();

//Get directory path
    final path = directory.path;

//Create an empty file to write PDF data
    File file = File('$path/Output.pdf');

//Write PDF data
    await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
    OpenFile.open('$path/Output.pdf');
  }
}
