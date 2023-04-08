import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/common_appbar.dart';
import '../common_input.dart';
import '../gradient_button.dart';

class MJRoute extends StatefulWidget {
  const MJRoute({Key? key}) : super(key: key);
  static String routeName = "/MJRoute";


  @override
  State<MJRoute> createState() => _MJRouteState();
}

class _MJRouteState extends State<MJRoute> {
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
          appBar: CommonAppBar("Midjourney"),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    CommonInput("Prompt",(value){}),
                  ],
                ),
              ),
              GradientButton("Generate",(){

              }),
              SizedBox(height: 60.h,),
            ],
          ),
        ),
      ),
    );
  }
}
