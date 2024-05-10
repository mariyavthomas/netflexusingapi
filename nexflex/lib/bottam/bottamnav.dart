// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:nexflex/Screen/home.dart';
import 'package:nexflex/Screen/mynetflix.dart';

import '../Screen/game.dart';
import '../Screen/newhot.dart';

class Mybottamnavi extends StatefulWidget {
  const Mybottamnavi({super.key});

  @override
  State<Mybottamnavi> createState() => _MybottamnaviState();
}

class _MybottamnaviState extends State<Mybottamnavi> {
  
  @override
  int indexnum=0;
  @override
  
  List Screen=[
    
    HomePage(),
    GameScreen(),
    NewsHotScreen(),
    MyNetflixPage()

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen.elementAt(indexnum),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
       items: [
        BottomNavigationBarItem(icon: InkResponse(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Icon(Icons.home_outlined),
        ),
        label: 'Home'
        ) ,
        BottomNavigationBarItem(icon: InkResponse(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Icon(Icons.sports_esports_outlined),
        ),
        label: 'Game'),
        BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: "News & hot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "My Netflix"),
       ],
       currentIndex: indexnum,
       showSelectedLabels: true,
       iconSize: 30,
       showUnselectedLabels: true,
       selectedItemColor:Color.fromARGB(255, 255, 255, 255),
       unselectedItemColor:  Color.fromARGB(255, 161, 151, 151),
       onTap: (int index){
        setState(() {
          indexnum=index;
        });
       },

      ),
    );
  }
}