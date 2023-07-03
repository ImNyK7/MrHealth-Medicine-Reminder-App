import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../Reminder/ui/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  // String? email;
  // String? fullName;
  // String? birth;
  // String? bloodType;

  // @override
  // void initState() {
  //   getProfile();
  //   super.initState();
  // }

  // getProfile() async{
  //   User user = FirebaseAuth.instance.currentUser!;
  //   final DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(user.uid)
  //     .get();

  //     setState(() {
  //       email = userDoc.get('email');
  //       fullName = userDoc.get('full name');
  //       birth = userDoc.get('date of birth');
  //       bloodType = userDoc.get('blood type');

  //     });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new),),
          centerTitle: true,
          title: Text(
            'Profile',
            style: headingStyle,
          ),
          backgroundColor: context.theme.backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 150,
                  child: Image(image: AssetImage("images/profile.png")),
                ),
                const SizedBox(height: 30),
                Form(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.email),
                            SizedBox(width: 10),
                            Text(
                              "naufalyk@gmail.com",
                              style: normalStyle,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person),
                            SizedBox(width: 10),
                            Text(
                              "Naufal Yuwan",
                              style: normalStyle,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.child_care_outlined),
                            SizedBox(width: 10),
                            Text(
                              "Surabaya, 15 October 2022",
                              style: normalStyle,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.bloodtype),
                            SizedBox(width: 10),
                            Text(
                              "O",
                              style: normalStyle,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 100,
                            child: MaterialButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                              },
                              color: Colors.redAccent,
                              child: Text('SIGN OUT'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
