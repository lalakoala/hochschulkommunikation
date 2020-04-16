import 'package:flutter/material.dart';

enum MyThemeKeys {aiai, etet, ltlt, oeoe, pgpg, sksk, swsw, wiwi}

class MyThemes {
  static final ThemeData aitheme = ThemeData(
    primaryColor: ai,
  );
  static final ThemeData ettheme = ThemeData(
    primaryColor: et,
  );
  static final ThemeData lttheme = ThemeData(
    primaryColor: lt,
  );
  static final ThemeData oetheme = ThemeData(
    primaryColor: oe,
  );
  static final ThemeData pgtheme = ThemeData(
    primaryColor: pg,
  );
  static final ThemeData sktheme = ThemeData(
    primaryColor: sk,
  );
  static final ThemeData swtheme = ThemeData(
    primaryColor: sw,
  );
  static final ThemeData witheme = ThemeData(
    primaryColor: wi,
  );


  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.aiai:
        return aitheme;
      case MyThemeKeys.etet:
        return ettheme;
      case MyThemeKeys.ltlt:
        return lttheme;
      case MyThemeKeys.oeoe:
        return oetheme;
      case MyThemeKeys.pgpg:
        return pgtheme;
      case MyThemeKeys.sksk:
        return sktheme;
      case MyThemeKeys.swsw:
        return swtheme;
      case MyThemeKeys.wiwi:
        return witheme;
      default:
        return aitheme;
    }
  }
}

Color ai = const Color(0xFF004a7f);
Color et = const Color(0xFF9cbadc);
Color lt = const Color(0xFF008b95);
Color oe = const Color(0xFFc50077);
Color pg = const Color(0xffe0eee0);
Color sk = const Color(0xffef8300);
Color sw = const Color(0xfff8eb32);
Color wi = const Color(0xff056cae);