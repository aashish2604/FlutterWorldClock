import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //Stores location of the place whose time is required
  late String time; //Stores the time of the location
  String flag; //For getting the icon of the country flag
  String url; //For the part of the url for the respective country
  late String daytime;

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async{

    //make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    //storing data from the map into strings
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime +' '+ offset);

    //creating a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(now); //set the time property

    if(now.hour>=5 && now.hour<=12)
      daytime = 'morning.jpg';
    else if(now.hour>=12 && now.hour<=17)
      daytime = 'afternoon.jpg';
    else if(now.hour>=17 && now.hour<=19)
      daytime = 'evening.jpg';
    else
      daytime = 'night.jpg';

  }

}