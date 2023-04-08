import 'package:aibook/net/metis_server.dart';
import 'package:aibook/utils/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_input.dart';
import '../gradient_button.dart';

class BookRoute extends StatefulWidget {
  const BookRoute({Key? key}) : super(key: key);
  static String routeName = "/BookRoute";

  @override
  State<BookRoute> createState() => _BookRouteState();
}

class _BookRouteState extends State<BookRoute> {
  var title = "";
  var topic = "";
  var language = "";
  var chapter_count = 0;

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
                      CommonInput("Title", (value) {
                        setState(() {
                          title = value;
                        });
                      }),
                      SizedBox(height: 24.h),
                      CommonInput("Subject", (value) {
                        topic = value;
                      }),
                      SizedBox(height: 24.h),
                      CommonInput("Language", (value) {
                        language = value;
                      }),
                      SizedBox(height: 24.h),
                      CommonInput("Chapter", (value) {
                        chapter_count = int.parse(value);
                      }),
                    ],
                  ),
                ),
                GradientButton("Generate", () async {
                  var post = {
                    "title": title,
                    "topic": topic,
                    "language": language,
                    "chapter_count": chapter_count,
                    "sub_chapter_count": 5,
                  };
                  var resutl = await MetisServer().post('/book/generate', post);
                  // var resutl = await MetisServer().post('/pinecone/query', {"query_str":"ss"});
                  // var resutl = await MetisServer().get('/');
                  print(resutl);
                }),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
