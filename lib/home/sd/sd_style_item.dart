import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SDStyleItem extends StatefulWidget {
  SDStyleItem(this.title, this.picPath, this.index, this.currentIndex, {Key? key}) : super(key: key);
  String title;
  String picPath;
  int index;
  int currentIndex;

  @override
  State<SDStyleItem> createState() => _SDStyleItemState();
}

class _SDStyleItemState extends State<SDStyleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88.w,
      height: 88.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.w)),
        border: widget.index == widget.currentIndex ? Border.all(color: Color(0xFF1CFBF9), width: 2) : null,
      ),
      child: Stack(
        children: [
          Container(constraints: BoxConstraints.expand(), child: Image.asset(widget.picPath)),
          Positioned(
            bottom: 0,
            child: Container(
                constraints: BoxConstraints.expand(height: 25.h, width: 100.w),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
