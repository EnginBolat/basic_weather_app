import 'package:flutter/material.dart';
import 'package:weather_app/components/custom_text_widget.dart';

class CurrentlyWeather extends StatelessWidget {
  const CurrentlyWeather({
    Key? key,
    required this.location,
    required this.temp,
    required this.main,
  }) : super(key: key);

  final String? location;
  final String? temp;
  final String? main;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).copyWith().primaryColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              message: "Currenty $location",
              property: location,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            CustomTextWidget(
              message: "$temp\u00B0",
              property: temp,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 10),
            CustomTextWidget(
              message: "$main",
              property: main,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Text(temp == null ? "Loading..." : "$temp derece"),