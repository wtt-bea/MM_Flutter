import 'package:flutter/material.dart';

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
    return Container(
        child: Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: 330,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 43, 46, 51),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: flag_1 ? blackColor : whiteColor,
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe540,
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: flag_2 ? blackColor : whiteColor,
                  ),
                  child: Container(
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: flag_3 ? blackColor : whiteColor,
                  ),
                  child: Container(
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: flag_4 ? blackColor : whiteColor,
                  ),
                  child: Container(
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    backgroundColor: flag_5 ? blackColor : whiteColor,
                  ),
                  child: Container(
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
    ));
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
