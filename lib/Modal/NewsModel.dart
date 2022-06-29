class NewsModel {
  String? status;
  int? totalResults;
  List<dynamic>? articles ;

  NewsModel({this.status, this.totalResults, this.articles});
  NewsModel NewsFactory(Map map) {
    return NewsModel(articles: map['articles'].map((e)=>Articles().ArticleFactory(e)).toList(),
        totalResults: map['totalResults'],
        status: map['status']);

  }
}

class Articles {
  Source? source;
  String? author, title, description, url, urlToImage, publishedAt, content;

  Articles({this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content});

  Articles ArticleFactory(Map map) {

    return Articles(source: Source().SourceFactory(map['source']),
    author: map['author'],
    title: map['title'],
    description: map['description'],
    url: map['url'],
    urlToImage: map['urlToImage'],
    publishedAt: map['publishedAt'],
    content: map['content']);



  }
}

class Source {
  String? id, name;

  Source({this.id, this.name});

  Source SourceFactory(Map map) {
   return Source(id: map['id'], name: map['name']);

  }

}