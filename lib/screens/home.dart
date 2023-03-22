import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Today's outfit",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff865537)),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              child: Text('You are wearing these items:'),
            ),
          ),
        ),
      ],
    );
  }
}
