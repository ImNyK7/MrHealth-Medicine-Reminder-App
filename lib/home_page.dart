//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medreminder/NewsArticle/news_home.dart';
import 'package:medreminder/Others/about_page.dart';
import 'package:medreminder/Recipe/recipe_home.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/TipsAndTricks/screens/tips_screen.dart';
import 'Reminder/home_reminder.dart';
import 'Reminder/ui/widgets/button.dart';
import 'package:medreminder/main.dart';
import 'package:medreminder/home_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  List doctorName = ["Hippocrates", "Ali bin Abi Talib", "Karl Marx"];
  List knownFor = ["Physician", "Caliphs", 'Philosopher'];
  List drQuote = [
    "\"Wherever the art of Medicine is loved, there is also a love\nof Humanity.\"",
    "\"The word of God is the\nmedicine of the heart.\"",
    "\"Medicine heals doubts as well as diseases.\""
  ];
  List prsnImage =["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI0mpR3LwEau4YbV4Dmvn0ABzKHZYfrbgJkw&usqp=CAU", "https://storage.nu.or.id/storage/post/16_9/mid/1568831163.jpg", "https://www.ruangguru.com/hs-fs/hubfs/karl%20marx%20-%20brewminatedotcom.jpg?width=600&name=karl%20marx%20-%20brewminatedotcom.jpg"];
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Mr. Health App"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [lightblueColor, blueColor, bluishClr, ],
              transform: GradientRotation(90),
                begin: Alignment.centerLeft,
                end: Alignment.centerRight))
        ),
        
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('images/MenuImg.jpg'),
            Container(
              height: 250,
              width: 310,
              margin: const EdgeInsets.only(top: 150),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                color: Get.isDarkMode?Colors.grey[800]:Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/reminder.png'),
                            iconSize: 45,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReminderHomePage()),
                              );
                            },
                          ),
                          Text(
                            "Medicine\nReminder",
                            style: normalStyle,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/news.png'),
                            iconSize: 45,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => NewsHomePage()),
                              );
                            },
                          ),
                          Text("  News \n& Article", style: normalStyle)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/recipe.png'),
                            iconSize: 45,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => RecipeHomePage()),
                              );
                            },
                          ),
                          Text("Healty Food \n     Recipe", style: normalStyle)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/tips.png'),
                            iconSize: 45,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => const TipsList()),
                              );
                            },
                          ),
                          Text(
                            "Tips &\n Tricks",
                            style: normalStyle,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/about.png'),
                            iconSize: 50,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()),
                              );
                            },
                          ),
                          Text("About Us\n", style: normalStyle)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('images/soon.png'),
                            iconSize: 45,
                            onPressed: () {},
                          ),
                          Text("Coming Soon!\n", style: normalStyle)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 410),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorName.length,
                    itemBuilder: ((context, index) {
                      return (Container(
                        margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 25,
                            right: index == 2 ? 25 : 0),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 3.0)),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: NetworkImage(prsnImage[index])
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      doctorName[index],
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      knownFor[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              drQuote[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ));
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
