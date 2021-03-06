
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime()async {
    WorldTime instance = WorldTime(location: 'Kolkata',flag: 'http://www.all-flags-world.com/country-flag/India/flag-india-XL.jpg', url:'Asia/Kolkata' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'daytime': instance.daytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('World Clock',
                style: TextStyle(color: Colors.white, fontSize: 65),
              ),
              SizedBox(height: 20),
              SpinKitWave(
                color: Colors.white,
                size: 80.0,
              ),
            ],
          ),
      )
    );
  }

}
