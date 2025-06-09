import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/providers/date_prov.dart';

class DateBar extends StatefulWidget {
  const DateBar({super.key});

  @override
  State<DateBar> createState() => _DateBarState();
}

class _DateBarState extends State<DateBar> {

  //late FixedExtentScrollController _controller;

  // final startDate = DateTime(2010, 1, 1);
  // final endDate = DateTime(2040, 12, 31);
  // final List<DateTime> dates = [];
  //
  // void makeDateList () {
  //   DateTime currentDate = startDate;
  //   while (!currentDate.isAfter(endDate)) {
  //     dates.add(currentDate);
  //     currentDate = currentDate.add(Duration(days: 1));
  //   }
  // }
  //
  // int indexOfaDay(DateTime date) {
  //   int index = dates.indexWhere((d) =>
  //       d.year == date.year &&
  //       d.month == date.month &&
  //       d.day == date.day);
  //   return index;
  // }


  @override
  void initState() {
    super.initState();
    // final dateProvider = Provider.of<DateProvider>(context, listen: false);
    // dateProvider.makeDateList();
    // dateProvider.controller = FixedExtentScrollController(initialItem: dateProvider.indexOfaDay(DateTime.now()));
  }


  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);
    // makeDateList();
    //final List<String> dates = List.generate(31, (index) => 'Day ${index + 1}');


    return ListWheelScrollView.useDelegate(
      controller: dateProvider.controller,
      itemExtent: 50,
      physics: FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {

          dateProvider.setDate(dateProvider.dates[index]);
         // print('');
      },
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          if (index < 0 || index >= dateProvider.dates.length) return null;

          final isSelected = index == dateProvider.indexOfaDay(dateProvider.selectedDate);

          return GestureDetector(
            onTap: () => dateProvider.scrollToIndex(index),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                dateProvider.dates[index].day.toString(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
