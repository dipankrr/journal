import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {

  DateTime selectedDate = DateTime.now(); // Private variable to store the counter

  final startDate = DateTime(2010, 1, 1);
  final endDate = DateTime(2040, 12, 31);
  final List<DateTime> dates = [];

  void makeDateList () {
    DateTime currentDate = startDate;
    while (!currentDate.isAfter(endDate)) {
      dates.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }
  }

  int indexOfaDay(DateTime date) {
    int index = dates.indexWhere((d) =>
    d.year == date.year &&
        d.month == date.month &&
        d.day == date.day);
    return index;
  }

  late FixedExtentScrollController controller;


  void scrollToIndex(index) {
    controller.animateToItem(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void setDate(DateTime value) {
    selectedDate = value;
    notifyListeners(); // Notify components that depend on this model
  }

  void getPreviousDate(int index) {
    //selectedDate = selectedDate.subtract(Duration(days: 1));
    scrollToIndex(index-1);
    notifyListeners();
  }

  void getForwardDate() {
   // selectedDate = selectedDate.subtract(Duration(days: 1));
    scrollToIndex(indexOfaDay(selectedDate)+1);
    notifyListeners();
  }

  void resetToCurrentDate(int index) {
    scrollToIndex(index);
    selectedDate = DateTime.now();
    notifyListeners();
  }





}

