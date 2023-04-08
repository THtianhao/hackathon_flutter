import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

var globalElevatedButton = ElevatedButtonThemeData(style: globalElevatedStyle);

var globalElevatedStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.h)),
    ),
  ),
  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white38;
    }
    return Colors.white;
  }),
  splashFactory: NoSplash.splashFactory,
  backgroundColor: MaterialStateProperty.all(AppColor.blackButton),
  shadowColor: MaterialStateProperty.all(Colors.transparent),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? null : null;
    },
  ),
);

var greenElevatedStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.h)),
    ),
  ),
  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.black45;
    }
    return Colors.black87;
  }),
  backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
  shadowColor: MaterialStateProperty.all(Colors.transparent),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? null : null;
    },
  ),
);

var defaultElevatedStyle = ButtonStyle(
  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 9.w)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.h)),
    ),
  ),
  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white24;
    }
    return Colors.black87;
  }),
  backgroundColor: MaterialStateProperty.all(AppColor.editBgColor),
  shadowColor: MaterialStateProperty.all(Colors.transparent),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? null : null;
    },
  ),
);

var blackBoardElevatedStyle = ButtonStyle(
  side: const MaterialStatePropertyAll(BorderSide(color: Colors.black26)),
  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white24;
    }
    return Colors.black87;
  }),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shadowColor: MaterialStateProperty.all(Colors.transparent),
);

///钱包、twitter的按钮
var grayBindButtonStyle = defaultElevatedStyle.copyWith(
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
  textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 12.w)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white24;
    }
    return Colors.black87;
  }),
  backgroundColor: const MaterialStatePropertyAll(AppColor.editBgColor),
  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? null : null;
    },
  ),
);

var confirmElevatedStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.h)),
    ),
  ),
  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.black45;
    }
    return Colors.black87;
  }),
  backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
  shadowColor: MaterialStateProperty.all(Colors.transparent),
  overlayColor: MaterialStateProperty.resolveWith(
        (states) {
      return states.contains(MaterialState.pressed) ? null : null;
    },
  ),
);

var primaryBindButtonStyle = grayBindButtonStyle.copyWith(
  backgroundColor: MaterialStatePropertyAll(AppColor.primaryDeepColor.withAlpha(0x20)),
);
