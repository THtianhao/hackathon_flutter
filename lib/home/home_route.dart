import 'package:aibook/home/home_tab.dart';
import 'package:aibook/note/note_view.dart';
import 'package:aibook/talk/talk_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);
  static String routeName = "/Home";

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> with SingleTickerProviderStateMixin {
  var tabs = ["对话", "笔记"];
  late TabController tabController = TabController(length: tabs.length, vsync: this);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFEEF6E8)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 44.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          labelPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          controller: tabController,
                          tabs: [HomeTab("对话", _currentIndex == 0), HomeTab("笔记", _currentIndex == 1)],
                          indicator: BoxDecoration(),
                          onTap: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 130.w),
                      GestureDetector(
                        child: SvgPicture.asset("images/more.svg", width: 36.w, height: 36.h),
                        onTap: () {
                          showMaterialModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Image.asset("images/me.png"),
                          );
                        },
                      ),
                      SizedBox(width: 16.w)
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      TalkView(),
                      NoteView(),
                    ],
                  ),
                )
              ],
            ),
            Positioned(right: 0, bottom: 90, child: Image.asset("images/talk_to_note.png",width: 68.w))
          ],
        ),
      ),
    );
  }
}
