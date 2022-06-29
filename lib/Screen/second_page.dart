import 'package:flutter/material.dart';
import 'package:newsapi/Modal/NewsModel.dart';

class Second_Page extends StatefulWidget {
  const Second_Page({Key? key}) : super(key: key);

  @override
  _Second_PageState createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  @override
  Widget build(BuildContext context) {
    Articles n1 = ModalRoute.of(context)!.settings.arguments as Articles;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red.shade100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 400,
                      child: ClipRRect(
                        child: Image.network(
                          "${n1.urlToImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 400,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "${n1.title}",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text(
                          "${n1.author}",
                          style: TextStyle(fontSize: 20,color: Colors.black),

                        ),
                        subtitle: Text(
                          "${n1.source!.name}",
                          style: TextStyle(
                            fontSize: 15,color: Colors.black
                          ),
                        ),
                        trailing: Text(
                          "${n1.publishedAt}",
                          style: TextStyle(
                            fontSize: 15,color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${n1.description}",
                        style: TextStyle(
                          fontSize: 20,color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${n1.content}",
                        style: TextStyle(
                          fontSize: 20,color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
