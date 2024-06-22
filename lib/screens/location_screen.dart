import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'location.dart';
import 'city_screen.dart';


class LocationScreen extends StatefulWidget {

  LocationScreen(this.weatherdata);
  var weatherdata;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String icon;
  late String cityname;
  late String message;
  late String humidity;
  late String wind;

  @override
  void initState() {
    super.initState();
    dynamic data = widget.weatherdata;
    updateUI(data);
  }

  void updateUI(dynamic data){
    setState(() {
      WeatherModel wm = WeatherModel();
      double tempo = data['main']['temp'];
      temperature = tempo.toInt();
      var condition = data['weather'][0]['id'];
      icon = wm.getWeatherIcon(condition);
      message = wm.getMessage(temperature);
      cityname = data['name'];
      humidity = data['main']['humidity'].toString();
      wind = data['wind']['speed'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      Location lo = Location();
                      var weatherdata = await lo.weatherdata();
                      updateUI(weatherdata);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                     String cityName = await Navigator.push(context,
                         MaterialPageRoute(builder: (context) => CityScreen()));
                     if(cityName != null) {
                       Location lo = Location();
                       try {
                         var weatherdata = await lo.locationweather(cityName);
                         updateUI(weatherdata);
                       }
                       catch(e){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
                       }
                     }
                    },
                    child: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:  <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                         Text(
                          icon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    Text('Humidity - $humidity',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30
                      ),
                    ),
                    Text('Wind speed - $wind',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message$cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
