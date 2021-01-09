import 'package:flutter/material.dart';
import 'package:horoscope_guide_app/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Horoscope Guide",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HoroscopeList(),
    );
  }
}
