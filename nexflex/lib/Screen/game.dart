import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexflex/apikey/api.dart';
import 'package:nexflex/widget/cutomlist.dart';




class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List fullmovies = [];
  Timer? _debounce;
  String searchtext = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fullmovies = allMoviesList;
    searchController.addListener(onsearch);
    //trendingList;
  

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(fullmovies);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Search Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onsearch(),
            controller: searchController,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            decoration: InputDecoration(
              suffixIcon: searchController.text.isEmpty
                  ? Icon(
                      Icons.mic,
                      color: Colors.white,
                    )
                  : IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
              prefix: Icon(
                Icons.search,
                color: Colors.white,
              ),
              fillColor: const Color.fromARGB(255, 141, 136, 136),
              filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),)
             , hintStyle: TextStyle(color: Colors.white),
             hintText: 'search movies,show tv....',
            ),
          ),
          Expanded(child: 
          CustomListView(s: searchController.text,list: allMoviesList,newList: [fullmovies],)
         // Curstom_list(s: searchController.text, list: allMoviesList, newlist: [fullmovies]),

          )
        ],
      ),
    );
  }
  onsearch(){
  setState(() {});
   if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (searchtext != searchController.text) {
        setState(() {
          fullmovies = allMoviesList
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(searchController.text.toString().toLowerCase()))
              .toList();
        });
      }
      searchtext = searchController.text;
    });
}
@override
  void dispose() {
    searchController.removeListener(onsearch);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
