import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CommonAppBar(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset("images/appbar_back.svg"),
      // actions: getActionByType(context, type: actionType),
      title: Text(title ?? ""),
      centerTitle: true,
      // titleTextStyle: getTitleStyleByType(type: titleType),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.w);
}
