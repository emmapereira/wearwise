import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "My profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff865537)),
          ),
        ),
      ],
    );
  }
}
