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
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: 330,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 43, 46, 51),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                child: SizedBox(
                    width: 100,
                    height: 40,
                    child: TextButton(
                      child: Padding(padding: EdgeInsets.all(10)),
                    )),
              ),
              Container(
                child: Text("66666666669"),
              ),
              Container(
                child: Text("999999999999999999999"),
              ),
              Container(
                child: Text("77777777777777"),
              ),
              Container(
                child: Text("999999999999999999999"),
              ),
            ],
          ),
        ),
      ),
    );
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
