import 'package:flutter/material.dart';

class IconHolder extends StatelessWidget {
  final IconData icon;
  const IconHolder({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: 20,
      ),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.grey.shade300),
    );
  }
}
