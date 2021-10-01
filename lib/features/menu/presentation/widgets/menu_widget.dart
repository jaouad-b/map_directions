import 'package:demo/features/calendar/presentation/pages/calandar.dart';
import 'package:demo/features/route_search/presentation/pages/route_search_page.dart';
import 'package:flutter/material.dart';




Widget calendarSection(BuildContext context){
  final double heightMax =  MediaQuery.of(context).size.height;
  return Container(
    height:heightMax * 0.30,
    width: double.infinity,
    margin: EdgeInsets.all(heightMax*0.05),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.green,
    ),

    child: IconButton(
      icon: Image.asset('images/calendar_office_day_1474.png'),
      iconSize : 50,
      onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const CalandarPage()),
    );
      },

      ),
      );
}


Widget routeSearchSection(BuildContext context){
  final double heightMax =  MediaQuery.of(context).size.height;
  return Container(
    height:  heightMax * 0.30,
    width: double.infinity,
    margin: EdgeInsets.all(heightMax * 0.05),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.yellow,
    
    ),
    child: IconButton(
      padding: const EdgeInsets.all(20),
      icon: Image.asset('images/route_icon_129308.png'),
      onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const MapPage()),
    );        
      },

    ),
      );
}