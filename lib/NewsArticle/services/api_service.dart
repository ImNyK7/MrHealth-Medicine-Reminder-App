import 'dart:convert';
import 'package:http/http.dart';
import 'package:medreminder/NewsArticle/models/article_models.dart';

class ApiService {

  final endPointUrl = "https://newsapi.org/v2/top-headlines?country=gb&category=health&apiKey=cacee27fff544eb39d5fb29b28ca3788"; 

   Future<List<Article>> getArticle() async{
    Response res = await get(Uri.parse(endPointUrl));

    if(res.statusCode==200){
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }else{

      throw("Cant get the News");
    }

  }
}