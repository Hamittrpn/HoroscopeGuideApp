class Horoscope {
  String _horoscopeName;
  String _horoscopeDate;
  String _horoscopeDetail;
  String _horoscopeSmallImage;
  String _horoscopeLargeImage;
  String get horoscopeName => _horoscopeName;

  set horoscopeName(String value) => _horoscopeName = value;

  String get horoscopeDate => _horoscopeDate;

  set horoscopeDate(String value) => _horoscopeDate = value;

  String get horoscopeDetail => _horoscopeDetail;

  set horoscopeDetail(String value) => _horoscopeDetail = value;

  String get horoscopeSmallImage => _horoscopeSmallImage;

  set horoscopeSmallImage(String value) => _horoscopeSmallImage = value;

  String get horoscopeLargeImage => _horoscopeLargeImage;

  set horoscopeLargeImage(String value) => _horoscopeLargeImage = value;

  Horoscope(
    this._horoscopeName,
    this._horoscopeDate,
    this._horoscopeDetail,
    this._horoscopeSmallImage,
    this._horoscopeLargeImage,
  );
}
