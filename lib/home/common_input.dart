import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonInput extends StatefulWidget {
  CommonInput(this.hint, {Key? key}) : super(key: key);
  String hint;

  @override
  State<CommonInput> createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xB47CBA).withAlpha(15),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.h), borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
          hintStyle: const TextStyle(color: Color(0xFF999999)),
          fillColor: const Color(0xFF999999).withAlpha(5),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
