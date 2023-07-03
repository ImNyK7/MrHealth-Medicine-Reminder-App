import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/TipsAndTricks/models/tips.dart';
import 'package:medreminder/TipsAndTricks/models/tips_model.dart';


class TipsDetails extends StatelessWidget {
  //const TipsDetails({super.key, required this.tips});

  final Tips tips;
  TipsDetails(this.tips);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tips.title),
        backgroundColor: pinkClr
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(tips.imageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(tips.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                child: Text(tips.desc),
              ),
            ],
          ),
        ),
      ),
    );
  }
}