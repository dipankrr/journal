import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/date_prov.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);
    String formattedDate = DateFormat('d MMM').format(dateProvider.selectedDate);

    return GestureDetector(


        onTap: () async{

          DateTime? date = await showDatePicker(
              context: context,
              firstDate: DateTime(2010),
              lastDate: DateTime(2040),
              initialDate: dateProvider.selectedDate
          );
          dateProvider.setDate(date!);
        },

        onDoubleTap: (){
          dateProvider.resetToCurrentDate(dateProvider.indexOfaDay(dateProvider.selectedDate));
        },

        child: Text(
          formattedDate.toString(),
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white54
          ),)
    );

  }
}
