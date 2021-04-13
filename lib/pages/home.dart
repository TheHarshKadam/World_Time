import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImg = data['isMorning'] ? 'Day.jpeg' : 'Night.jpeg';
    Color colors = data['isMorning'] ? Colors.blue[50] : Colors.blueGrey[800];

    return Scaffold(
      backgroundColor: colors,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic output =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': output['time'],
                        'flag': output['flag'],
                        'location':output['location'],
                        'isMorning':output['isMorning'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[100],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 75.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
