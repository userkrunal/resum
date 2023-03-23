import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future/model/model.dart';

import 'package:image_picker/image_picker.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String? path;
  TextEditingController txtObjective=TextEditingController();
  TextEditingController txtData=TextEditingController();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtAddress=TextEditingController();
  List educetionList=["B.C.A","B.B.A","BTech","M.B.B.S","B.S.C IT","Diploma"];
  List skillList=[false,false,false];
  List skillList1=[false,false,false];
  String select="Adroid";
  bool isExp=false;
  DataModel d1=DataModel();
  RangeValues rangeValues=RangeValues(10000, 25000);
  String? s;
  var txtKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtKey,
      child: WillPopScope(
        onWillPop: back,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Resume Builder App"),
              centerTitle: true,
              backgroundColor: Colors.purple,
              actions: [
                PopupMenuButton(color:Colors.purple.shade100,shape:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),itemBuilder: (context) => [
                  PopupMenuItem(child: Text("Setting")),
                  PopupMenuItem(child: Text("Profile")),
                  PopupMenuItem(child: Text("Help")),
                ],)
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage( File("$path")),
                    ),
                  ),
                  ExpansionTile(
                    leading:Icon(Icons.camera),
                    title: Text("Pick Image"),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    collapsedIconColor: Colors.black,
                    iconColor: Colors.purple.shade300,
                    textColor: Colors.purple.shade200,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: () async {
                            ImagePicker imagePicker =ImagePicker();
                            XFile? xfile=await imagePicker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              path=xfile!.path;
                            });
                          }, child: Text("Gallery")),
                          SizedBox(width: 20),
                          ElevatedButton(onPressed: () async {
                            ImagePicker imagePicker =ImagePicker();
                            XFile? xfile=await imagePicker.pickImage(source: ImageSource.camera);
                            setState(() {
                              path=xfile!.path;
                            });
                          }, child: Text("Camera")),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    leading:Icon(Icons.person_add_outlined),
                    title:Text("Personal  Info."),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    trailing: Icon(Icons.note_alt_outlined),
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Name",
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade100,width: 3)),
                                  focusColor: Colors.purple.shade100
                              ),
                              controller: txtName,
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Please Enter The Value";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Address",
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade100,width: 3)),
                                  focusColor: Colors.purple.shade100
                              ),
                              controller: txtAddress,
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Please Enter The Value";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Objective",
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade100,width: 3)),
                                  focusColor: Colors.purple.shade100
                              ),
                              controller: txtObjective,
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Please Enter The Value";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Ph_No",
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple.shade100,width: 3)),
                                  focusColor: Colors.purple.shade100
                              ),
                              controller: txtData,
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return "Please Enter The Value";
                                }
                                else if(value.length!=10)
                                {
                                  return "Enter the valid no";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    leading:Icon(Icons.person),
                    title:Text("Education  Info."),
                    trailing: Icon(Icons.note_alt_outlined),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,

                    children: [
                      DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      focusColor: Colors.purple.shade100,
                      alignment: Alignment.center,
                      isExpanded: true,
                      items:educetionList.map((e) => DropdownMenuItem(child: Center(child: Text("$e",style: TextStyle(fontSize: 25),)),value: e,)).toList(),
                      value:s,
                      hint: Text("----Select----",style: TextStyle(fontSize: 25)),
                      onChanged: (value){
                        setState(() {
                          s=value as String;
                        });
                      },
                    ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    leading:Icon(Icons.ac_unit_outlined),
                    title:Text("Skill  Info."),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    trailing: Icon(Icons.add_circle_outline),
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,
                    children: [
                      Column(
                        children: [
                          CheckboxListTile(value: skillList[0],
                            activeColor: Colors.purple.shade300,
                            onChanged:(value) {
                              setState(() {
                                skillList[0]=value!;
                              });
                            },
                            title: Text("Animation"),
                          ),
                          CheckboxListTile(value: skillList[1],
                            activeColor: Colors.purple.shade300,
                            onChanged:(value) {
                              setState(() {
                                skillList[1]=value!;
                              });
                            },
                            title: Text("Coding"),
                          ),
                          CheckboxListTile(value: skillList[2],
                            activeColor: Colors.purple.shade300,
                            onChanged:(value) {
                              setState(() {
                                skillList[2]=value!;
                              });
                            },
                            title: Text("Graphics"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    leading:Icon(Icons.e_mobiledata),
                    title:Text("Experiece"),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,
                    trailing: Switch(activeColor: Colors.purple.shade400,value:isExp ,onChanged: (value) {
                      setState(() {
                        isExp=value;
                      });
                    },),
                    children: [
                      Visibility(
                        visible: isExp,
                        child:Column(
                          children: [
                            CheckboxListTile(value: skillList1[0],
                              activeColor: Colors.purple.shade300,
                              onChanged:(value) {
                                setState(() {
                                  skillList1[0]=value!;
                                });
                              },
                              title: Text("1 To 3 Years"),
                            ),
                            CheckboxListTile(value: skillList1[1],
                              activeColor: Colors.purple.shade300,
                              onChanged:(value) {
                                setState(() {
                                  skillList1[1]=value!;
                                });
                              },
                              title: Text("4 To 5 Years"),
                            ),
                            CheckboxListTile(value: skillList1[2],
                              activeColor: Colors.purple.shade300,
                              onChanged:(value) {
                                setState(() {
                                  skillList1[2]=value!;
                                });
                              },
                              title: Text("6 To 7 Years"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(
                    leading:Icon(Icons.join_left_rounded),
                    title:Text("Choice"),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,
                    children: [
                      RadioListTile(value: "Adroid", groupValue: select, onChanged: (value) {
                        setState(() {
                          select=value!;
                        });
                      }, title: Text("Adroid"),),
                      RadioListTile(value: "iOS", groupValue: select, onChanged: (value) {
                        setState(() {
                          select=value!;
                        });
                      }, title: Text("iOS"),),
                      RadioListTile(value: "Flutter", groupValue: select, onChanged: (value) {
                        setState(() {
                          select=value!;
                        });
                      },title: Text("Flutter"),),
                    ],
                  ),
                  SizedBox(height: 5),
                  ExpansionTile(title: Text("Salary"),
                    leading: Icon(Icons.wallet_giftcard_rounded),
                    collapsedBackgroundColor: Colors.purple.shade100,
                    collapsedIconColor: Colors.black,
                    textColor: Colors.purple.shade200,
                    iconColor: Colors.purple.shade300,
                    children: [
                      RangeSlider(values: rangeValues,
                          labels: RangeLabels("${rangeValues.start.round()}","${rangeValues.end.round()}"),
                          onChanged:(value) {
                            setState(() {
                              rangeValues=value;
                            });
                          },
                        divisions: 20,
                        max: 100000,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(onPressed: () {
                    if(txtKey.currentState!.validate())
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add Your Information Successfuly")));
                      }
                   var skill="";
                   if(skillList[0]==true)
                     {
                       skill="$skill Animation";
                     }
                   if(skillList[1]==true)
                   {
                     skill="$skill Coding";
                   }
                   if(skillList[2]==true)
                   {
                     skill="$skill Graphics";
                   }
                   // var name =txtName.text;
                   // var address=txtAddress.text;
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" $name $skill $address " ),
                  //   backgroundColor: Colors.purpleAccent.shade200,
                  //   behavior: SnackBarBehavior.floating,
                  //   action: SnackBarAction(label: "UNDO",
                  //     onPressed: () {
                  //     },
                  //   ),
                  // ));
                    d1 = DataModel(name: txtName.text,address: txtAddress.text,ph: txtData.text,path: path,s: s,skill: skill,select: select,rangeValues: rangeValues,objective: txtObjective.text);
                    Navigator.pushNamed(context, 'desh',arguments: d1);
                  }, child: Text("Submit")),

                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
  void showExitDilog()
  {
    showDialog(barrierDismissible: false,context: context, builder: (context) {
      return AlertDialog(
        title: Text("Are You Sure to Exit !"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () {
              exit(0);
            }, child: Text("Yes"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade200),),
            SizedBox(height: 5),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("No"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade200),),
          ],
        ),
      );
    },);
  }
  Future<bool> back()
  async{
    showExitDilog();
    return await false;
  }
}
