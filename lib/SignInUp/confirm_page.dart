import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medreminder/SignInUp/auth_page.dart';
import 'package:medreminder/SignInUp/login.dart';
import 'package:medreminder/bot_nav.dart';
import 'package:medreminder/home_page.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return BotNav();
          }else{
            return AuthPage();
          }
        },
      ),
    );
  }
}