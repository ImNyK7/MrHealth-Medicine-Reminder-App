import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Reminder/ui/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
        title: Text("About Us", style: subHeadingStyle,),
        backgroundColor: context.theme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text("Mr. Health is a mobile app that have been develope by 2 Indonesian Informatics student of Universitas International Semen Indonesia, they're Naufal Yuwan Kanugraha and Farid Hidayatullah. This app have some features that can be used by the User, here's the list of the features:\n\n\n1.	Reminder\n\nIn this feature, the user can add a reminder for them to take their medicine. by just putting the name of the meds, the dose and the date of the reminder, and the user can also choose if the reminder is set to be reminded daily or none.\n\n\n2.	News and Article\n\nThis feature offer a variety of english spoken news from around the world, with the catgeory of Health, so that the user can be aware of the latest news about health surrounding them.\n\n\n3. Healhty Food Recipe\n\nThis feature allows the user to search for a healthy low calories food recipe, with the search bar that have been given, the user can free to search up to 50 food recipes, if the user clicked one of the recipe, the app will redirect the user to a web with the full step and ingredients how to make the food.\n\n\n4. Healthy Tips and Tricks\n\nThis feature offers a lot of tips and tricks about user's health, for example: a tips to lose fat, a tips to maintain a good teeth, etc", style: bigNormalStyle,),
        ),
      ),
    );
  }
}