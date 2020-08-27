import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    try{
      WorldTime instance = WorldTime(location: "Lagos", flag: "nigeria.png", url: "Africa/Lagos");
      await instance.getTime();
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "location": instance.location,
        "time": instance.time,
        "flag": instance.flag,
        "isDayTime": instance.isDayTime
      });
    }
    catch(e){
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitPouringHourglass(
            color: Colors.white,
            size: 50.0
          ),
        ),
      )
    );
  }
}
