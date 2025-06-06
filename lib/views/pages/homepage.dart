import 'package:flutter/material.dart';
import 'package:simple_journal/views/main_body.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
