import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void reroute(){
    Navigator.pushReplacementNamed(context, "/loading");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      reroute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton.icon(
              onPressed: (){},
              icon: Icon(
                Icons.access_time,
                color: Colors.blue[700],
                size: 45.0,
              ),
              label: Text(
                "World Time",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
                fontSize: 50.0,
                fontStyle: FontStyle.italic
              ),
          ),
        ),
      ),
    ));
  }
}
