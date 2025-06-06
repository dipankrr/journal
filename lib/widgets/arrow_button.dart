import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {

  final IconData icon;

  const ArrowButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30, width: 30,
        decoration: BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.circle,
        ),
    child: Center(child: Icon(icon, color: Colors.white54, size: 18,)),
    );
  }
}

