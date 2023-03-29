import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromARGB(255, 253, 183, 200),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 35),
                topNavBar(),
                searchBar(),
                conText(),
                bottomNav(),
                floatBtn()
              ],
            )));
  }

  Widget topNavBar() {
    // return Scrollbar(
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     physics: ClampingScrollPhysics(),
    //     child: Container(
    //       alignment: Alignment.center,
    //       width: 330,
    //       height: 50,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: const Color.fromARGB(255, 43, 46, 51),
    //       ),
    //       child: Text(
    //           "he34567890-234567890-2134567890-1234567890-1234567890-1234567890234567890的法国红酒看来比较降低难度你"),
    //     ),
    //   ),
    // );
    return TabBar(
        tabs: const Tab(text: "ceshi1"),
        Tab(
          text: "学而思",
        ),
        Tab(text: "ijic"),
        Tab(text: "jsojcdi"));
  }

  Widget searchBar() {
    return const Center();
  }

  Widget conText() {
    return const Center();
  }

  Widget bottomNav() {
    return const Center();
  }

  Widget floatBtn() {
    return const Center();
  }
}
