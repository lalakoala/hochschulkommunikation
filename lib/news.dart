import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/home_widget.dart';

var titel = "Ankündigungen";

class NewsContent {
  final String tag;
  final String headline;
  final String author;
  final String date;
  final String text;
  NewsContent(this.tag, this.headline, this.author, this.date, this.text);
}

List<NewsContent> litems = [
  NewsContent(
      "FSR AI",
      "Studierende gesucht",
      "Fachschaftsrat FB-AI",
      "07.04.2020",
      "Sehr geehrte Studierende,\nEs werden noch Mitglieder für die QSL-Vergabekommision (Qualität Studium Lehre) gesucht.\n3 feste Teilnehmer, 3 Vertreter.\nWas ist die QSL?\nEs gibt die Möglichkeit Anträge zur Verbesserung des Studiums/ der Lehre zu stellen. Diese können von Professoren und Studenten gestellt werden. In den Sitzungen wird mit den Studenten und Professoren, die Teil dieser Kommission sind, darüber entschieden wie Sinnig dieser Antrag ist.\nEbenso wird noch nach einem Vertreter für den Prüfungsausschuss Master AI gesucht.\nDieser springt ersatzweise ein, wenn der Prüfungsausschuss tagt, und das feste Mitglied nicht kann. Dort wird nach bestem Gewissen z.B. entschieden ob fachfremde Module angerechnet werden können, eine Verlängerung der Frist für die Bachelor Thesis gewährt werden kann etc.\nFür jeweils beide könnt ihr bei Interesse eine E-Mail an fsr@ai.hs-fulda.org schicken."),
  NewsContent(
      "JOB",
      "Tutoren für Datenbankenvorlesung für DM gesucht",
      "Lisa Malkmus",
      "07.04.2020",
      "Falls Sie sich nun mit Datenmodellierung, relationaler Algebra und SQL sicher fühlen (ich nehme mal an, dass Sie etwa eine 1.7 in der Klausur geschafft haben), dann würde ich gerne von Ihnen bzgl. einer Tutorstelle hören.\nIch lese im Sommersemester Datenbanken fuer DM <https://elearning.hs-fulda.de/ai/mod/glossary/showentry.php?eid=615&displayformat=dictionary> und bräuchte dort 2 Tutoren, um z.B. Übungsaufgaben zu koordinieren und korrigieren / Studenten zu helfen. Aufwand sind etwa 10 Stunden im Monat und wird natürlich bezahlt. Bitte melden Sie sich alsbald moeglich. Ich denke, dass das eine interessante Gelegenheit ist, falls Sie sich für Daten / Backend / Serversysteme interessieren und um dort vertiefte Erfahrungen zu erlangen.\nGruss,\nProf. Dr. C.M.A Scheich"),
  NewsContent("JOB", "Tutor gesucht", "Jenny Petlewski", "03.04.2020",
      "Sehr geehrte Studierende,\nzur Durchführung meiner Lehraktivitäten insbesondere im Online-Betrieb\nbenötige ich entsprechende Unterstützung.\nAktuell steht eine Tutorenstelle mit bis zu 30 Stunden pro Monat zur Verfügung. Wenn Sie interessiert sind, wenden Sie sich bitte mit Angaben zu Ihrer Person an mich unter\n u.buehler@informatik.hs-fulda.de.\nWegen der Covid-19-Thematik wird Ihre Arbeit zunächst vollständig remote durchgeführt werden.\nMit freundlichen Grüßen\nU. Bühler"),
];

var showtext = List<bool>.generate(litems.length, (int index) => false); // Liste die Auskunft gibt, welche der Artikel ausgeklappt sind

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(titel: titel, showAdd: false, notifyParent: refresh),
      body: Container(
        child: ListView.separated(
          itemCount: litems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
                key: Key(litems[index].text),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    litems.removeAt(index);
                  });
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            litems[index].headline,
                            style: TextStyle(
                              fontSize: fontSizeMain + 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "[ " + litems[index].tag + " ]",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "von " + litems[index].author,
                          style: TextStyle(
                              fontSize: fontSizeMain,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          litems[index].date,
                          style: TextStyle(
                              fontSize: fontSizeMain,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Text(
                      "\n" + litems[index].text,
                      maxLines: (showtext[index]) ? 150 : 10,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: fontSizeMain,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showtext[index] = !(showtext[index]);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          (showtext[index])
                              ? Text(
                                  "Weniger anzeigen",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: fontSizeMain - 1,
                                  ),
                                )
                              : Text(
                                  "Mehr anzeigen",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: fontSizeMain - 1,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (buildContext, int index) => const Divider(),
        ),
      ),
    );
  }
}
