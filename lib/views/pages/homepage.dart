import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/views/main_body.dart';
import 'package:simple_journal/providers/date_prov.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    //print(mediaWidth);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: mediaHeight - 400,
          width: min(mediaWidth * 0.9, 700),

          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: double.infinity,
                      color: Colors.white10,
                      child: Column(
                        children: [
                          
                         //ListWheelScrollView(itemExtent: itemExtent, children: children)
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 6,
                  child: MainBody()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
