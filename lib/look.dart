import 'package:flutter/material.dart';

/*  how to make a specific item in the middle, like in a building  a date picker bar so the current date should always be in middle when starting 

    i have implemented this in a vertical bar where date can be selected, now want a feature, i want a circled box on the middle of that bar and which
    ever date will be fall on the circle that date will be considered as selected date while scrolling. also user can select by tapping avialabe dates
    beside of that circle and after tapping the date will reposition in the middle where the circle is on top 
*/


void main() => runApp(MaterialApp(home: CircleDatePicker()));

class CircleDatePicker extends StatefulWidget {
  @override
  _CircleDatePickerState createState() => _CircleDatePickerState();
}

class _CircleDatePickerState extends State<CircleDatePicker> {
  final List<String> dates = List.generate(31, (index) => 'Day ${index + 1}');
  late FixedExtentScrollController _controller;
  int selectedIndex = DateTime.now().day - 1;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: selectedIndex);
  }

  void scrollToIndex(int index) {
    _controller.animateToItem(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Date Picker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 50,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      if (index < 0 || index >= dates.length) return null;

                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () => scrollToIndex(index),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            dates[index],
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
                ),
              ),

              // 🎯 Overlay Circle for the Selected Date
              IgnorePointer(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Selected: ${dates[selectedIndex]}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
