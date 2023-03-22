import 'package:flutter/material.dart';

class DataModel
{
  String? name,address,path,ph,s,skill,select;
  RangeValues? rangeValues;
  DataModel({
    this.name,
    this.address,
    this.ph,
    this.path,
    this.s,
    this.skill,
    this.select,
    this.rangeValues
  });
}