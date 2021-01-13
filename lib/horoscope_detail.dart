import "package:flutter/material.dart";
import 'package:horoscope_guide_app/horoscope_list.dart';
import 'package:horoscope_guide_app/models/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  int selectedIndex;
  HoroscopeDetail(this.selectedIndex);

  @override
  _HoroscopeDetailState createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Horoscope selectedHoroscope;
  Color toolbarColor;
  Color bodyColor;
  Color textColor;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    selectedHoroscope = HoroscopeList.horoscopes[widget.selectedIndex];
    findDominantColor();
  }

  void findDominantColor() {
    Future<PaletteGenerator> palette = PaletteGenerator.fromImageProvider(
        AssetImage("lib/images/" + selectedHoroscope.horoscopeLargeImage));
    palette.then((value) {
      paletteGenerator = value;
      setState(() {
        toolbarColor = paletteGenerator.dominantColor.color;
        bodyColor = paletteGenerator.mutedColor.color;
        textColor = paletteGenerator.darkVibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: toolbarColor != null ? toolbarColor : Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "lib/images/" + selectedHoroscope.horoscopeLargeImage,
                fit: BoxFit.cover,
              ),
            ),
            title:
                Text(selectedHoroscope.horoscopeName + "Burcu ve Özellikleri"),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: bodyColor != null ? bodyColor : Colors.white,
              child: SingleChildScrollView(
                child: Text(
                  selectedHoroscope.horoscopeDetail,
                  style: TextStyle(fontSize: 18, color: textColor != null ? textColor : Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
