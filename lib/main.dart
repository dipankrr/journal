import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_journal/providers/date_prov.dart';
import 'package:simple_journal/views/pages/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'SpaceGrotesk'
        // TODO: change selection text and cursor color

      ),
      home: const Homepage(),
    );
  }
}

// flutter run -d web-server --web-hostname=192.168.0.101 --web-port=8000

// i have implemented this in a vertical bar where date can be selected, now want a feature, i want a circled box on the middle of that bar and which ever date will be fall on the circle that date will be considered as selected date while scrolling. also user can select by tapping avialabe dates beside of that circle and after tapping the date will reposition in the middle where the circle is on top 
