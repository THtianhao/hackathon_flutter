import 'dart:convert';
import 'package:flutter/services.dart';
import '../bean/message_bean_entity.dart';
import '../generated/json/base/json_convert_content.dart';

class FileLoader {
  static Future<Map<String, dynamic>> loadJson(String fileName) async {
    var value = await rootBundle.loadString(fileName);
    return const JsonDecoder().convert(value);
  }

  static Future<List<MessageBeanTalk>?> loadTalkBean(String fileName) async {
    var str = await loadJson(fileName);
    var jsonResult = JsonConvert.fromJsonAsT<MessageBeanEntity>(str);
    if (jsonResult != null) {
      return jsonResult.talk;
    }
    return null;
  }
}
