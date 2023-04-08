import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bean/message_bean_entity.dart';
import '../../utils/time_utils.dart';

class TalkNoteMessage extends StatefulWidget {
  final MessageBeanTalk textMessage;
  final String? avatarUrl;

  const TalkNoteMessage(this.textMessage, {Key? key, this.avatarUrl}) : super(key: key);

  @override
  State<TalkNoteMessage> createState() => _TalkNoteMessageState();
}

class _TalkNoteMessageState extends State<TalkNoteMessage> {
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
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 285.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: isMe ? const Color(0xFFCBED9F) : const Color(0xFFDBE7D6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                      child: Column(
                        children: [
                          Text(
                            widget.textMessage.content,
                            style: TextStyle(fontSize: 15.w),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "images/talk_add_note.svg",
                          width: 92.w,
                          height: 30.h,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset("images/talk_listen_book.svg"),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset("images/talk_like.svg"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
