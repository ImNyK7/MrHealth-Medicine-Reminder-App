import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Reminder/ui/theme.dart';

class NotifSettingPage extends StatelessWidget {
  const NotifSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change The Notification Sound", style: subHeadingStyle),
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios,
          color: Get.isDarkMode?Colors.white:Colors.grey
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("Do you need to change our notification sound? here's a few step that you can do to change the app notification sound:\n\n\n1. Go to your phone settings\n\n2. Look for \"App Management\"\n\n3. Find adn Click on our App \"Mr Health\"\n\n4. Click on \"Notification\"\n\n5. Change the \"Notification Sound\" or \"Ringtone\" to your preferred sound", style: bigNormalStyle,),
          ),
        ),
      ),
    );
  }
}