import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/buildBody.dart';

var titel = "Verwaltung und Mitarbeitende";

List<Content> verwaltungchats = [
  Content(
      "Sekretariat AI",
      "Willkommen!",
      "Hier beginnt dein Nachrichtenverlauf mit dem Sekretariat des Fachbereichs Angewandte Informatik der Hochschule Fulda.",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "Student Service Center",
      "Willkommen!",
      "Hier beginnt dein Nachrichtenverlauf mit dem Student Service Center der Hochschule Fulda.",
      DateTime.parse("2020-01-01 20:20:01")),
];

class Verwaltung extends StatefulWidget {
  @override
  _VerwaltungState createState() => _VerwaltungState();
}

class _VerwaltungState extends State<Verwaltung> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(titel: titel, showAdd: true, notifyParent: refresh),
      body: BuildBody(litems: verwaltungchats, titel: titel),
    );
  }
}
