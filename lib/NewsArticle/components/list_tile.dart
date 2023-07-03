import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/NewsArticle/models/article_models.dart';
import 'package:medreminder/NewsArticle/news_detail.dart';
import 'package:medreminder/Reminder/ui/theme.dart';

 Widget listTile(Article article, BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.push(
        context, MaterialPageRoute(
          builder: (
            context) => NewsDetail(
              article: article))
      );
    },
    child: Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Get.isDarkMode?Colors.grey[600]:Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(article.urlToImage!),
              fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 9),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(article.source!.name!, style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            article.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    ),
  );
}