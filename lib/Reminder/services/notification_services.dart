import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:medreminder/Reminder/models/remind.dart';
import 'package:medreminder/Reminder/ui/notified_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper{
      FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    _configureLocalTimezone();
    final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("appicon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
       android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification);

    }

    Future<void> displayNotification({required String title, required String body}) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'medicine_app', 'medreminder',
        importance: Importance.max, priority: Priority.high, icon: 'appicon');
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

     scheduledNotification(int hour, int minutes, Remind remind) async {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        remind.id!.toInt(),
        remind.title,
        remind.dose,
        _convertTime(hour, minutes),
        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'medicine_app', 'medreminder', 
                importance: Importance.max, priority: Priority.high,
                icon: 'appicon')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "${remind.title}|" + "${remind.dose}|"
      );

   }

   tz.TZDateTime _convertTime(int hour, int minutes){
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = 
      tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
      
    if(scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(const Duration(days:1));
    }
    
    return scheduleDate;
   }

   Future<void> _configureLocalTimezone() async {
    tz.initializeTimeZones();
    final String timeZone  = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
   }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    if (payload == "Theme Changed"){
      
    }
    else{
      Get.to(()=>NotifiedPage(label:payload));
    }
     
  }

}