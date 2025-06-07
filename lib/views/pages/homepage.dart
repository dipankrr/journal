import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/views/main_body.dart';
import 'package:simple_journal/providers/date_prov.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 400,
          width: MediaQuery.of(context).size.width - 20,
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
                          IconButton(onPressed: () async {
                           DateTime? date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2040),
                                initialDate: dateProvider.selectedDate
                            );

                             dateProvider.setDate(date!);
                          }, icon: Icon(Icons.calendar_today)),
                          
                         // ListWheelScrollView(itemExtent: itemExtent, children: children)
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
