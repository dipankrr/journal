import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/date_prov.dart';

class ArrowButton extends StatelessWidget {

  final IconData icon;
  final GestureTapCallback onTap;

  const ArrowButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);

    return
      GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30, width: 30,
          decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.circle,
          ),
      child: Center(child: Icon(icon, color: Colors.white54, size: 18,)),
      ),
    );
  }
}

