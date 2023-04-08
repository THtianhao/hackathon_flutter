import 'package:aibook/home/aiBook/book_route.dart';
import 'package:aibook/home/home_route.dart';
import 'package:aibook/home/mj_route.dart';
import 'package:aibook/home/sd/sd_route.dart';
import 'package:aibook/home/summery_route.dart';
import 'package:aibook/talk/talk_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (cxt) => TalkProvider()), //共享数据1
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: globalNavigatorKey,
          title: 'AiNote',
          theme: ThemeData(
            canvasColor: Colors.white,
            //大部分的组件的背景
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent,
            //第一点击颜色
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            //第二点击色
            primaryColor: const Color(0xFF45F488),
            focusColor: Colors.black87,
          ),
          home: const HomeRoute(),
          routes: {
            SDRoute.routeName: (context) => const SDRoute(),
            MJRoute.routeName: (context) => const MJRoute(),
            BookRoute.routeName: (context) => const BookRoute(),
            SummeryRoute.routeName: (context) => const SummeryRoute(),
          },
        );
      },
    );
  }
}
