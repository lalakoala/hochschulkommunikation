import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/students.dart';
import 'package:hochschulkommunikation/gremien.dart';
import 'package:hochschulkommunikation/dozenten.dart';
import 'package:hochschulkommunikation/verwaltung.dart';
import 'package:hochschulkommunikation/news.dart';
import 'package:hochschulkommunikation/settings.dart';

double fontSizeMain = 16;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Students(),
    Gremien(),
    Dozenten(),
    Verwaltung(),
    News(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Studenten'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Gremien'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.business_center), title: Text('Dozenten')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Verwaltung')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.announcement), title: Text('News'))
        ],
        type: BottomNavigationBarType.fixed,
//        unselectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void onTabTapped(int index) {
    // BottomNavigationBar Navigator
    setState(() {
      _currentIndex = index;
    });
  }
}

class Content {
  final String name;
  final String headline;
  final String text;
  final DateTime date;
  Content(this.name, this.headline, this.text, this.date);
//  Content(String name, String headline, String text, String date) {
//    this.name = name; this.headline = headline; this.text = text; this.date = date;
//  }
}

List<String> dozenten = [
  "Birgit Bomsdorf",
  "Ulrich Bühler",
  "Christian Fischer",
  "Alexander Gepperth",
  "Markus Gölthenboth",
  "Paul Grimm",
  "Martine Herpers",
  "Yvonne Jung",
  "Norbert Ketterer",
  "Karim Khakzar",
  "Frank Klingert",
  "Johannes Konert",
  "Jörg Kreiker",
  "Martin Kumm",
  "Jan-Torsten Milde",
  "Peter Peinl",
  "Sebastian Rieger",
  "Christoph Scheich",
  "Tim Süß",
  "Rainer Todtenhöfer",
  "Annika Wagner",
  "Volker Warschburger",
  "Michael Weba",
  "Werner Winzerling"
];

List<String> studierende = [
  "Sheldon Cooper",
  "Penny",
  "Rajesh Koothrappali",
  "Leonard Hofstadter"
];

List<String> verwaltung = [
  "Merete Hirth",
  "Birgit Kremer",
  "Lisa Wiegand",
];

List<String> gremien = [
  "test",
];

class BuildAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function() notifyParent;
  final String titel;
  final bool showAdd;

  BuildAppBar(
      {Key key,
      @required this.titel,
      @required this.showAdd,
      @required this.notifyParent})
      : super(key: key);

  @override
  _BuildAppBarState createState() => _BuildAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          "${widget.titel}",
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(fontSize: fontSizeMain + 4),
        ),
        actions: <Widget>[
          Visibility(
            visible: widget.showAdd,
            child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: Text("${widget.titel}  hinzufügen",
                          style: TextStyle(fontSize: fontSizeMain + 4),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(

                                decoration: InputDecoration(
                                  hintText: "E-Mail",
                                  hintStyle: TextStyle(fontSize: fontSizeMain),
                                ),
                              ),
                            ),
                            BuildContainer(titel: widget.titel, notifyParent: widget.notifyParent, currPage: "Studenten")
                          ],
                        ),
                        actions: <Widget>[],
                      ),
                    );
                  },
                  child: Icon(Icons.person_add),
                )),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Icon(Icons.settings),
              )),
        ]);
  }
}

class BuildContainer extends StatefulWidget {
  final String titel;
  final Function() notifyParent;
  final currPage;

  BuildContainer({
    @required this.titel,
    @required this.notifyParent,
    @required this.currPage
});

  @override
  _BuildContainerState createState() => _BuildContainerState();
}

class _BuildContainerState extends State<BuildContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
     // height: (MediaQuery.of(context).viewInsets.bottom != 0) ? 50 : 400, // (funktioniert nicht, weil es das ja nur einmal überprüft und nicht fortlaufend. SetState ist hier nicht anwendbar)
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: widget.titel == "Studenten"
            ? studierende.length
            : (widget.titel == "Gremien"
            ? gremien.length
            : (widget.titel ==
            "Professoren und Lehrbeauftragte"
            ? dozenten.length
            : verwaltung.length)),
        itemBuilder: (buildContext, int index) {
          return Container(
            // padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    (widget.titel == "Studenten")
                    // ignore: unnecessary_statements
                        ? {
                      studentchats.insert(0, Content(studierende[index], null, null, DateTime.now())),
                      studierende.removeAt(index),
                      Navigator.pop(context)
                    }
                    // ignore: unnecessary_statements
                        : (widget.titel == "Gremien"
                        ? {gremienchats.insert(0, Content(gremien[index], null, null, DateTime.now())),
                      gremien.removeAt(index),
                      Navigator.pop(context)
                    }
                        : (widget.titel == "Professoren und Lehrbeauftragte"
                        ? {dozentenchats.insert(0, Content(dozenten[index], null, null, DateTime.now())),
                      dozenten.removeAt(index),
                      Navigator.pop(context)
                    }
                        : {verwaltungchats.insert(0, Content(verwaltung[index], null, null, DateTime.now())),
                      verwaltung.removeAt(index),
                      Navigator.pop(context)
                    }));
                    widget.notifyParent();
                  },
                ),
                Text(
                  widget.titel == "Studenten"
                      ? studierende[index]
                      : (widget.titel == "Gremien"
                      ? gremien[index]
                      : (widget.titel ==
                      "Professoren und Lehrbeauftragte"
                      ? dozenten[index]
                      : verwaltung[index])),
                  style: TextStyle(fontSize: fontSizeMain),
                ),
              ],
            ),
          );
        }, //itemBuilder
      ),
    );
  }
}
