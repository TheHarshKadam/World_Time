import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void setTime() async {
    WorldTime instance =
        WorldTime(location: 'India', flag: 'img.jpg', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isMorning' : instance.isMorning,
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: SpinKitPulse(
           color: Colors.white,
           size: 50.0,
        ),
      ),
    );
  }
}
