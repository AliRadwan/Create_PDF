import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';

class PDFCreatorWidget {
  String fileName = 'background_demo.pdf';

  PdfDocument _generateDocument() {
    final pdf = new PdfDocument(deflate: zlib.encode);
    final page = new PdfPage(pdf, pageFormat: PdfPageFormat.a4);
    final g = page.getGraphics();
    g.setColor(new PdfColor(0.0, 1.0, 1.0));
    g.setColor(new PdfColor(0.3, 0.3, 0.3));
    return pdf;
  }

  Future<PdfImage> pdfImageFromImage({PdfDocument pdf, ui.Image image}) async {
    final ByteData bytes =
    await image.toByteData(format: ui.ImageByteFormat.rawRgba);

    return PdfImage(
      pdf,
      image: bytes.buffer.asUint8List(),
      width: PdfPageFormat.a4.width.toInt(),
      height: PdfPageFormat.a4.height.toInt(),
    );
  }

  Future<PdfImage> pdfImageFromImageProvider(
      {PdfDocument pdf,
        prefix0.ImageProvider image,
        prefix0.ImageConfiguration configuration,
        prefix0.ImageErrorListener onError}) async {
    final Completer<PdfImage> completer = Completer<PdfImage>();
    final prefix0.ImageStream stream =
    image.resolve(configuration ?? prefix0.ImageConfiguration.empty);

    prefix0.ImageStreamListener listener;
    listener =
        prefix0.ImageStreamListener((prefix0.ImageInfo image, bool sync) async {
          final PdfImage result =
          await pdfImageFromImage(pdf: pdf, image: image.image);
          if (!completer.isCompleted) {
            completer.complete(result);
          }
          stream.removeListener(listener);
        }, onError: (dynamic exception, StackTrace stackTrace) {
          if (!completer.isCompleted) {
            completer.complete(null);
          }
          if (onError != null) {
            onError(exception, stackTrace);
          } else {
            // https://groups.google.com/forum/#!topic/flutter-announce/hp1RNIgej38
            assert(false, 'image failed to load');
          }
        });

    stream.addListener(listener);
    return completer.future;
  }

  Future<String> createPDF() async {
    final Document pdf = Document();
    final PdfDocument pdfDocument = _generateDocument();

    const imageProvider = const prefix0.AssetImage('assets/ic_background_view.png');
    final PdfImage pdfImage =
    await pdfImageFromImageProvider(pdf: pdfDocument, image: imageProvider);

    List<String> data =['Name', 'Coach', 'players'];



    pdf.addPage(
      MultiPage(
        crossAxisAlignment: CrossAxisAlignment.start,
        pageTheme: PageTheme(
          buildBackground: (context) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: pdfImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            );
          },
          pageFormat: PdfPageFormat.a4,
        ),
        header: (Context context) {
          return null;
        },
        footer: (Context context) {
          return Container(
            alignment: Alignment.centerRight,
            child: Text(
              '${context.pageNumber} / ${context.pagesCount}',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PdfColors.grey,
              ),
            ),
          );
        },
        build: (Context context) => <Widget>[
          Container(child: Text('Background Image Demo')),
          Table.fromTextArray(context: context, data: <List<String>>[
            <String>['Name', 'Coach', 'players'],
            // ...data.map(
            //         (item) => [item.name, item.coach, item.players.toString()])
          ]),
        ],
      ),
    );

    String filePath;

    await getApplicationDocumentsDirectory().then((directory) async {
      filePath = directory.path;
    });

    Directory pdfDirectory;

    await Directory('$filePath/PDFs')
        .exists()
        .then((isExistsDirectory) async {
      if (isExistsDirectory) {
        pdfDirectory = Directory('$filePath/PDFs');
      } else {
        await Directory('$filePath/PDFs')
            .create()
            .then((createdDirectory) {
          pdfDirectory = createdDirectory;
        });
      }
    });

    final File file = File('${pdfDirectory.path}/$fileName');
    file.writeAsBytesSync(pdf.save());
    return file.path;
  }
}