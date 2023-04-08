import 'package:aibook/home/home_grid_item.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);
  static String routeName = "/Home";

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> with SingleTickerProviderStateMixin {
  var tabs = ["对话", "笔记"];
  late TabController tabController = TabController(length: tabs.length, vsync: this);
  int _currentIndex = 0;

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
          appBar: AppBar(
            centerTitle: true,
            // leading: SvgPicture.asset("images/appbar_back.svg"),
            // actions: getActionByType(context, type: actionType),
            title: const Text(
              "Extension",
              style: TextStyle(fontSize: 20),
            ),
            // titleTextStyle: getTitleStyleByType(type: titleType),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              HomeGridItem(1, "images/home_item_1.png", "AI-Book"),
              HomeGridItem(2, "images/home_item_2.png", "Stable diffusion"),
              HomeGridItem(3, "images/home_item_3.png", "Midjourney"),
              HomeGridItem(4, "images/home_item_4.png", "Summery"),
              HomeGridItem(5, "images/home_item_5.png", "Charmming chat"),
            ],
          ),
        ),
      ),
    );
  }
}
