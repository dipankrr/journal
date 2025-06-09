import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/providers/date_prov.dart';
import 'package:simple_journal/views/widgets/date_header.dart';


import '../components/arrow_button.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);

    return SizedBox(
      height: double.infinity,
      child: Card(
        //color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateHeader()
                ),

                Row(
                  children: [
                    ArrowButton(icon: Icons.arrow_back_ios_new_rounded,onTap: (){dateProvider.getPreviousDate(dateProvider.indexOfaDay(dateProvider.selectedDate));}),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ArrowButton(icon: Icons.arrow_forward_ios_rounded, onTap: (){dateProvider.getForwardDate();},),
                    ),
                  ],
                )
              ],
            ),

            Expanded(
              child: TextFormField(
                expands: true,
                maxLines: null,
                maxLength: null,
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.white24,

                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white24,
                      fontWeight: FontWeight.bold
                  ),
                    hintText: 'Start writing your thoughts....'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//how to get all the dates in a list, like in showDatePicker i can choose starting date to ending date, i want all those dates in a list. i am making a scrolling bar to chose a date, there will be only dates
