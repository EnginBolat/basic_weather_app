import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget(
      {Key? key,
      required this.property,
      required this.fontAwesomeIcon,
      required this.desc,
      required this.message})
      : super(key: key);

  final String? desc;
  final String? property;
  final String? message;
  final IconData? fontAwesomeIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(fontAwesomeIcon),
      title: Text("$desc"),
      trailing: Text(
        property == null ? "Loading..." : "$message",
      ),
    );
  }
}
