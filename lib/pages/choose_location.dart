import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: "Cairo", flag: "assets/flags/egypt.jpg", url: "Africa/Egypy"),
    WorldTime(location: "Lagos", flag: "assets/flags/nigeria.png", url: "Africa/Lagos"),
    WorldTime(location: "Istanbul", flag: "assets/flags/turkey.png", url: "Europe/Istanbul"),
  ];

  void updateTime(index) async{
    WorldTime instance  = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Choose a Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:  (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
              ),
            ),
          );
    },
      )
    );
  }
}
