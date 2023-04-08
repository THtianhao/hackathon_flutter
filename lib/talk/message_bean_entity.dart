import 'package:aibook/generated/json/base/json_field.dart';
import 'package:aibook/generated/json/message_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MessageBeanEntity {
	late List<MessageBeanTalk> talk;

	MessageBeanEntity();

	factory MessageBeanEntity.fromJson(Map<String, dynamic> json) => $MessageBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $MessageBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MessageBeanTalk {
	late int role;
	late int type;
	late String content;
	late int time;

	MessageBeanTalk();

	factory MessageBeanTalk.fromJson(Map<String, dynamic> json) => $MessageBeanTalkFromJson(json);

	Map<String, dynamic> toJson() => $MessageBeanTalkToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}