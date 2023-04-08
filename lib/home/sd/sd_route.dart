import 'package:aibook/home/sd/sd_style_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/common_appbar.dart';
import '../common_input.dart';
import '../gradient_button.dart';

class SDRoute extends StatefulWidget {
  const SDRoute({Key? key}) : super(key: key);
  static String routeName = "/SDRoute";

  @override
  State<SDRoute> createState() => _SDRouteState();
}

class _SDRouteState extends State<SDRoute> {
  var gridList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];
  var picPathList = [
    "images/home_item_2.png",
    "images/home_item_2.png",
    "images/home_item_2.png",
    "images/home_item_2.png",
    "images/home_item_2.png",
    "images/home_item_2.png",
  ];
  var currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CommonAppBar("Stable diffustion"),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                CommonInput("Prompt"),
                SizedBox(height: 24.h),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行显示几个
                      childAspectRatio: 1 / 1, //宽高比
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: gridList.length, //item的个数
                    itemBuilder: (BuildContext context, int index) {
                      //自定义的行 代码在下面
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: SDStyleItem(gridList[index], picPathList[index], index, currentIndex),
                      );
                    },
                  ),
                ),
                GradientButton("Generate"),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
