
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nexflex/apikey/api.dart';
import 'package:nexflex/widget/card.dart';
import 'package:nexflex/widget/cutomerslide.dart';
import 'package:nexflex/widget/tabbar.dart';


ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


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
    // print(popularMoviesList);
    // print(allMoviesList);
    // print(trendingList);
    // print(nowPlayingList);
    // print(HttpStatus.accepted);

    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        
      });
    });
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(241, 0, 0, 0),
          leading: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Netflix-new-icon.png/800px-Netflix-new-icon.png'),
          actions: const [Icon(Icons.search)],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ValueListenableBuilder<bool>(
              valueListenable: scrollNotifier,
              builder: (context, isTabBarVisible, _) {
                return isTabBarVisible ?  HomeTabbar(first: 'All Movies',second: 'Tranding',third:'Now Playing' ,) :  SizedBox();
              },
            ),
          ),
        ),
        body:
      
         NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            // print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 130,),
                  Center(
                    child: cardHome(),
                  ),
          
                   CustomSlider(title: "Popular",sliderlist: popularMoviesList),
          
                   CustomSlider(title: "Top 10", sliderlist: topRatedList),
          
                   CustomSlider(title: "Now Playing", sliderlist: nowplayinglist),
          
                   CustomSlider(title: "Top Rated",sliderlist: allMoviesList),
                   
          
          
          
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}