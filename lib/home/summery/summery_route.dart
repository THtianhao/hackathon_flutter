import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../talk/chat/talk_text_message.dart';
import '../../talk/message_bean_entity.dart';
import '../../utils/common_appbar.dart';
import '../../utils/file_loader.dart';

class SummeryRoute extends StatefulWidget {
  const SummeryRoute({Key? key}) : super(key: key);
  static String routeName = "/SummeryRoute";

  @override
  State<SummeryRoute> createState() => _SummeryRouteState();
}

class _SummeryRouteState extends State<SummeryRoute> {
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
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CommonAppBar("AI Summery"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
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
                    const SizedBox(height: 20),
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
                              default:
                                return const Text("Error happen");
                            }
                          },
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 30),
                        child: Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(

                                  color: const Color(0xB47CBA).withAlpha(15),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextField(
                                  focusNode: _focusNode,
                                  textInputAction: TextInputAction.send,
                                  minLines: 1,
                                  maxLines: 5,
                                  controller: _inputController,
                                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  cursorColor: Colors.black87,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.only(left: 10,top: 12,right: 10),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintStyle: const TextStyle(color: Color(0xFF999999)),
                                    fillColor: const Color(0xFF999999).withAlpha(5),
                                    hintText: "Please Input Message",
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
                                child: Image.asset(
                                  "images/talk_send.png",
                                  height: 50.w,
                                  width: 50.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clickSubmit() {}
}
