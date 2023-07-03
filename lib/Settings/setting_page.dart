import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medreminder/Others/about_page.dart';
import 'package:medreminder/Reminder/services/theme_services.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/Settings/Menu/notif_page.dart';
import 'package:medreminder/Settings/Menu/privacy_page.dart';
import 'package:medreminder/Settings/setting_tile.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _launchEmail()async{
    launchUrl(Uri.parse("mailto:mrhealthapp@gmail.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: headingStyle,
        ),
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              ThemeTile(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                icon: Icons.nightlight_round_sharp,
                title: "Theme",
                onTap: () {
                  ThemeService().switchTheme();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.blueAccent,
                icon: Icons.volume_up_rounded,
                title: "Change Notification",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => NotifSettingPage()),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.orange,
                icon: Icons.question_mark_sharp,
                title: "About Us",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.purple,
                icon: Icons.lock_reset_sharp,
                title: "Privacy and Policy",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.red,
                icon: Icons.call,
                title: "Need a Help? Contact Us!",
                onTap: () {
                  _launchEmail();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
