import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {

  DateProvider() {
    _makeDateList();
    controller = FixedExtentScrollController(
      initialItem: indexOfaDay(DateTime.now()),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // ✅ Clean it up here
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();// Private variable to store the counter

  final startDate = DateTime(2010, 1, 1);
  final endDate = DateTime(2040, 12, 31);
  final List<DateTime> dates = [];

  void _makeDateList () {
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
    notifyListeners();
  }

  void setDate(DateTime value) {
    selectedDate = value;
  //  scrollToIndex(indexOfaDay(selectedDate));
    notifyListeners(); // Notify components that depend on this model
  }

  void getPreviousDate() {
    final index = indexOfaDay(selectedDate); // get current index internally
    if (index > 0) {
      selectedDate = dates[index - 1];
      scrollToIndex(index - 1);
      notifyListeners();
    }
  }

  void getForwardDate() {
    final index = indexOfaDay(selectedDate); // get current index internally
    if (index > 0) {
      selectedDate = dates[index + 1];
      scrollToIndex(index + 1);
      notifyListeners();
    }
  }

  void resetToCurrentDate() {
    selectedDate = DateTime.now();
    scrollToIndex(indexOfaDay(selectedDate));

    notifyListeners();
  }





}

