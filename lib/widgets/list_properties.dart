import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/components/custom_listtile_widget.dart';

class ListProperties extends StatelessWidget {
  const ListProperties({
    Key? key,
    required this.temp,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  }) : super(key: key);

  final String? temp;
  final String? description;
  final String? humidity;
  final String? windSpeed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CustomListTileWidget(
            property: temp,
            message: "$temp\u00B0",
            // ignore: deprecated_member_use
            fontAwesomeIcon: FontAwesomeIcons.thermometerHalf,
            desc: "Temperature",
          ),
          CustomListTileWidget(
            property: description,
            message: "$description",
            fontAwesomeIcon: FontAwesomeIcons.cloud,
            desc: "Weather",
          ),
          CustomListTileWidget(
            property: humidity,
            message: "$humidity",
            fontAwesomeIcon: FontAwesomeIcons.sun,
            desc: "TemperaHumidityture",
          ),
          CustomListTileWidget(
            property: windSpeed,
            message: "$windSpeed",
            fontAwesomeIcon: FontAwesomeIcons.wind,
            desc: "Wind Speed",
          ),
        ],
      ),
    );
  }
}
