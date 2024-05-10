import 'package:flutter/material.dart';
import 'package:nexflex/apikey/api.dart';
import 'package:nexflex/bottam/bottamnav.dart';

class Screensplash extends StatefulWidget {
  const Screensplash({super.key});

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  @override
  void initState() {
    getPopularMovies();
    getAllmovies();
    getToprated();
    nowPlaying();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (home) => Mybottamnavi(),
          ),
          (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://i.pinimg.com/originals/f6/b1/1b/f6b11bd53411d94338117381cf9a9b9b.gif')
          ],
        ),
      ),
    );
  }
}
