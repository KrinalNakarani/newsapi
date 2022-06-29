import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapi/Modal/NewsModel.dart';

class NewsApi {
  Future<NewsModel> getNewsData(String cat)async{

    String link = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=f278338390f6481399bcecbd1a472636";

    Uri uri = Uri.parse(link);
    var abc = await http.get(uri);
    var nn =jsonDecode(abc.body);

    return NewsModel().NewsFactory(nn) ;
  }

}
