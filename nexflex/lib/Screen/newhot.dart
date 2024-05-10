import 'package:flutter/material.dart';

import 'package:nexflex/Screen/home.dart';
import 'package:nexflex/apikey/api.dart';
import 'package:nexflex/widget/tabbar.dart';

import '../widget/commingsoon.dart';
import '../widget/cutomergired.dart';

class NewsHotScreen extends StatefulWidget {
  const NewsHotScreen({super.key});

  @override
  State<NewsHotScreen> createState() => _NewsHotScreenState();
}

class _NewsHotScreenState extends State<NewsHotScreen> {
  @override
  void initState() {
    popularMoviesList;
    topRatedList;
    super.initState();
  }
  Widget build(BuildContext context) {
    print(popularMoviesList);
   // print(trendingList);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'News & Hot',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: ValueListenableBuilder(
                  valueListenable: scrollNotifier,
                  builder: (context, isTabBarVisible, _) {
                    return isTabBarVisible
                        ? HomeTabbar(
                            first: 'Comming Soon🍿',
                            second: 'Most Watching🔥',
                          )
                        : SizedBox(
                        
                        );
                  }),
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: CustomCommingSoon(
              gridList: popularMoviesList,
            )),
            SingleChildScrollView(
                child: CustomGrid(
              gridList: topRatedList,
            ))
          ])),
    );
  }
}