import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/components/CirclesBackground.dart';
import 'package:simple_journal/components/custom_navbar.dart';
import 'package:simple_journal/views/date_bar.dart';
import 'package:simple_journal/views/main_body.dart';
import 'package:simple_journal/providers/date_prov.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    // final List<String> dates = List.generate(31, (index) => ' $index');
    // int todayIndex = DateTime.now().day - 1;
    // FixedExtentScrollController controller =
    //     FixedExtentScrollController(initialItem: todayIndex);

    //print(mediaWidth);

    return Scaffold(

       // resizeToAvoidBottomInset: true,

      body: Stack(
        children: [
          CirclesHomeWidget(),

          // IgnorePointer(
          //   ignoring: true,
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.1),
          //     ),
          //   ),
          // ),

          Center(
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            Column(
                                children: [
                                  Expanded(child: DateBar(),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 6, child: MainBody()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

            floatingActionButton: keyboardHeight > 0 ? null : CustomNavbar()
    );
  }
}
