import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../message_bean_entity.dart';
import '../../utils/time_utils.dart';

class TalkTextMessage extends StatefulWidget {
  final MessageBeanTalk textMessage;
  final String? avatarUrl;

  const TalkTextMessage(this.textMessage, {Key? key, this.avatarUrl}) : super(key: key);

  @override
  State<TalkTextMessage> createState() => _TalkTextMessageState();
}

class _TalkTextMessageState extends State<TalkTextMessage> {
  get isMe => widget.textMessage.role == 1;

  get showTime => TimeUtils.diffNow(widget.textMessage.time) > const Duration(minutes: 10);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 40.w, width: 40.w),
                child: Image.asset(isMe ? "images/me_avatar.png" : "images/ai_avatar.png"),
              ),
              SizedBox(width: 8.w),
              Container(
                constraints: BoxConstraints(maxWidth: 220.w),
                decoration: BoxDecoration(
                  borderRadius: isMe
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(2),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                  color: isMe ? const Color(0xFF1CFBF9) : const Color(0xFFFFFF).withAlpha(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                  child: Text(
                    widget.textMessage.content,
                    style: TextStyle(fontSize: 15.w, color: isMe ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
