import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
Future<void> createPdf()
async {
  var pdf=pw.Document();
  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.all(10),
    pageFormat: PdfPageFormat.a4,
    orientation: pw.PageOrientation.portrait,
    build: (context) {
      return pw.Center(
        child: pw.Container(height: 300,width: 300,color: PdfColors.purple));
    },
  ));
  Directory? directory=await getApplicationDocumentsDirectory();
  File file=File("${directory!.path}/flutter.pdf");
  print("${directory.path}/flutter.pdf");
  await file.writeAsBytes(await pdf.save());
}