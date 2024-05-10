import 'package:flutter/material.dart';

import 'package:nexflex/apikey/apikey.dart';

import '../Screen/detailed.dart';

// ignore: must_be_immutable
class CustomListView extends StatefulWidget {
  CustomListView(
      {super.key, required this.list, required this.s, required this.newList});

  List list;
  List? newList;
  String s;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
  //  nowPlayingList;
    //topRatedList;
    super.initState();
  }

  Widget build(BuildContext context) {
    //print(nowplaying);
    return Expanded(
      child: (widget.s.isEmpty)
          ? ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.network(
                            imageApi + widget.list[index]['backdrop_path'],
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            widget.list[index]['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.play_circle_outline,color: Colors.white,size: 40,),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                      image: imageApi +
                                          widget.list[index]['backdrop_path'],
                                      title: widget.list[index]['title'],
                                      details: widget.list[index]['overview'],
                                      moviename: widget.list[index]['moviename']),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider()
                        
                      ],
                    ),
                  ),
                );
              },
            )
          : (widget.newList!.isEmpty)
              ? const Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Oops.We haven't got that.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Try searching for another movies",
                    style: TextStyle(color: Colors.grey),
                  )
                ])
              : ListView.builder(
                  itemCount: widget.newList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          apikey + widget.newList![index]['backdrop_path'],
                          fit: BoxFit.cover,
                        ),
                        title: Text(widget.newList![index]['title']),
                        trailing: IconButton(
                          icon: Icon(Icons.play_circle_outline),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  image: apikey +
                                      widget.newList![index]['backdrop_path'],
                                  title: widget.newList![index]['title'],
                                  details: widget.newList![index]['overview'],
                                  moviename: widget.newList![index]
                                      ['moivename'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
