import 'package:flutter/material.dart';
import 'package:newsapi/Modal/NewsModel.dart';
import 'package:newsapi/Modal/Newsapi.dart';
import 'package:newsapi/Screen/category.dart';
import 'package:newsapi/Screen/sumber.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({Key? key}) : super(key: key);

  @override
  _News_ScreenState createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {


  @override
  Widget build(BuildContext context) {



   String data = "";

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<NewsModel>(
                  future: NewsApi().getNewsData(data),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      NewsModel n1 = snapshot.data;

                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: 400,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${n1.articles![0].urlToImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  width: 400,
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 5),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${n1.articles![0].title}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 20,
                                    shadowColor: Colors.redAccent.shade700,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'Second',
                                              arguments: n1.articles![index]);
                                        });
                                      },
                                      child: ListTile(
                                        title: Text(
                                            "${n1.articles![index].title}"),
                                        subtitle: Text(
                                            "${n1.articles![index].author}"),
                                        trailing: Container(
                                          height: 100,
                                          width: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "${n1.articles![index].urlToImage}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: n1.articles!.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
