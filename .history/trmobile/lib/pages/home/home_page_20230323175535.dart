import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color blackColor = const Color.fromARGB(255, 43, 46, 51);
  Color whiteColor = Colors.white;
  bool flag_1 = false;
  bool flag_2 = true;
  bool flag_3 = true;
  bool flag_4 = true;
  bool flag_5 = true;

  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _searchContext = "";

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
                const SizedBox(height: 13),
                conText(context),
                const SizedBox(height: 17),
                bottomNav(),
                floatBtn()
              ],
            )));
  }

  Widget topNavBar() {
    return Container(
      alignment: Alignment.center,
      width: 335,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 43, 46, 51),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: 310,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 43, 46, 51),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_1 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe617,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_1 ? whiteColor : blackColor,
                        ),
                        Text("焦虑星",
                            style: TextStyle(
                                color: flag_1 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = false;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_2 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe612,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_2 ? whiteColor : blackColor,
                        ),
                        Text("倦怠星",
                            style: TextStyle(
                                color: flag_2 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = false;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_3 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe610,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_3 ? whiteColor : blackColor,
                        ),
                        Text("失落星",
                            style: TextStyle(
                                color: flag_3 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = false;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_4 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe615,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_4 ? whiteColor : blackColor,
                        ),
                        Text("不开星",
                            style: TextStyle(
                                color: flag_4 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = false;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_5 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe611,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_5 ? whiteColor : blackColor,
                        ),
                        Text("痛苦星",
                            style: TextStyle(
                                color: flag_5 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar(context) {
    return SizedBox(
      width: 320,
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 255,
            height: 35,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Color.fromARGB(20, 250, 123, 155),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const SizedBox(
                        width: 20,
                        child: Icon(
                          IconData(
                            0xe632,
                            fontFamily: "MyIcons",
                          ),
                          color: Color.fromARGB(200, 53, 53, 53),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        height: 35,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '搜索你感兴趣的东西',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(146, 53, 53, 53),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          //输入后字体
                          style: const TextStyle(
                              color: Color.fromARGB(255, 43, 46, 51),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          cursorColor: const Color.fromARGB(255, 43, 46, 51),
                          // cursorRadius: const Radius.circular(5),
                          cursorHeight: 20,
                          onSaved: (v) => _searchContext = v!,
                        ),
                      )
                    ],
                  )),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 60,
            height: 35,
            child: Container(
              width: 55,
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color.fromARGB(60, 234, 101, 134),
              ),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: const Text(
                  "搜索",
                  style: TextStyle(
                      color: Color.fromARGB(200, 53, 53, 53),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget conText(context) {
    return Container(
      height: 601,
      width: 340,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 80, 80, 80),
            offset: Offset(0.0, 6.0),
            blurRadius: 8,
            spreadRadius: 5,
          )
        ],
        color: Color.fromARGB(230, 255, 255, 255),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10),
            searchBar(context),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Container(
      alignment: Alignment.center,
      width: 340,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 43, 46, 51),
      ),
      child: Row(
        children: [
          Column(),
          Column(),
          Column(),
          Column(),
        ],
      ),
    );
  }

  Widget floatBtn() {
    return const Center();
  }
}
