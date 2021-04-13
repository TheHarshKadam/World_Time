import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'India.jpg'),
    WorldTime(url: 'Europe/London', location: 'England', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bang.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Korea', flag: 'south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isMorning': instance.isMorning,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          elevation: 0.0,
          title: Text('Choose The Location'),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
