import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_dev/models/question.dart';

class QuizService {
  static Future<List<Question>> fetch() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbwt2bnmO7Z1LrpPFmQI5w8YHQinfZekVbrpVXMUb-bdx4CHT6A/exec';
      var res = await http.get(url);

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        return List<Question>.from(
            data['questions'].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }
    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}
