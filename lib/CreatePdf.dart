import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class CreatePdf extends StatefulWidget {
  @override
  _CreatePdfState createState() => _CreatePdfState();
}

class _CreatePdfState extends State<CreatePdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Convert',style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: _convertImageToPDF,
            ),
            // FlatButton(
            //   child: Text(
            //     'create',style: TextStyle(color: Colors.white),
            //   ),
            //   color: Colors.blue,
            //   onPressed: generateInvoice,
            // )

          ],
        ),
      ),
    );
  }

  String text =
      'سنبدأ بنظرة عامة مفاهيمية على مستند PDF بسيط. تم تصميم هذا الفصل ليكون توجيهًا مختصرًا قبل الغوص في مستند حقيقي وإنشاءه من البداية.\r\n \r\nيمكن تقسيم ملف PDF إلى أربعة أجزاء: الرأس والجسم والجدول الإسناد الترافقي والمقطورة. يضع الرأس الملف كملف PDF ، حيث يحدد النص المستند المرئي ، ويسرد جدول الإسناد الترافقي موقع كل شيء في الملف ، ويوفر المقطع الدعائي تعليمات حول كيفية بدء قراءة الملف.\r\n\r\nرأس الصفحة هو ببساطة رقم إصدار PDF وتسلسل عشوائي للبيانات الثنائية. البيانات الثنائية تمنع التطبيقات الساذجة من معالجة ملف PDF كملف نصي. سيؤدي ذلك إلى ملف تالف ، لأن ملف PDF يتكون عادةً من نص عادي وبيانات ثنائية (على سبيل المثال ، يمكن تضمين ملف خط ثنائي بشكل مباشر في م';



  Future<void> _convertImageToPDF() async {
    //Create the PDF document
    PdfDocument document = PdfDocument();
    //Add the page
    PdfPage page = document.pages.add();

    //Get page client size
    final Size pageSize = page.getClientSize();

    //Add the pages to the document
    for (int i = 1; i <= 1; i++) {
      document.pages.add().graphics.drawString(
          'page$i', PdfStandardFont(PdfFontFamily.timesRoman, 11),
          bounds: Rect.fromLTWH(250, 0, 615, 100));
    }

    //Load the image.
    final PdfImage image = PdfBitmap(await _readImageData('logo.png'));
    //draw image to the first page
    page.graphics.drawImage(image, Rect.fromLTWH(0, 0, page.size.width*0.85, page.size.height*0.15));


    //Generate PDF grid.
    final PdfGrid grid = getGrid();


    // page.graphics.drawString("helloffdfdfdfdfdf ", PdfStandardFont(PdfFontFamily.helvetica, 16),
    //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    //     bounds: const Rect.fromLTWH(0, 0, 150, 20)
    // );


    // page.graphics.drawString(text, "dd")

    // //Draw text
    // page.graphics.drawString(
    //     text, PdfTrueTypeFont(File('Arial.ttf').readAsBytesSync(), 14),
    //     brush: PdfBrushes.black,
    //     bounds: Rect.fromLTWH(
    //         0, 0, page.getClientSize().width, page.getClientSize().height),
    //     format: PdfStringFormat(
    //         textDirection: PdfTextDirection.rightToLeft,
    //         alignment: PdfTextAlignment.right,
    //         paragraphIndent: 35));



    //Create the header with specific bounds
    PdfPageTemplateElement header = PdfPageTemplateElement(
        Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 400));


//Create the composite field with date field
    PdfCompositeField compositefields = PdfCompositeField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        text: 'Trasol',
        // fields: <PdfAutomaticField>[dateAndTimeField]

    );


    // //Draw text
    // page.graphics.drawString(
    //     text, PdfTrueTypeFont(File('assets/fonts/Arial.ttf').readAsBytesSync(), 14),
    //     brush: PdfBrushes.black,
    //     bounds: Rect.fromLTWH(
    //         0, 0, page.getClientSize().width, page.getClientSize().height),
    //     format: PdfStringFormat(
    //         textDirection: PdfTextDirection.rightToLeft,
    //         alignment: PdfTextAlignment.right,
    //         paragraphIndent: 35));



    //Draw text
    document.pages.add().graphics.drawString('Hello World!!!',
        PdfTrueTypeFont(File('assets/fonts/Arial.ttf').readAsBytesSync(), 14),
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(10, 10, 300, 50));


    //Add composite field in header
    compositefields.draw(header.graphics, Offset(0, 50 - PdfStandardFont(PdfFontFamily.timesRoman, 18).height));


    PdfLayoutResult result = drawHeader(page, pageSize, grid);

    //Draw grid
    drawGrid(page, grid, result);


//Add the header at top of the document
    document.template.top = header;


    //Create the footer with specific bounds
    PdfPageTemplateElement footer = PdfPageTemplateElement(Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 50));

//Create the page number field
    PdfPageNumberField pageNumber = PdfPageNumberField(font: PdfStandardFont(PdfFontFamily.timesRoman, 19), brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the number style for page number
    pageNumber.numberStyle = PdfNumberStyle.upperRoman;

//Create the page count field
    PdfPageCountField count = PdfPageCountField(font: PdfStandardFont(PdfFontFamily.timesRoman, 19), brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//set the number style for page count
    count.numberStyle = PdfNumberStyle.upperRoman;

//Create the composite field with page number page count
    PdfCompositeField compositeField = PdfCompositeField(font: PdfStandardFont(PdfFontFamily.timesRoman, 19), brush: PdfSolidBrush(PdfColor(0, 0, 0)), text: 'Page {0} of {1}',
        fields: <PdfAutomaticField>[pageNumber, count]);
    compositeField.bounds = footer.bounds;

//Add the composite field in footer
    compositeField.draw(footer.graphics, Offset(290, 50 - PdfStandardFont(PdfFontFamily.timesRoman, 19).height));



//Add the footer at the bottom of the document
    document.template.bottom = footer;





    // //Generate PDF grid.
    // final PdfGrid grid = getGrid();
    // //Draw the header section by creating text element
    // final PdfLayoutResult result = drawHeader(page, pageSize, grid);
    // //Draw grid
    // drawGrid(page, grid, result);







    //Save the docuemnt
    List<int> bytes = document.save();
    //Dispose the document.
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

  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }





  /////////////////////////////////////////





  ///
/// ////////////////////////
///
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 14);

    //Create data foramt and convert it to text.
    final DateFormat format = DateFormat.yMMMMd('en_US');
    final String invoiceNumber = 'Invoice Number: 2058557939\r\n\r\nDate: ' +
        format.format(DateTime.now());
    final Size contentSize = contentFont.measureString(invoiceNumber);
    const String address = '''Bill To: Abraham Swearegin,
        \r\n\r\nUnited States, California, San Mateo,
        \r\n\r\n9920 BridgePointe Parkway, \r\n\r\n9365550136''';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(
            // pageSize.width - (contentSize.width + 30), 120, contentSize.width + 30,
            pageSize.width - (contentSize.width + 30), 200, pageSize.width - (contentSize.width + 30),
            pageSize.height - 120));

    return PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(
            30, 200, pageSize.width - (contentSize.width + 30),
            pageSize.height - 120));
  }

  //Draws the grid
  void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
    Rect totalPriceCellBounds;
    Rect quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0));

    //Draw grand total.
    page.graphics.drawString('Grand Total',
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            quantityCellBounds.left,
            result.bounds.bottom + 10,
            quantityCellBounds.width,
            quantityCellBounds.height));
    page.graphics.drawString(getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            totalPriceCellBounds.left,
            result.bounds.bottom + 10,
            totalPriceCellBounds.width,
            totalPriceCellBounds.height));
  }

  //Create PDF grid and return
  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 6);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];

    List<String> fromList = ["ali","Ali","ahmed","ayhaga","go","fuck"];

    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Product Id';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'From';
    headerRow.cells[2].value = 'Date';
    headerRow.cells[3].value = 'to';
    headerRow.cells[4].value = 'Procc';
    headerRow.cells[5].value = "note";
    addProducts('1', fromList[0], 8.99, 2, 17.98, grid);
    addProducts('2', 'Long-Sleeve Logo Jersey,M', 49.99, 3, 149.97, grid);
    addProducts('3', 'Mountain Bike Socks,M', 9.5, 2, 19, grid);
    addProducts('4', 'Long-Sleeve Logo Jersey,M', 49.99, 4, 199.96, grid);
    addProducts('5', 'ML Fork', 175.49, 6, 1052.94, grid);
    addProducts('6', 'Sports-100 Helmet,Black', 34.99, 1, 34.99, grid);
    //Apply the grid built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    grid.columns[1].width = 100;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

  //Draw the invoice footer data.
  void drawFooter(PdfPage page, Size pageSize) {
    final PdfPen linePen =
    PdfPen(PdfColor(142, 170, 219, 255), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    //Draw line
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
        Offset(pageSize.width, pageSize.height - 100));

    const String footerContent =
    '''800 Interchange Blvd.\r\n\r\nSuite 2501, Austin,
         TX 78721\r\n\r\nAny Questions? support@adventure-works.com''';

    //Added 30 as a margin for the layout
    page.graphics.drawString(
        footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
        format: PdfStringFormat(alignment: PdfTextAlignment.right),
        bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
  }

  //Create and row for the grid.
  void addProducts(String productId, String productName, double price,
      int quantity, double total, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = productId;
    row.cells[1].value = productName;
    row.cells[2].value = price.toString();
    row.cells[3].value = quantity.toString();
    row.cells[4].value = total.toString();
    row.cells[5].value = total.toString();

  }

  //Get the total amount.
  double getTotalAmount(PdfGrid grid) {
    double total = 0;
    for (int i = 0; i < grid.rows.count; i++) {
      final String value = grid.rows[i].cells[grid.columns.count - 1].value;
      total += double.parse(value);
    }
    return total;
  }



  //////////////////////////////////////////////////////


}





