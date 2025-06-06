import 'package:flutter/material.dart';
import 'package:simple_journal/widgets/arrow_button.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Text('21 May', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white54),),
                ),

                Row(
                  children: [
                    ArrowButton(icon: Icons.arrow_back_ios_new_rounded),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ArrowButton(icon: Icons.arrow_forward_ios_rounded),
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
                  border: InputBorder.none
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
