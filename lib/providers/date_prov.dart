import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {

  DateTime selectedDate = DateTime.now(); // Private variable to store the counter
  double _weight = 65;

  double get weight => _weight;


  void setDate(DateTime value) {
    selectedDate = value;
    notifyListeners(); // Notify components that depend on this model
  }

  void getPreviousDate() {
    selectedDate = selectedDate.subtract(Duration(days: 1));
    notifyListeners();
  }

  void getForwardDate() {
    selectedDate = selectedDate.add(Duration(days: 1));
    notifyListeners();
  }

  void resetToCurrentDate() {
    selectedDate = DateTime.now();
    notifyListeners();
  }



  void increaseWeight() {
    _weight++;
    notifyListeners();
  }

}