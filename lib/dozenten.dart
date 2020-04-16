import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/buildBody.dart';

var titel = "Professoren und Lehrbeauftragte";

List<Content> dozentenchats = [
  Content("Dozent", "Betreff", "hallo", DateTime.now())
];

class Dozenten extends StatefulWidget {
  @override
  _DozentenState createState() => _DozentenState();
}

class _DozentenState extends State<Dozenten> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(titel: titel, showAdd: true, notifyParent: refresh),
      body: BuildBody(litems: dozentenchats, titel: titel),
    );
  }
}
