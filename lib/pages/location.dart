// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> location = [
    WorldTime(location: 'London', flag: 'http://www.all-flags-world.com/country-flag/England/flag-england-XL.jpg', url: 'Europe/London'),
    WorldTime(location: 'Kolkata', flag: 'http://www.all-flags-world.com/country-flag/India/flag-india-XL.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York', flag: 'http://www.all-flags-world.com/country-flag/USA/flag-usa-XL.jpg', url: 'America/New_York'),
    WorldTime(location: 'Moscow', flag: 'http://www.all-flags-world.com/country-flag/Russia/flag-russia-XL.jpg', url: 'Europe/Moscow'),
    WorldTime(location: 'Tokyo', flag: 'http://www.all-flags-world.com/country-flag/Japan/flag-japan-XL.jpg', url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', flag: 'http://www.all-flags-world.com/country-flag/Australia/flag-australia-XL.jpg', url: 'Australia/Sydney'),
    WorldTime(location: 'Berlin', flag: 'http://www.all-flags-world.com/country-flag/Germany/flag-germany-XL.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Dubai', flag: 'https://libertyflagandbanner.com/wp-content/uploads/2015/08/saudi-arabia-flag.jpg', url: 'Asia/Dubai'),
    WorldTime(location: 'Nairobi', flag: 'https://symondsflags.com/wp-content/uploads/2014/09/kenya-flag.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Bogota', flag: 'http://www.all-flags-world.com/country-flag/Colombia/flag-colombia-XL.jpg', url: 'America/Bogota'),
  ];

  void updateTime(index) async{
    WorldTime instance = location[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'daytime': instance.daytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.cyan, child: Text('Choose Location')),
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(location[index].location),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(location[index].flag),
                    ),
                  ),
                ),
              );
          }
      ),
    );
  }
}
