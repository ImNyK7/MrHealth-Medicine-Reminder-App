import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medreminder/TipsAndTricks/models/tips_model.dart';

class Repo{
  final _baseUrl = 'http://10.1.21.175:8000/tips';

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if(response.statusCode == 200){
        print(response.body);
        Map<String, dynamic> apiRespose = jsonDecode(response.body);
        Iterable<dynamic> it = apiRespose['tips'];
        //Iterable it = jsonDecode(response.body);
        List<Tips> tips = it.map((e) => Tips.fromJson(e)).toList();
        return tips;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}