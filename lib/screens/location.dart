import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/networking.dart' as net;

const apikey = "b4e428669344f60b71d8413ca082a4a5";
const apiurl = "https://api.openweathermap.org/data/2.5/weather";

class Location{

  Future<dynamic> locationweather(String cityName) async{
    var url = "$apiurl?q=$cityName&appid=$apikey&units=metric";
    net.network Network = net.network(url);
    var weatherdata = await Network.getdata();
    if(weatherdata == null)
      throw Exception('This city name does not exist');
    else
    return weatherdata;
  }

  late double longitude;
  late double latitude;

Future<void> currentlocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
  } catch(e){
    print(e);
  }
}
Future weatherdata() async {
  await currentlocation();
  net.network Network = net.network('$apiurl?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
  var data = await Network.getdata();
  return data;
}
}