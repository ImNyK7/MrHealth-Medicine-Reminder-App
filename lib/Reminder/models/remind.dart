class Remind {
  int? id;
  String? title;
  String? dose;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  String? repeat;

  Remind({
    this.id,
    this.title,
    this.dose,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.repeat,
  });
  
  Remind.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    dose = json['dose'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['dose'] = this.dose;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['repeat'] = this.repeat;
    return data;

 
 }

}