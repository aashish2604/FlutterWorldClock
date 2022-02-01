import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};  //this stores the data passed from loading in the form of list
  late Color color;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;  //for adding data to list named data
    print(data);

    String daytime = data['daytime'];  //for storing the status of day

    switch(daytime){  //for adjusting the color of the texts according to daytime
      case 'morning.jpg': color = Colors.white;break;
      case 'afternoon.jpg': color = Colors.black;break;
      case 'evening.jpg': color = Colors.black;break;
      case 'night.jpg': color = Colors.white;break;
    }


    return Scaffold(
      body:
         Container( //used for setting the background image
           decoration: BoxDecoration(
             image: DecorationImage(
                image: AssetImage('assets/$daytime'),
              fit: BoxFit.fill,
           ),
           ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(10,180,0,0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(data['time'],
                   style: TextStyle(fontSize: 65, color: color),
                 ),
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [   //data['flag']
                     CircleAvatar(
                       backgroundImage: CachedNetworkImageProvider(data['flag']),
                       radius: 30,
                     ),
                     SizedBox(width: 20),
                     Text(data['location'],
                     style: TextStyle(
                       fontSize: 35,
                       color: color,
                     ),)
                   ],
                 ),
                 SizedBox(height: 30),
                 Center(
                   child: TextButton.icon(onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/');
                     setState(() {
                       data = {
                         'location': result['location'],
                         'time': result['time'],
                         'flag': result['flag'],
                         'daytime': result['daytime'],
                       };
                     });
                   },
                       style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0x43FDFCFC)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                       ),//this shows the method to add custom colors
                       icon: Icon(Icons.location_on,color: color,),
                       label: Text('Choose location',style: TextStyle(color: color,)),
                 ),
                 ),
               ],
             ),
           ),
         ),


    );
  }
}
