import 'dart:ui';

import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(

          boxShadow: [ BoxShadow(color: Colors.black87, blurRadius: 20, spreadRadius: 2, offset: Offset(0, 2),)]
      ),
      child: Container(
        //  color: Colors.black12,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
            child: Container(
              height: 50, width: MediaQuery.of(context).size.width-32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Colors.white12, Colors.white10, ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                // color: Colors.white10,
                border: Border.all(color: Colors.white10, width: 1),
                // boxShadow: [BoxShadow(color: Colors.black.withOpacity(1.0), blurRadius: 20, spreadRadius: 20)]
                // backgroundBlendMode: BlendMode.dstATop
              ),
              child: Center(child: Text('Bottom Nav Bar')),
            ),
          ),
        ),
      ),
    );
  }
}
