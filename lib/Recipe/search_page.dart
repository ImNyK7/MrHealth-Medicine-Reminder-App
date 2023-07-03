import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Recipe/recipe_home.dart';
import 'package:medreminder/Recipe/recipe_model.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Reminder/ui/theme.dart';

class SearchPage extends StatefulWidget {
  //const SearchPage({super.key});
  String? search;
  SearchPage({this.search});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RecipeModel> list = <RecipeModel>[];
  String? text;
  
  getAPiData(search)  async{
    final url = "https://api.edamam.com/search?q=$search&app_id=4300c25b&app_key=06df05f2f79367b8f9462dea06ded758&from=0&to=50&calories=100-300&health=alcohol-free";
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    //print(response.body);
    json['hits'].forEach((e){
      RecipeModel recipeModel = RecipeModel(
        url: e['recipe']['url'],
        image: e['recipe']['image'],
        source: e['recipe'][''],
        label: e['recipe']['label'],
      );
      setState(() {
        list.add(recipeModel);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getAPiData(widget.search);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?lightGreyColor:Colors.grey[800],
        elevation: 0,
        title: Text("Healthy Food Recipe"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 15, 
                mainAxisSpacing: 15), 
                itemCount: list.length,
                itemBuilder: (context, i){
                final x = list[i];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebPage(
                      url:x.url
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(x.image.toString())
                      )
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          height: 45,
                          color: Colors.black.withOpacity(0.35),
                          child: Text(x.label.toString(), style: TextStyle(color: Colors.white) ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}