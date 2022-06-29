import 'package:flutter/material.dart';
import 'package:newsapi/Screen/News_Screen.dart';
import 'package:newsapi/Screen/sumber.dart';
import 'package:newsapi/Screen/category.dart';

class Bottum extends StatefulWidget {
  const Bottum({Key? key}) : super(key: key);

  @override
  _BottumState createState() => _BottumState();
}

class _BottumState extends State<Bottum> {
  List news = [News_Screen(), Category(), Sumber()];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: news[select],
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.south_america), label: "Sumber"),
          ],
          currentIndex: select,
          selectedItemColor: Colors.red,
          onTap: onItemTap,
          iconSize: 30,
          backgroundColor: Colors.red.shade50,
          elevation: 20,
        ),
      ),
    );
  }

  void onItemTap(int index) {
    setState(() {
      select = index;
    });
  }
}
