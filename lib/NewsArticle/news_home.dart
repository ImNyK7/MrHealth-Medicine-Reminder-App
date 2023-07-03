import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/NewsArticle/components/list_tile.dart';
import 'package:medreminder/NewsArticle/models/article_models.dart';
import 'package:medreminder/NewsArticle/services/api_service.dart';
import 'package:medreminder/Reminder/ui/theme.dart';


class NewsHomePage extends StatelessWidget {
  //const NewsHomePage({super.key});

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Get.isDarkMode?Colors.grey[600]:Colors.white,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios,
          color: Get.isDarkMode?Colors.white:Colors.grey
          ),
        ),
        title:  Text("News & Article", style: subHeadingStyle),
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if(snapshot.hasData&&snapshot.data!=null&& snapshot.data!.isNotEmpty){
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) => listTile(articles[index], context)
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}