import 'dart:io';
//import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:future/pdf/pdfmaker.dart';

import 'model/model.dart';

class Desh_Screen extends StatefulWidget {
  const Desh_Screen({Key? key}) : super(key: key);

  @override
  State<Desh_Screen> createState() => _Desh_ScreenState();
}

class _Desh_ScreenState extends State<Desh_Screen> {
  @override
  Widget build(BuildContext context) {
    DataModel d1=ModalRoute.of(context)!.settings.arguments as DataModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bak1.jpg'),fit: BoxFit.cover)
      ),
      child :Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Resum"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () async {
             await Printing.layoutPdf(onLayout: (format) => savePDF(d1));
            }, icon: Icon(Icons.downloading_sharp))
          ],
        ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 10),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:  FileImage( File("${d1.path}")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60,left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Name :- ${d1.name}",style: TextStyle(fontSize: 23,color: Colors.black)),
                        SizedBox(height: 15),
                        Text(" Address :- ${d1.address}",style: TextStyle(fontSize: 23,color: Colors.black)),
                        SizedBox(height: 15),
                        Text(" Objective :- ${d1.objective}",style: TextStyle(fontSize: 20,color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,
                  right: 30,
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Phone Number :- ${d1.ph}",style: TextStyle(fontSize: 20)),
                    Divider(height: 5,color: Colors.brown.shade700),
                    SizedBox(height: 15),
                    Text(" Educetion :- ${d1.s}",style: TextStyle(fontSize: 20)),
                    Divider(height: 5,color: Colors.brown.shade700),
                    SizedBox(height: 15),
                    Text(" skill :- ${d1.skill}",style: TextStyle(fontSize: 20)),
                    Divider(height: 5,color: Colors.brown.shade700),
                    SizedBox(height: 15),
                    Text(" Master In :- ${d1.select}",style: TextStyle(fontSize: 20)),
                    Divider(height: 5,color: Colors.brown.shade700),
                    SizedBox(height: 15),
                    Text(" Salary :- ${d1.rangeValues!.start} - ${d1.rangeValues!.end}",style: TextStyle(fontSize: 20)),
                    Divider(height: 5,color: Colors.brown.shade700),
                  ],
                ),
              ),
            ],
          ),
         ],
        ),
      )
    );
  }
}
