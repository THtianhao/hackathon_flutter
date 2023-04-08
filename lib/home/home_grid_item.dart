import 'package:aibook/home/aiBook/book_route.dart';
import 'package:aibook/home/home_route.dart';
import 'package:aibook/home/mj/mj_route.dart';
import 'package:aibook/home/sd/sd_route.dart';
import 'package:aibook/home/summery/summery_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGridItem extends StatefulWidget {
  HomeGridItem(this.index, this.picPath, this.picName, {Key? key}) : super(key: key);
  int index;
  String picPath;
  String picName;

  @override
  State<HomeGridItem> createState() => _HomeGridItemState();
}

class _HomeGridItemState extends State<HomeGridItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.index == 1) {
              Navigator.of(context).pushNamed(BookRoute.routeName);
            } else if (widget.index == 2) {
              Navigator.of(context).pushNamed(SDRoute.routeName);
            } else if (widget.index == 3) {
              Navigator.of(context).pushNamed(MJRoute.routeName);
            } else if (widget.index == 4) {
              Navigator.of(context).pushNamed(SummeryRoute.routeName);
            }
          },
          child: Image.asset(widget.picPath, width: 80.w, height: 80.w),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          widget.picName,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 85.w,
          height: 24.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: const LinearGradient(colors: [
              Color(0xff1cfbf9),
              Color(0xffee8eff),
            ]),
          ),
          child: Text(
            "Download",
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
