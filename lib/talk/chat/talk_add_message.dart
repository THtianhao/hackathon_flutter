import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bean/message_bean_entity.dart';
import '../../utils/button_style.dart';
import '../../utils/time_utils.dart';

class TalkAddMessage extends StatefulWidget {
  final MessageBeanTalk textMessage;
  final String? avatarUrl;

  const TalkAddMessage(this.textMessage, {Key? key, this.avatarUrl}) : super(key: key);

  @override
  State<TalkAddMessage> createState() => _TalkAddMessageState();
}

class _TalkAddMessageState extends State<TalkAddMessage> {
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
          if (showTime)
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                TimeUtils.convertTime2diffString(widget.textMessage.time),
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
          Row(
            textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 40.w, width: 40.w),
                child: Image.asset(isMe ? "images/talk_avatar_me.png" : "images/talk_avatar_ai.png"),
              ),
              SizedBox(width: 8.w),
              Container(
                constraints: BoxConstraints(maxWidth: 285.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: isMe ? const Color(0xFFCBED9F) : const Color(0xFFDBE7D6),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.textMessage.content,
                        style: TextStyle(fontSize: 15.w),
                      ),
                      SizedBox(height: 11.h),
                      SvgPicture.asset("images/talk_delimiter.svg"),
                      SizedBox(height: 11.h),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: defaultElevatedStyle,
                            child: const Text("大纲梳理"),
                          ),
                          SizedBox(width: 8.w),
                          ElevatedButton(
                            onPressed: () {},
                            style: defaultElevatedStyle,
                            child: const Text("全文总结"),
                          ),
                          SizedBox(width: 8.w),
                          ElevatedButton(
                            onPressed: () {},
                            style: defaultElevatedStyle,
                            child: const Text("核心内容提炼"),
                          ),
                        ],
                      )
                    ],
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