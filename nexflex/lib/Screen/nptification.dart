import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text("Notification",style: TextStyle(color: Colors.white),),
        actions: const [
          Icon(Icons.search,color: Colors.white),SizedBox(width: 15,),
          Icon(Icons.menu,color: Colors.white)
        ],
      ),

      body: Column(
        children: [
          ListTile(
            leading:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAc90SkhrvGShpVLofZ7JElM7t-DNwDxgs5A&usqp=CAU') ,
            title:const Text("Now available",style: TextStyle(color: Colors.white),), 
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Season 6",style: TextStyle(color: Colors.white)),
                Text("3 Jan",style: TextStyle(color: Colors.white))
              ],
            ),
          onTap:() {},
          ),const SizedBox(height: 15,),
          ListTile(
            leading:Image.network('https://m.media-amazon.com/images/M/MV5BOTAzODMxYzYtMmJiOC00NDRhLTgwMDYtMDdhZmMwNmVkZjk1XkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_.jpg') ,
            title:const Text("New Arrival",style: TextStyle(color: Colors.white),), 
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shaolin Soccer",style: TextStyle(color: Colors.white)),
                Text("16/12/2023",style: TextStyle(color: Colors.white))
              ],
            ),
            onTap:() {},
          ),const SizedBox(height: 15,),
          ListTile(
            leading:Image.network('https://m.media-amazon.com/images/M/MV5BOTAzODMxYzYtMmJiOC00NDRhLTgwMDYtMDdhZmMwNmVkZjk1XkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_.jpg') ,
            title:const Text("New Arrival",style: TextStyle(color: Colors.white)), 
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Japan",style: TextStyle(color: Colors.white)),
                Text("15/12/2023",style: TextStyle(color: Colors.white))
              ],
            ),
          onTap:() {},
          ),
        ],
      ),
    );
  }
}