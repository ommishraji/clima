import 'package:flutter/material.dart';
import 'location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState(){
    super.initState();
    getlocationweather();
  }
  
  void getlocationweather() async{
    Location location = Location();
    try {
      dynamic data = await location.weatherdata();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LocationScreen(data)));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error. Please check your internet connection & restart the app')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(

        // child: SpinKitChasingDots(
        //   color: Colors.white,
        //   size: 100,
        // ),

        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100,
        ),

      ),
    );
  }
}
