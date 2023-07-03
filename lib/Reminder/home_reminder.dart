import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medreminder/Profile/profile_page.dart';
import 'package:medreminder/Reminder/controllers/remind_controller.dart';
import 'package:medreminder/Reminder/models/remind.dart';
import 'package:medreminder/Reminder/ui/widgets/remind_tile.dart';
import 'package:medreminder/Reminder/services/notification_services.dart';
import 'package:medreminder/Reminder/services/theme_services.dart';
import 'package:intl/intl.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/Reminder/add_remindbar.dart';
import 'package:medreminder/Reminder/ui/widgets/button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medreminder/ad_helper.dart';

class ReminderHomePage extends StatefulWidget {
  const ReminderHomePage({super.key});

  @override
  State<ReminderHomePage> createState() => _ReminderHomePageState();
}

class _ReminderHomePageState extends State<ReminderHomePage> {
  DateTime _selectedDate = DateTime.now();
  final _remindController = Get.put(RemindController());
  var notifyHelper;
  
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Stack(
        children: [
          Column(
          children: [
            _addRemindBar(),
            _addDateBar(),
            SizedBox(
              height: 20,
            ),
            _showReminder(),
          ],
        ),]
      ),
    );
  }

  _showReminder() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _remindController.remindList.length,
            itemBuilder: (_, index) {
              Remind remind = _remindController.remindList[index];
              if (remind.repeat == 'Daily') {
                DateTime date =
                    DateFormat.jm().parse(remind.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);
                notifyHelper.scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    remind);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, remind);
                                },
                                child: RemindTile(remind))
                          ],
                        ),
                      ),
                    ));
              }
              if (remind.date == DateFormat.yMd().format(_selectedDate)) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, remind);
                                },
                                child: RemindTile(remind))
                          ],
                        ),
                      ),
                    ));
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Remind remind) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: remind.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyColor : Colors.white,
        child: Column(
          children: [
            Container(
              height: 5,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[500] : Colors.grey[300]),
            ),
            Spacer(),
            remind.isCompleted == 1
                ? Container()
                : _bottmSheetButton(
                    label: "Complete  Reminder",
                    onTap: () {
                      _remindController.markRemindCompleted(remind.id!);
                      Get.back();
                    },
                    clr: primaryColor,
                    context: context,
                  ),
            _bottmSheetButton(
              label: "Delete  Reminder",
              onTap: () {
                _remindController.delete(remind);
                Get.back();
              },
              clr: redColor,
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            _bottmSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              clr: Colors.white,
              isClose: true,
              context: context,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  _bottmSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(label,
              style: isClose
                  ? titleStyle
                  : titleStyle.copyWith(color: Colors.white)),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color(0xFFAAB6FB),
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _addRemindBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                )
              ],
            ),
          ),
          MyButton(
              label: "+ Add \nReminder",
              onTap: () async {
                await Get.to(() => AddReminderPage());
                _remindController.getReminder();
              })
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme!"
                  : "Activated Dark Theme!");

          //notifyHelper.scheduledNotification();
        },
        child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      actions: [
        InkWell(
          child: CircleAvatar(
            backgroundImage: AssetImage("images/profile.png"),
          ),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        // Icon(Icons.person,
        // size: 20,),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
