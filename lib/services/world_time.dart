import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String time, location, flag, url;
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
      Response response = await get('https://api.ipgeolocation.io/timezone?apiKey=8eaaac62609e4adc8972896d21e27b44&tz=$url');
      Map data = jsonDecode(response.body);
      String datetime = data['date_time_ymd'];
      int offset = data['timezone_offset'];

      DateTime now = DateTime.parse(datetime);
      now  = now.add(Duration(hours: offset));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      //set time property
      time = DateFormat.jm().format(now);

    }
  }
