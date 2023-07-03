import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/Settings/Menu/privacy_page.dart';
import 'package:medreminder/SignInUp/login.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage ({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passController  = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _dateofBirthController = TextEditingController();
  final _bloodTypeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _fullNameController.dispose();
    _dateofBirthController.dispose();
    _bloodTypeController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passController.text.trim());

      addUserDetails(
       _fullNameController.text.trim(),
       _dateofBirthController.text.trim(),
       _bloodTypeController.text.trim(),
       _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails(String fullName, birth, bloodType, email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name' : fullName,
      'date of birth' : birth,
      'blood type' : bloodType,
      'email' : email,
    });
  }

  bool passwordConfirmed(){
    if (_passController.text.trim() == _confirmPassController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: blueColor,
                    gradient: LinearGradient(colors: [blueColor, Colors.lightBlueAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "images/icontext.png",
                              height: 150,
                              width: 150,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 5),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _fullNameController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: blueColor,
                      ),
                      hintText: "Full Name",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 7),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _bloodTypeController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.bloodtype,
                        color: blueColor,
                      ),
                      hintText: "Blood Type",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 7),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _dateofBirthController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        LineAwesomeIcons.baby_carriage,
                        color: blueColor,
                      ),
                      hintText: "Date of Birth",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 7),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _emailController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: blueColor,
                      ),
                      hintText: "Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 7),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffEEEEEE),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _passController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      focusColor: blueColor,
                      icon: Icon(
                        LineAwesomeIcons.lock,
                        color: blueColor,
                      ),
                      hintText: "Enter Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 7),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffEEEEEE),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPassController,
                    cursorColor: blueColor,
                    decoration: InputDecoration(
                      focusColor: blueColor,
                      icon: Icon(
                        Icons.published_with_changes_rounded,
                        color: blueColor,
                      ),
                      hintText: "Confirm Password",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context){
                        return PrivacyPolicyPage();
                  }));
                },
                child: Text("Privacy and Policy", style: TextStyle(color: blueColor)),
              ),
            ),
                GestureDetector(
                  onTap: signUp,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [blueColor, lightblueColor],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a Member?  "),
                      GestureDetector(
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                              color: blueColor
                          ),
                        ),
                        onTap: widget.showLoginPage,
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}