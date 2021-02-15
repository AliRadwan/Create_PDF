// CreateArabicPdf


import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<void> generateAndPrintArabicPdf() async {
  final Document pdf = Document();

  var arabicFont = Font.ttf(await rootBundle.load("assets/fonts/HacenTunisia.ttf"));
  pdf.addPage(Page(
      theme: ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.roll80,
      build: (Context context) {
        return Center(
            child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text(
                                    'علي رضوان', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('الاسم : ', style: TextStyle(
                                  fontSize: 10,
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
                                    ' 01062767789 ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('الرقم الضريبي : ', style: TextStyle(
                                  fontSize: 10,
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
                                    'المنصورة - الدقهلية', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('الموقع : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '01062767789', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('هاتف : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  1  ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('رقم الفاتورة : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  علي محمد علي   ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('اسم العميل : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  0506040215 ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('رقم هاتف العميل : ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                      ]
                  ),

                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('المشتريات' , style: TextStyle(
                          fontSize: 10
                      ))
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 5, 22, 5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Table.fromTextArray(
                        headerStyle: TextStyle(
                            fontSize: 6
                        ),
                        headers: <dynamic>['الإجمالي', 'العدد' ,'الخدمة', 'القطعة'],
                        cellAlignment: Alignment.center,
                        cellStyle: TextStyle(
                            fontSize: 5
                        ),
                        data:  <List<dynamic>>[
                          <dynamic>['50', '10' ,'كوي', 'قميص' ],
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
                                    '  50  ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('المجموع الفرعي : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  -20  ',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('خصم العميل : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  1  ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('خصم عددي : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  29  ', style: TextStyle(
                                  fontSize: 10,
                                ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('الإجمالي : ', style: TextStyle(
                                  fontSize: 10,
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
                                    '  مدفوعة  ',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ))
                            )
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Center(
                                child: Text('حالة الفاتورة : ', style: TextStyle(
                                  fontSize: 10,
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