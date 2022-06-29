import 'package:flutter/material.dart';

import '../Modal/NewsModel.dart';
import '../Modal/Newsapi.dart';

class Last_Screen extends StatefulWidget {
  const Last_Screen({Key? key}) : super(key: key);

  @override
  _Last_ScreenState createState() => _Last_ScreenState();
}

class _Last_ScreenState extends State<Last_Screen> {
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<NewsModel>(
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
                                title: Text("${n1.articles![index].title}"),
                                subtitle: Text("${n1.articles![index].author}"),
                                trailing: Container(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
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
    );
  }
}
