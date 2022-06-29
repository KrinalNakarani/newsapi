import 'package:flutter/material.dart';
import 'package:newsapi/Screen/News_Screen.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  String data = "Business";

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Category"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'last', arguments: data);
                        data = "Business";
                      });
                    },
                    child: customButton("Business")),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, 'last', arguments: data);
                        data = "Sports";
                      });
                    },
                    child: customButton("Sports")),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, 'last', arguments: data);
                          data = "Technology";
                        });
                      },
                      child: customButton("Technology")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, 'last', arguments: data);
                          data = "Science";
                        });
                      },
                      child: customButton("Science")),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, 'last', arguments: data);
                      data = "Politics";
                    });
                  },
                  child: customButton("Politics")),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        shadowColor: Colors.redAccent.shade700,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent),
              child: Text(
                "$title",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
