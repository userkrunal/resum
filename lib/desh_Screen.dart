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
    return Scaffold(
      appBar: AppBar(
        title: Text("Resum"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            createPdf();
          }, icon: Icon(Icons.downloading_sharp))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("${d1.name}"),
          // Text("${d1.address}"),
          // Text("${d1.ph}"),
          // Text("${d1.s}"),
          // Text("${d1.skill}"),
          //Text("${d1.select}"),
          //Text("${d1.rangeValues!.start} - ${d1.rangeValues!.end}")
        ],
      ),
    );
  }
}
