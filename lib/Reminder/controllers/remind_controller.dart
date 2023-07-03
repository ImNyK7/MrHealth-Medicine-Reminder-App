import 'package:get/get.dart';
import 'package:medreminder/Reminder/database/db_helper.dart';
import 'package:medreminder/Reminder/models/remind.dart';

class RemindController extends GetxController{
  
  @override
  void onReady(){
    getReminder();
    super.onReady();
  }

  //final RxList<Remind> remindList = List<Remind>.empty().obs;
  var remindList = <Remind>[].obs;

  Future <int> addRemind({Remind? remind}) async{
    return await DbHelper.insert(remind);
  }

  // Future<void> addRemind({required Remind? remind}) async {
  //   await DbHelper.insert(remind);
  // }

  void getReminder() async{
    List<Map<String, dynamic>> reminder  = await DbHelper.query();
    remindList.assignAll(reminder.map((data) => new Remind.fromJson(data)).toList());
  }

  void delete(Remind remind){
    DbHelper.delete(remind);
    getReminder();
  }

  void markRemindCompleted(int id) async{
    await DbHelper.update(id);
    getReminder();
  }

}