import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';


class CreatePdfStatefulWidget extends StatefulWidget {
  CreatePdfStatefulWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CreatePdfState createState() => _CreatePdfState();
}

class _CreatePdfState extends State<CreatePdfStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Generate PDF',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: _createPDF,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    //Create a PDF document
    PdfDocument document = PdfDocument();
    //Add a page and draw text
    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(20, 60, 150, 30));
    //Save the document
    List<int> bytes = document.save();
    //Dispose the document
    document.dispose();

    //Get external storage directory
    Directory directory = await getExternalStorageDirectory();
    //Get directory path
    String path = directory.path;
    //Create an empty file to write PDF data
    File file = File('$path/Output.pdf');
    //Write PDF data
    await file.writeAsBytes(bytes, flush: true);
    //Open the PDF document in mobile
    OpenFile.open('$path/Output.pdf');
  }
}
