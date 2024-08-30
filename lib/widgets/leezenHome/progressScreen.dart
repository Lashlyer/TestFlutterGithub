


import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  const ProgressScreen({super.key, required this.progress}); 

  final double progress;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 14.4,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),

          Container(
            width: screenWidth * progress,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(124, 207, 253, 1),
              borderRadius: BorderRadius.circular(10.0)
            ),
          )
        ],
      ),
    );
  }
}