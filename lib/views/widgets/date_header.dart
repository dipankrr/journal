import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/date_prov.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);
    DateTime date = dateProvider.selectedDate;

    String formattedDate = date.year == DateTime.now().year ?
    DateFormat('d MMM').format(date) : DateFormat("d MMM ''yy").format(date) ;

    return GestureDetector(

        onTap: () async{

          DateTime? date = await showDatePicker(
              context: context,
              firstDate: dateProvider.startDate,
              lastDate: dateProvider.endDate,
              initialDate: dateProvider.selectedDate
          );
          dateProvider.setDate(date!);
          dateProvider.scrollToIndex(dateProvider.indexOfaDay(date));
        },

        onDoubleTap: (){
          dateProvider.resetToCurrentDate();
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
