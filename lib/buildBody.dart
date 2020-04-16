import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/mail.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:intl/intl.dart';

class BuildBody extends StatefulWidget {
  final List<Content> litems;
  final String titel;
  BuildBody({@required this.litems, @required this.titel});

  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    return ((widget.litems != null) || (widget.litems.length < 1))                         // Wird nur geladen, wenn überhaupt Chatverläufe in dieser Kategorie vorhanden sind
        ? Container(
            child: ListView.separated(
              padding: const EdgeInsets.all(7),
              itemCount: widget.litems.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Dismissible(
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog<bool>(                                     // Dialog zur Bestätigung, ob Chatverlauf gelöscht werden soll
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                              "Möchten sie den Nachrichtenverlauf mit " + widget.litems[index].name + " löschen?",
                              style: TextStyle(fontSize: fontSizeMain)),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "ja",
                                style: TextStyle(fontSize: fontSizeMain),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "abbrechen",
                                style: TextStyle(fontSize: fontSizeMain + 4)),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (DismissDirection direction) {
                      widget.litems.removeAt(index);
                    },
                    key: Key(widget.litems[index].name),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>                         // öffnet Mail-Unterseite mit entsprechendem Inhalt
                                Mail(content: widget.litems[index])));
                      },
                      leading: Container(
                        child: widget.titel == "Studenten"
                            ? Icon(Icons.school)
                            : (widget.titel == "Gremien"
                                ? Icon(Icons.category)
                                : (widget.titel == "Professoren und Lehrbeauftragte"
                                    ? Icon(Icons.business_center)
                                    : Icon(Icons.business))),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(                                                              // Row enthält Absender und Datum
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  widget.litems[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSizeMain,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  DateFormat("dd.MM.yyyy").format(widget.litems[index].date).toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontSize: fontSizeMain - 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              child: (widget.litems[index].headline != null)
                                  ? Text(
                                      widget.litems[index].headline,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSizeMain,
                                      ),
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                    )
                                  : SizedBox.shrink()),                       // Wenn es keine Überschrift gibt, soll auch kein Platzhalter vorhanden sein
                          Container(
                            child: (widget.litems[index].text != null)
                                ? Text(
                                    widget.litems[index].text,
                                    overflow: TextOverflow.fade,
                                    maxLines:
                                        (widget.litems[index].headline != null)   // Wenn es keine Überschrift gibt, können zwei Zeilen Vorschau für die Nachricht angegeben werden
                                            ? 1
                                            : 2,
                                    softWrap: false,
                                    style: TextStyle(fontSize: fontSizeMain),
                                  )
                                : Text(
                                    "Noch kein Chat mit diesem Kontakt",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: fontSizeMain,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (buildContext, int index) => const Divider(),
            ),
          )
        : Container(
            child: Text(
                "Sie haben noch keine Nachrichtenverläufe in dieser Kategorie"),
          );
  }
}
