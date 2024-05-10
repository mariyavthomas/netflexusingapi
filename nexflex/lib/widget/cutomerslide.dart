import 'package:flutter/material.dart';
import 'package:nexflex/Screen/detailed.dart';
import 'package:nexflex/apikey/apikey.dart';
import 'package:nexflex/constant.dart';

class CustomSlider extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> sliderlist;

  CustomSlider({Key? key, required this.title, required this.sliderlist})
      : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 13,
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: widget.sliderlist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (details) => DetailsPage(
                        moviename: widget.sliderlist[index]['title'],
                        image: imageApi + widget.sliderlist[index]['poster_path'],
                        title: widget.title,
                        details: widget.sliderlist[index]['overview'],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 150, // Adjust height as needed
                      width: 150, // Adjust width as needed
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        imageApi +( widget.sliderlist[index]['poster_path'] ??''),
                        
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
