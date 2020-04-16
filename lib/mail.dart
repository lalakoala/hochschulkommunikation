import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:intl/intl.dart';

var _controller = TextEditingController();
final regEx = new RegExp("^_[^ ].*_.*");  // muss mit _ starten, dann kein Leerzeichen, dann egal welche Zeichen, dann ein Unterstrich und dann wieder beliebig viele beliebige Zeichen

List<Content> litems = [
  Content ("me", "Überschrift","testnachricht 1", DateTime.parse("2020-01-01 20:20:01")),
  Content ("name", null,"testnachricht 2", DateTime.parse("2020-01-01 20:20:01")),
  Content ("me", null, "testnachricht 3 Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,", DateTime.parse("2020-01-01 20:20:01")),
  Content ("name", "blause Überschrift", "testnachricht 4 Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,", DateTime.parse("2020-01-01 20:20:01")),
  Content ("me", null, "testnachricht 5", DateTime.parse("2020-01-02 20:20:01")),
  Content ("me", null, "testnachricht 6", DateTime.parse("2020-01-01 20:20:01")),
  Content ("me",null, "testnachricht 7", DateTime.parse("2020-01-01 11:24:01")),
  Content ("me",null, "testnachricht 8", DateTime.parse("2020-05-01 20:20:01")),
  Content ("me", null, "testnachricht 9", DateTime.parse("2019-01-01 20:20:01")),
  Content ("me", null, "testnachricht 10", DateTime.parse("2020-01-01 20:20:01")),
];

class Mail extends StatefulWidget {
  final Content content;
  Mail({Key key, @required this.content}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.content.name),
        actions: <Widget>[
        ],
        //Text(content.headline),
      ),
      body: Column(
        children: <Widget>[
          Visibility(
            visible: (litems != null) ? true : false,
            child: Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                reverse: true,
                itemCount: litems.length,
                itemBuilder: (context, index) {
                  if (litems[index].name == "me") {                         // Je nach Schreiber der Nachricht hat diese ein anderes Layout
                    return Container(
                      margin: const EdgeInsets.only(left: 50, top: 10, right: 10),
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
                      decoration: new BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(7.0),
                            bottomLeft: Radius.circular(7.0),
                            bottomRight: Radius.circular(7.0)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: (litems[index].headline != null)                         // Wenn es keine Überschrift gibt, wird auch kein Platzhalter o.Ä angezeigt
                                  ? Text(litems[index].headline, style: TextStyle(fontSize: fontSizeMain, fontWeight: FontWeight.bold))
                                  : SizedBox.shrink()
                          ),
                          Text(
                            litems[index].text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: fontSizeMain,
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(DateFormat("HH:mm").format(litems[index].date).toString(),))
                        ],
                      ),
                    );
                  }
                  else {
                    return Container(
                      margin: const EdgeInsets.only(left: 10, top: 10, right: 50),
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
                      decoration: new BoxDecoration(
                    //    color: Colors.green,
                        color: Theme.of(context).accentColor,
                        borderRadius: new BorderRadius.only(
                            topRight: Radius.circular(7.0),
                            bottomRight: Radius.circular(7.0),
                            bottomLeft: Radius.circular(7.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: litems[index].headline != null
                                  ? Text(litems[index].headline, style: TextStyle(fontSize: fontSizeMain, fontWeight: FontWeight.bold))
                                  : SizedBox.shrink()
                          ),
                          Text(
                            litems[index].text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: fontSizeMain,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              DateFormat("HH:mm").format(litems[index].date).toString(),
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    );
                  } // else
                } // itemBuilder
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Antworten... [Tipp: Umschließe den Satzanfang mit Unterstrichen, um einen Betreff zu schreiben]",
                hintStyle: TextStyle(
                  fontSize: fontSizeMain,
                ),
                hintMaxLines: 3,
                filled: true,
                suffixIcon: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom != 0,     // wenn die Tastatur ausgeblendet ist, sieht man den x-Knopf nicht im Textfeld
                  child: IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.grey,
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
              ),
              onSubmitted: (text) {
                if (text != "") {
                  setState(() {
                    if(regEx.hasMatch(text)) {          // wenn der Text zur RegEx Abfrage am Anfang passt, wird er so zerschnitten, dass es einen Betreff und einen normalen Text gibt
                      int endIndex;
                      for (int i = 0, count = 0; i < text.length; i++) {
                        if (count == 2) {
                          endIndex = i - 1;
                          break;
                        }
                        else if (text[i] == "_") {
                          count++;
                        }
                      }
                      print(endIndex);
                      litems.insert(0, Content("me", text.substring(1, endIndex), text.substring(endIndex + 2, text.length), DateTime.now()));
                    } else {
                      litems.insert(0, Content("me", null, text, DateTime.now()));}
                  });
                }
                _controller.clear();
              },
            ),
          ),
        ],
      )
    );
  }
}
