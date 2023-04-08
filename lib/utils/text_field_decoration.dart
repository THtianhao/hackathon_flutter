import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

InputDecoration emptyInputDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,

  /// 这两行是配置文字高度的代码
  isDense: true,
  contentPadding: EdgeInsets.symmetric(vertical: 18.h),
  hintStyle: const TextStyle(color: Color(0xFF999999)),
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  // prefixIconConstraints: BoxConstraints.tightFor(width: 48.w, height: 24.w),
  // suffixIconConstraints: BoxConstraints.tightFor(width: 40.w, height: 20.w),
);

InputDecoration sendInputDecoration = InputDecoration(
  suffixIcon: Align(heightFactor: 0.5, child: SvgPicture.asset("images/send_message_icon.svg")),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
  hintStyle: const TextStyle(color: Color(0xFF999999)),
  fillColor: const Color(0xB47CBA).withAlpha(5),
);

InputDecoration homeListDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.black87, width: 2.w)),
);
