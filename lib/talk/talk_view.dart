import 'package:aibook/bean/message_bean_entity.dart';
import 'package:aibook/talk/chat/talk_add_message.dart';
import 'package:aibook/talk/chat/talk_note_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/file_loader.dart';
import 'chat/talk_text_message.dart';

class TalkView extends StatefulWidget {
  const TalkView({Key? key}) : super(key: key);

  @override
  State<TalkView> createState() => _TalkViewState();
}

class _TalkViewState extends State<TalkView> with AutomaticKeepAliveClientMixin {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();
  var _historyMessageList = <MessageBeanTalk>[];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    var result = await FileLoader.loadTalkBean("jsons/aaa.json");
    if (result != null) {
      setState(() {
        _historyMessageList = result.reversed.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Image.asset("images/talk_load_book.png"),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(height: 0.5.h),
                decoration: const BoxDecoration(color: Color(0X0F000000)),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    key: const PageStorageKey<String>('chatMessage'),
                    controller: _scrollController,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: _historyMessageList.length,
                    itemBuilder: (context, index) {
                      switch (_historyMessageList[index].type) {
                        case 1:
                          return TalkTextMessage(_historyMessageList[index]);
                        case 2:
                          return TalkAddMessage(_historyMessageList[index]);
                        case 3:
                          return TalkNoteMessage(_historyMessageList[index]);
                          break;
                        // case ZIMMessageType.image:
                        //   break;
                        // case ZIMMessageType.video:
                        //   break;
                        default:
                          return const Text("Error happen");
                      }
                    },
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 8.h, bottom: 8.h),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28.h), color: Colors.white),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 8.h, right: 8.h, bottom: 8.h),
                            child: TextField(
                              focusNode: _focusNode,
                              textInputAction: TextInputAction.send,
                              minLines: 1,
                              maxLines: 5,
                              controller: _inputController,
                              style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (text) {
                                if (text.length > 1200) {
                                  var finalText = text.substring(0, 1200);
                                  _inputController.value = TextEditingValue(
                                      text: finalText,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(affinity: TextAffinity.downstream, offset: finalText.length),
                                      ));
                                }
                              },
                              onSubmitted: (value) {
                                clickSubmit();
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            clickSubmit();
                          },
                          child: Container(
                            constraints: BoxConstraints.tightFor(width: 32 + 10.w, height: 32 + 5.w),
                            padding: EdgeInsets.only(bottom: 5.h, right: 10.w),
                            child: SvgPicture.asset("images/talk_send_icon.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  void clickSubmit() {}
}
