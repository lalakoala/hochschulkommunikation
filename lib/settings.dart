import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/themes.dart';
import 'package:hochschulkommunikation/CustomTheme.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => buildFachbereichDialog());
                },
                child: Text(
                  "Fachbereich ändern",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: fontSizeMain),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: RaisedButton(
                  child: Text(
                    "Schriftgröße ändern",
                    style: TextStyle(fontSize: fontSizeMain),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Schriftgröße ändern"),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioButtonGroup(
                                    labels: <String>[
                                      "sehr klein",
                                      "klein",
                                      "normal",
                                      "groß",
                                      "sehr groß",
                                    ],
                                    onSelected: (String selected) => {
                                      //habe versucht das zu verschönern, irgendwie funktionieren hier aber weder switch case, noch kann ich in den if-Statements nur die Variable ändern und dann im Nachhinein einmal setState aufrufen um die neue Variable anzuwenden
                                      if (selected == "sehr klein")
                                        setState(() {
                                          fontSizeMain = 12;
                                        })
                                      else if (selected == "klein")
                                        setState(() {
                                          fontSizeMain = 14;
                                        })
                                      else if (selected == "normal")
                                        setState(() {
                                          fontSizeMain = 16;
                                        })
                                      else if (selected == "groß")
                                        setState(() {
                                          fontSizeMain = 18;
                                        })
                                      else if (selected == "sehr groß")
                                        setState(() {
                                          fontSizeMain = 20;
                                        })
                                    }, //onSelected
                                  ),
                                ]),
                          );
                        });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Wer darf meine E-Mail Adresse finden?",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSizeMain - 1,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            RadioButtonGroup(
              labelStyle: TextStyle(
                fontSize: fontSizeMain,
              ),
              labels: <String>[
                "Alle",
                "Personen in meinem Fachbereich",
                "Personen in meinem Studiengang",
                "Personen in meinem Semester",
                "Personen mit einem gleichen Kurs",
                "Niemand",
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFachbereichDialog() {
    return new AlertDialog(
      title: Text(
        "Fachbereich ändern",
        style: TextStyle(fontSize: fontSizeMain),
      ),
      contentPadding: EdgeInsets.all(10),
      content: Column(
        // in Column, da Alert Dialog sonst über komplette Höhe geht
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: RadioButtonGroup(
              onSelected: (String selected) => setState(() {
                switch (selected) {
                  case "AI":
                    {_changeTheme(context, MyThemeKeys.aiai);}
                    break;
                  case "ET":
                    {_changeTheme(context, MyThemeKeys.etet);}
                    break;
                  case "LT":
                    {_changeTheme(context, MyThemeKeys.ltlt);}
                    break;
                  case "OE":
                    {_changeTheme(context, MyThemeKeys.oeoe);}
                    break;
                  case "PG":
                    {_changeTheme(context, MyThemeKeys.pgpg);}
                    break;
                  case "SK":
                    {_changeTheme(context, MyThemeKeys.sksk);}
                    break;
                  case "SW":
                    {_changeTheme(context, MyThemeKeys.swsw);}
                    break;
                  case "WI":
                    {_changeTheme(context, MyThemeKeys.wiwi);}
                    break;
                }
              }),
              labels: <String>[
                "AI",
                "ET",
                "LT",
                "OE",
                "PG",
                "SK",
                "SW",
                "WI",
              ],
            ),
          ),
        ],
      ),
    );
  }
}
