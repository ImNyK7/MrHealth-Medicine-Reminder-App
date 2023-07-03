import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Reminder/ui/theme.dart';

class ProfileBackup extends StatefulWidget {
  const ProfileBackup({super.key});

  @override
  State<ProfileBackup> createState() => _ProfileBackupState();
}

class _ProfileBackupState extends State<ProfileBackup> {
  final user = FirebaseAuth.instance.currentUser!;

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new),),
        centerTitle: true,
        title: Text('Profile', style: headingStyle,),
        backgroundColor: Get.isDarkMode?Colors.grey[700]:Colors.white,

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 120, 
                height: 120,
                child: Image(image: AssetImage("images/profile.png")),
              ),
              const SizedBox(height: 10),
              Text(user.email!),
              const SizedBox(height: 20),
              SizedBox(width: 200, child: MaterialButton(
              onPressed: (){
              FirebaseAuth.instance.signOut();
              },
              color: Colors.redAccent,
              child: Text('SIGN OUT'),
              ),),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
               TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  border: OutlineInputBorder()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}