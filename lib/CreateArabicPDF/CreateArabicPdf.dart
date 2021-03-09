// CreateArabicPdf


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:printing/printing.dart';

Future<void> generateAndPrintArabicPdf() async {
  final pw.Document pdf = pw.Document();
  // PdfImage imageProvider = const AssetImage('assets/images/8.png') as PdfImage;


  var arabicFont =pw. Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));

  final image = pw.MemoryImage(
    File('test.webp').readAsBytesSync(),
  );


  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.all(32),
      theme: pw.ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.roll80,
      build: (pw.Context context) {
        return pw.Center(
            child: pw.Column(
                children: [

                  pw.Text(":"),
                  pw.Container(),
                  pw. Row(
                      mainAxisAlignment:  pw.MainAxisAlignment.center,
                      children: [
                       pw. Directionality(
                            textDirection: pw.TextDirection.rtl,
                            child: pw.Center(
                                child:pw. Text(
                                    'علي رضوان', style: pw.TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),

            pw.Text("ddd"),
                        pw.Container(
                          // child: pw.Image(imageProvider),
                        )
                      ]
                  ),
                  //
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   'علي رضوان', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('الاسم : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   ' 01062767789 ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('الرقم الضريبي : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   'المنصورة - الدقهلية', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('الموقع : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  //
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '01062767789', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('هاتف : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  1  ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('رقم الفاتورة : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  علي محمد علي   ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('اسم العميل : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  //
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  0506040215 ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('رقم هاتف العميل : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  //
                  // Directionality(
                  //     textDirection: TextDirection.rtl,
                  //     child: Text('المشتريات' , style: TextStyle(
                  //         fontSize: 10
                  //     ))
                  // ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(22, 5, 22, 5),
                  //   child: Directionality(
                  //     textDirection: TextDirection.rtl,
                  //     child: Table.fromTextArray(
                  //       headerStyle: TextStyle(
                  //           fontSize: 6
                  //       ),
                  //       headers: <dynamic>['الإجمالي', 'العدد' ,'الخدمة', 'القطعة'],
                  //       cellAlignment: Alignment.center,
                  //       cellStyle: TextStyle(
                  //           fontSize: 5
                  //       ),
                  //       data:  <List<dynamic>>[
                  //         <dynamic>['50', '10' ,'كوي', 'قميص' ],
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  50  ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('المجموع الفرعي : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  -20  ',
                  //                   style: TextStyle(
                  //                     fontSize: 10,
                  //                   ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('خصم العميل : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  1  ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('خصم عددي : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  29  ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('الإجمالي : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  مدفوعة  ',
                  //                   style: TextStyle(
                  //                     fontSize: 10,
                  //                   ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('حالة الفاتورة : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text(
                  //                   '  نقدا  ',
                  //                   style: TextStyle(
                  //                     fontSize: 10,
                  //                   ))
                  //           )
                  //       ),
                  //       Directionality(
                  //           textDirection: TextDirection.rtl,
                  //           child: Center(
                  //               child: Text('طريقة الدفع : ', style: TextStyle(
                  //                 fontSize: 10,
                  //               ))
                  //           )
                  //       ),
                  //     ]
                  // ),
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