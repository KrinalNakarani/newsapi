import 'package:flutter/material.dart';
import 'package:newsapi/Screen/Bottum.dart';
import 'package:newsapi/Screen/News_Screen.dart';
import 'package:newsapi/Screen/category.dart';
import 'package:newsapi/Screen/last_Screen.dart';
import 'package:newsapi/Screen/second_page.dart';
import 'package:newsapi/Screen/sumber.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bottum',
      routes: {
        '/':(context)=>News_Screen(),
        'Second':(context)=>Second_Page(),
        'cate':(context)=>Category(),
        'sum':(context)=>Sumber(),
        'bottum':(context)=>Bottum(),
        'last':(context)=>Last_Screen(),
      },
    ),
  );
}
