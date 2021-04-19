import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isMorning;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      print('Getting Response...');
      Response response =
          await get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(0, 3);
        String offset_mnt = data['utc_offset'].substring(4, 6);

        DateTime now = DateTime.parse(datetime);
        now = now.add(
            Duration(hours: int.parse(offset), minutes: int.parse(offset_mnt)));
        isMorning = now.hour > 6 && now.hour < 20 ? true : false;

        time = DateFormat.jm().format(now);
      } else {
        isMorning = false;
        throw Exception('Error at the moment');
      }
    } catch (e) {
      print("Error occured: $e");
      time = "Cannot Display Time Due to Error Occured";
    }
  }
}
