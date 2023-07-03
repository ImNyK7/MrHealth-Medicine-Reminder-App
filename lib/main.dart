import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medreminder/Reminder/database/db_helper.dart';
import 'package:medreminder/Reminder/services/theme_services.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/SignInUp/confirm_page.dart';
import 'package:medreminder/SignInUp/login.dart';
import 'package:medreminder/bot_nav.dart';
import 'package:medreminder/home_page.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DbHelper.initDb();
  await GetStorage.init();
  //runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: ConfirmPage(),
    );
  }
}
