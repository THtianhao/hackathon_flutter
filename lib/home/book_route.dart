import 'package:aibook/utils/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_field_decoration.dart';
import 'common_input.dart';
import 'gradient_button.dart';

class BookRoute extends StatefulWidget {
  const BookRoute({Key? key}) : super(key: key);
  static String routeName = "/BookRoute";

  @override
  State<BookRoute> createState() => _BookRouteState();
}

class _BookRouteState extends State<BookRoute> {
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
          appBar: CommonAppBar("AI Book"),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      BookInput("Title"),
                      SizedBox(height: 24.h),
                      BookInput("Subject"),
                      SizedBox(height: 24.h),
                      BookInput("Language"),
                      SizedBox(height: 24.h),
                      BookInput("Chapter"),
                    ],
                  ),
                ),
                GradientButton("Generate"),
                SizedBox(height: 60.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
