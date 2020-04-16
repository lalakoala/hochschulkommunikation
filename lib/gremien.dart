import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/buildBody.dart';

var titel = "Gremien";

List<Content> gremienchats = [
  Content(
      "AstA",
      "Willkommen!",
      "Hier beginnt dein Nachrichtenverlauf mit dem AstA der Hochschule Fulda. Wenn du Anliegen oder Probleme hast, kannst du jederzeit in unsere Sitzung jeden Mittwoch ab 15:15 im AstA Gebäude kommen",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "FSR AI",
      "Willkommen!",
      "Hier beginnt dein Nachrichtenverlauf mit dem Fachschaftsrat Angewandte Informatik der Hochschule Fulda. Wenn du Anliegen oder Probleme hast, kannst du jederzeit in unsere Sitzung jeden Mittwoch ab 15:15 im AstA Gebäude kommen",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "StuPa",
      "Willkommen!",
      "Hier beginnt dein Nachrichtenverlauf mit dem Studierenden Parlament der Hochschule Fulda.",
      DateTime.parse("2020-01-01 20:20:01")),
];

class Gremien extends StatefulWidget {
  @override
  _GremienState createState() => _GremienState();
}

class _GremienState extends State<Gremien> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(titel: titel, showAdd: true, notifyParent: refresh),
      body: BuildBody(litems: gremienchats, titel: titel),
    );
  }
}
