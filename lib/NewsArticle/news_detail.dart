import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/NewsArticle/models/article_models.dart';
import '../Reminder/ui/theme.dart';

class NewsDetail extends StatelessWidget {
  //const NewsDetail({super.key, required this.article});
  final Article article;

  NewsDetail({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source!.name!),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage!),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 12),
            Text(
              article.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              "By: " + article.author!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Published at: " + article.publishedAt!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              article.description!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              article.content!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
