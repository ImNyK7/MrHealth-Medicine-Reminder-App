import 'source_models.dart';
import 'package:medreminder/NewsArticle/components/list_tile.dart';
import 'package:medreminder/NewsArticle/models/source_models.dart';

class Articles {
  List<Articles>? articles;

  Articles({this.articles});

  Articles.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content});

  Article.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}


