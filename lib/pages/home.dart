import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? "day.jpg" : "night.jpeg";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 140.0, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, "/location");
                setState(() {
                  data = {
                    "time": result['time'],
                    "location": result["location"],
                    "isDayTime": result["isDayTime"],
                    "flag": result["flag"]
                  };
                });
              },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                  ),
                  color: Colors.blue,
                  label: Text(
                      "Choose Location",
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                  )),
              SizedBox(height: 20.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   data['location'],
                   style: TextStyle(
                     fontSize: 28,
                     letterSpacing: 2.0,
                     color: Colors.white,
                   ),
                 ),
               ],
             ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
