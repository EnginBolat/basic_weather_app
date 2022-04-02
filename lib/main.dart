import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/util/location.dart';
import 'package:weather_app/widgets/currently_weather.dart';
import 'package:weather_app/widgets/list_properties.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? description;
  String? temp;
  String? humidity;
  String? windSpeed;
  String? location;
  String? main;
  String? country;

  double? positionLatitude;
  double? positionLongitude;

  LocationPer determinePositionn = LocationPer();

  void getCurrentLocation() async {
    Position status = await determinePositionn.determinePosition();
    print(status.latitude);
    print(status.longitude);
    setState(() {
      positionLatitude = status.latitude;
      positionLongitude = status.longitude;
      getResponse(positionLatitude, positionLongitude);
    });
  }

  Future getResponse(double? latitude, double? longitude) async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=YOUR API KEY");
    http.Response response = await http.get(url);
    var results = jsonDecode(response.body);
    setState(() {
      main = results["weather"][0]["main"];
      description = results["weather"][0]["description"];
      temp = (results["main"]["temp"]).toString();
      humidity = (results["main"]["humidity"]).toString();
      windSpeed = (results["wind"]["speed"]).toString();
      location = results["name"];
      country = results["sys"]["country"];
      location = "$location,$country";
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurrentlyWeather(
            location: location,
            temp: temp,
            main: main,
          ),
          ListProperties(
            temp: temp,
            description: description,
            humidity: humidity,
            windSpeed: windSpeed,
          ),
        ],
      ),
    );
  }
}
