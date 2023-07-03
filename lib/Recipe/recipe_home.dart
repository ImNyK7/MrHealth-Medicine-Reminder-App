import 'dart:convert';
//import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Recipe/recipe_model.dart';
import 'package:medreminder/Recipe/search_page.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({super.key});

  @override
  State<RecipeHomePage> createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  
  List<RecipeModel> list = <RecipeModel>[];
  String? text;
  final url = "https://api.edamam.com/search?q=chicken&app_id=4300c25b&app_key=06df05f2f79367b8f9462dea06ded758&from=0&to=50&calories=100-300&health=alcohol-free";
  getAPiData()  async{
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
      if (!mounted) { 
      return;
      }
      setState(() {
        list.add(recipeModel);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getAPiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios,
          color: Get.isDarkMode?Colors.white:Colors.grey
          ),
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Text("Healthy Food Recipe"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (v){
                  text = v;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage(search: text,)));
                  }, 
                  icon: Icon(Icons.search_rounded)),
                  hintText: "Search for Recipe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  fillColor: lightGreyColor.withOpacity(0.02),
                  filled: true,
                ),
              ),
              SizedBox(height: 15),
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
class WebPage extends StatelessWidget {
  //const WebPage({super.key});
  final url;
  WebPage({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}