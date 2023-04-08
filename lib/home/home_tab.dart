import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  HomeTab(this.title, this.isSelect, {Key? key}) : super(key: key);
  String title;
  bool isSelect;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 25.sp, fontWeight: widget.isSelect ? FontWeight.w900 : FontWeight.w400),
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}
