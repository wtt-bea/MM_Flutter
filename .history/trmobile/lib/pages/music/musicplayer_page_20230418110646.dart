import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final musicName;
  const MusicPlayer({super.key, required this.musicName});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: _blackColor),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          _topBackBar(),
        ]),
      ),
    );
  }

  Widget _topBackBar() {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 25, color: _whiteColor),
          )
        ],
      ),
    );
  }
}
