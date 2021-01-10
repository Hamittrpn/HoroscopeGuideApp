import 'package:flutter/material.dart';
import 'package:horoscope_guide_app/horoscope_detail.dart';
import 'package:horoscope_guide_app/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/horoscopeList",
      routes: {
        "/": (context) => HoroscopeList(),
        "/horoscopeList": (context) => HoroscopeList(),
      },
      onGenerateRoute: (settings) {
        List<String> pathItems =
            settings.name.split("/"); //   /horoscopeDetail/Index
        if (pathItems[1] == "horoscopeDetail") {
          return MaterialPageRoute(
              builder: (context) => HoroscopeDetail(int.parse(pathItems[2])));
        }
        return null; 
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(child: Text("Opps, Something went wrong"))),
        );
      },
      title: "Horoscope Guide",
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
