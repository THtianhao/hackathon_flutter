import 'package:aibook/generated/json/base/json_convert_content.dart';
import 'package:aibook/bean/message_bean_entity.dart';

MessageBeanEntity $MessageBeanEntityFromJson(Map<String, dynamic> json) {
	final MessageBeanEntity messageBeanEntity = MessageBeanEntity();
	final List<MessageBeanTalk>? talk = jsonConvert.convertListNotNull<MessageBeanTalk>(json['talk']);
	if (talk != null) {
		messageBeanEntity.talk = talk;
	}
	return messageBeanEntity;
}

Map<String, dynamic> $MessageBeanEntityToJson(MessageBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['talk'] =  entity.talk.map((v) => v.toJson()).toList();
	return data;
}

MessageBeanTalk $MessageBeanTalkFromJson(Map<String, dynamic> json) {
	final MessageBeanTalk messageBeanTalk = MessageBeanTalk();
	final int? role = jsonConvert.convert<int>(json['role']);
	if (role != null) {
		messageBeanTalk.role = role;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		messageBeanTalk.type = type;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		messageBeanTalk.content = content;
	}
	final int? time = jsonConvert.convert<int>(json['time']);
	if (time != null) {
		messageBeanTalk.time = time;
	}
	return messageBeanTalk;
}

Map<String, dynamic> $MessageBeanTalkToJson(MessageBeanTalk entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['role'] = entity.role;
	data['type'] = entity.type;
	data['content'] = entity.content;
	data['time'] = entity.time;
	return data;
}