import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:medreminder/TipsAndTricks/models/tips.dart';
import 'package:medreminder/TipsAndTricks/models/tips_model.dart';
import 'package:medreminder/TipsAndTricks/screens/tips_details.dart';
import 'package:medreminder/TipsAndTricks/tips_repo.dart';

class TipsList extends StatefulWidget {
  const TipsList({super.key});

  @override
  State<TipsList> createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {
  List<Tips> listTips = [];
  Repo repo = Repo();

  getData() async {
    listTips = await repo.getData();
    setState((){});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.grey[600]:Colors.white,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios,
          color: Get.isDarkMode?Colors.white:Colors.black
          ),
        ),
        title:  Text("Healthy Tips & Tricks", style: TextStyle(
          color: Get.isDarkMode?Colors.white:Colors.black
        ),),
      ),
      body: ListView.builder(
        itemCount: listTips.length, 
        itemBuilder: (context, index){
          Tips tips = listTips[index];
          return Card(
            child: ListTile(
              title: Text(listTips[index].title),
              subtitle: Text(listTips[index].source),
              leading: Image.network(listTips[index].imageUrl),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TipsDetails(listTips[index])));
              },
            ),
          );
      })
    );
  }
}