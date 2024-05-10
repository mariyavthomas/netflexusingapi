// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeTabbar extends StatefulWidget {
   HomeTabbar({super.key,
  this.first,
  this.second,
  this.third,
  });
 String? first;
 String ? second;
  String ? third;
  @override
  State<HomeTabbar> createState() => _HomeTabbarState();
}

class _HomeTabbarState extends State<HomeTabbar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: [
      Tab(text: '${widget.first}',
      ),
      Tab(
        text: '${widget.second}',
      ),
      (widget.third!=null)?
      Tab(text: '${widget.third}',):SizedBox()
    ],
    labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
    dividerColor: Colors.black,
    unselectedLabelColor: Colors.white,
    indicatorColor: Colors.white,
    isScrollable: true,
    labelColor: Colors.red,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorWeight: 0.5,
    indicator: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      
      
    ),
    indicatorPadding:EdgeInsets.all(5),
    );
  }
}