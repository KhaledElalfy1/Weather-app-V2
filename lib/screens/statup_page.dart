import 'package:flutter/material.dart';

class IntialScreen extends StatelessWidget {
  const IntialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There's no weather 😔 start",
            style: TextStyle(
              fontSize: 25,
            ),

          ),
          Text('Search Now 🔍',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}