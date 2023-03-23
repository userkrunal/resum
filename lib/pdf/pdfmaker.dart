import 'dart:io';
import 'dart:typed_data';
//import 'package:flutter/material.dart';
import 'package:future/model/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

 Future<Uint8List>savePDF(DataModel d1) async {
  var pdf=pw.Document();
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(10),
      orientation: pw.PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          children: [
            pw.Row(
              children: [
                pw.ClipOval(
                  child: pw.Image(
                    pw.MemoryImage(File("${d1.path}").readAsBytesSync()),
                    height: 200,
                    width: 200,
                    fit:  pw.BoxFit.cover,
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(" Name :- ${d1.name}",style: pw.TextStyle(fontSize: 30,color: PdfColors.black)),
                    pw.SizedBox(height: 15),
                    pw.Text(" Address :- ${d1.address}",style: pw.TextStyle(fontSize: 30,color: PdfColors.black)),
                    pw.SizedBox(height: 15),
                    pw.Text(" Phone :- ${d1.ph}",style: pw.TextStyle(fontSize: 30,color: PdfColors.black)),
                  ],
                ),
              ],
            ),
            pw.Container(
              padding: pw.EdgeInsets.only(top: 100,
                right: 30,
                left: 30,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(" Objective :- ${d1.objective}",style: pw.TextStyle(fontSize: 25)),
                  pw.Divider(height: 5,color: PdfColors.brown700),
                  pw.SizedBox(height: 15),
                  pw.Text(" Educetion :- ${d1.s}",style: pw.TextStyle(fontSize: 25)),
                  pw.Divider(height: 5,color: PdfColors.brown700),
                  pw.SizedBox(height: 15),
                  pw.Text(" skill :- ${d1.skill}",style: pw.TextStyle(fontSize: 25)),
                  pw.Divider(height: 5,color: PdfColors.brown700),
                  pw.SizedBox(height: 15),
                  pw.Text(" Master In :- ${d1.select}",style: pw.TextStyle(fontSize: 25)),
                  pw.Divider(height: 5,color: PdfColors.brown700),
                  pw.SizedBox(height: 15),
                  pw.Text(" Salary :- ${d1.rangeValues!.start} - ${d1.rangeValues!.end}",style: pw.TextStyle(fontSize: 25)),
                  pw.Divider(height: 5,color: PdfColors.brown700),
                ],
              ),
            ),

          ]
        );
      },
    ),
  );
  return await pdf.save();
}