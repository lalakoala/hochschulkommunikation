import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/buildBody.dart';

List<Content> studentchats = [
  Content("Max Muster", "test", "test", DateTime.parse("2020-01-01 20:20:01")),
  Content("Maria Muster", null, "Lorem Ipsum",
      DateTime.parse("2020-01-01 20:20:01")),
  Content("Friedrich Fertig", "test", "test",
      DateTime.parse("2020-01-01 20:20:01")),
  Content("Andrea Bernadette Caprisonne Dalmeier Fenster Grashalm", "test", "test",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "Max Weber",
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      "test",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "Karla Kolumna",
      "test",
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.",
      DateTime.parse("2020-01-01 20:20:01")),
  Content("Benjamin Blümchen", "test", "test",
      DateTime.parse("2020-01-01 20:20:01")),
  Content(
      "Karl Kloster", "test", "test", DateTime.parse("2020-01-01 20:20:01")),
];

var titel = "Studenten";

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(titel: titel, showAdd: true, notifyParent: refresh),
      body: BuildBody(
        litems: studentchats,
        titel: titel,
      ),
    );
  }
}
