import 'dart:io';

import 'package:create_pdf_and_save/AyHaga.dart';
import 'package:create_pdf_and_save/CreateArabicPDF/CreateArabicPdf.dart';
import 'package:create_pdf_and_save/ScoundWay/reportView.dart';
import 'package:create_pdf_and_save/resume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:printing/printing.dart';

import 'CreatePdf.dart';
import 'CreatePdfWidget.dart';
import 'PdfPreviewScreen.dart';
import 'PdfPreviewScreen/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final pdf = pw.Document();
 ImageProvider  imageProvider = const AssetImage('images/sig1.png');







  writeOnPdf()async{

    const imageProvider = const AssetImage('assets/image.png');
    final image = await flutterImageProvider(imageProvider);

    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(32),

          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Header(
                  level: 0,
                  child: pw.Text("Ali Radwan")
              ),
              

              // pw.Center(
              //   child: pw.Image(image)
              // ),
              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Header(
                  level: 1,
                  child: pw.Text("Second Heading")
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
            ];
          },


        )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  // Future<void> _saveAsFile({
  //   BuildContext context,
  //   LayoutCallback build,
  //   PdfPageFormat pageFormat,
  // }) async {
  //   final bytes = await build(pageFormat);
  //
  //   final appDocDir = await getApplicationDocumentsDirectory();
  //   if (appDocDir == null) {
  //     return;
  //   }
  //   final appDocPath = appDocDir.path;
  //   final file = File(appDocPath + '/' + 'document.pdf');
  //   print('Save as file ${file.path} ...');
  //   await file.writeAsBytes(bytes);
  //   await OpenFile.open(file.path);
  // }


  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("PDF Flutter",style: TextStyle(color: Colors.white,fontFamily:"Arial"),),
            leading: IconButton(icon: Icon(Icons.add),onPressed: (){
             return generateResume;
            }),
        actions: [
    IconButton(icon: Icon(Icons.accessibility_rounded), onPressed: (){
    // CreatePdfStatefulWidget();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePdf()));}
    ),
          IconButton(icon: Icon(Icons.animation), onPressed: (){
            // CreatePdfStatefulWidget();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPdfPage(title: "ay haga",)));
          })
        ],
      ),
      


      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: (){
                return generateAndPrintArabicPdf(details:"2233-444-555",bookNum: "233-444-55-5",replay: "لا يوجد",date: "09/12.2020",subject: "الحمد لله ",
                    items:['34/44','الحمد لله','لاجراء اللازم','ادارة الحاسب', '10/11' ,'الدعم الفني', '١' ] );
              },
              color: Color(0xffff9900),
              child: Text(
                'Create Arabic ',
                style: TextStyle(color: Colors.white,fontFamily:"Arial"),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: (){
                reportView(context);

                // _saveAsFile(context: context,pageFormat: PdfPageFormat.a4,);

                // generateResume(PdfPageFormat.a4);

              },
              color: Color(0xffff9900),
              child: Text(
                'Create English',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          writeOnPdf();
          await savePdf();
          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
          print(fullPath.toString());
          print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");


          Navigator.push(context, MaterialPageRoute(
              builder: (context) => PdfPreviewScreen(path: fullPath,)
          ));

        },
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}