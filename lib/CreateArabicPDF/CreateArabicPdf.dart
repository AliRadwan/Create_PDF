// CreateArabicPdf


import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart' show AssetImage;


const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);


Future<void> generateAndPrintArabicPdf({String details,String bookNum,String replay,String date,String subject,List<String>items,}) async {
  final Document pdf = Document();

  var arabicFont = Font.ttf(await rootBundle.load("assets/fonts/arabic.ttf"));


  // final profileImage = MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  PdfImage logoImage = await pdfImageFromImageProvider(
    pdf: pdf.document,
    image: AssetImage('assets/images/logo.png'),
  );


  pdf.addPage(Page(
      theme: ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.roll80,
      build: (Context context) {
        return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 100,
                      height: 100,
                      child: Image(logoImage),
                    ),
                  Container(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    details, style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('التفاصيل الخاصه بالمراسلة رقم : ', style: TextStyle(
                                  fontSize: 8,
                                ))
                            )
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    bookNum, style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('رقم الكتاب : ', style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),

                        Text('      ',),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    replay, style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('ردا علي / الحاق : ', style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    date, style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('تاريخ الارسال : ', style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),

                        Text('      ',),

                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    subject, style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('الموضوع : ', style: TextStyle(
                                  fontSize: 6,
                                ))
                            )
                        ),
                      ]
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(22, 5, 22, 5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Table.fromTextArray(
                        headerStyle: TextStyle(fontSize: 6),headerAlignment: Alignment.center,
                        headers: <dynamic>['حالة الاطلاع','ملاحظات','الاجراء', 'الي' ,'تاريخ الارسال', 'من','م'],
                        cellAlignment: Alignment.center,
                        cellStyle: TextStyle(fontSize: 4),
                        data:
                        <List<dynamic>>[
                          items,items,items
                          // <dynamic>['34/44','الحمد لله','لاجراء اللازم','ادارة الحاسب', '10/11' ,'الدعم الفني', '١' ],
                        ],
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    '  نقدا  ',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('طريقة الدفع : ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                      ]
                  ),
                ]
            )
        );
      }
  ));
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/1.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}