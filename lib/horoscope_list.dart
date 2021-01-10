import "package:flutter/material.dart";
import 'package:horoscope_guide_app/models/horoscope.dart';
import 'package:horoscope_guide_app/utils/strings.dart';

class HoroscopeList extends StatelessWidget {
  List<Horoscope> horoscopes;
  @override
  Widget build(BuildContext context) {
    horoscopes = getData();

    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope Guide"),
      ),
      body: getListData(),
    );
  }

  List<Horoscope> getData() {
    List<Horoscope> horoscopes = [];

    for (var i = 0; i < 12; i++) {
      String smallImage =
          Strings.HoroscopeName[i].toLowerCase() + "${i + 1}.png";
      String largelImage =
          Strings.HoroscopeName[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Horoscope horoscope = Horoscope(
          Strings.HoroscopeName[i],
          Strings.HoroscopeDate[i],
          Strings.HoroscopeGeneralFeatures[i],
          smallImage,
          largelImage);

      horoscopes.add(horoscope);
    }

    return horoscopes;
  }

  Widget getListData() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return getListItemData(context, index);
      },
      itemCount: horoscopes.length,
    );
  }

  Widget getListItemData(BuildContext context, int index) {
    Horoscope horoscopeListItem = horoscopes[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 2, 6),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/horoscopeDetail/$index"),
          leading: Image.asset(
              "lib/images/" + horoscopeListItem.horoscopeSmallImage,
              width: 64,
              height: 64),
          title: Text(
            horoscopeListItem.horoscopeName,
            style: TextStyle(
                color: Colors.pink.shade500, fontWeight: FontWeight.w400),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              horoscopeListItem.horoscopeDate,
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.w700),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),
        ),
      ),
    );
  }
}
