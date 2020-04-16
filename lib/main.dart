import 'package:flutter/material.dart';
import 'package:hochschulkommunikation/authentification.dart';
import 'package:provider/provider.dart';
import 'package:hochschulkommunikation/home_widget.dart';
import 'package:hochschulkommunikation/themes.dart';
import 'package:hochschulkommunikation/CustomTheme.dart';
import 'package:hochschulkommunikation/login.dart';

void main() => runApp(
      CustomTheme(
        initialThemeKey: MyThemeKeys.aiai,
        child: ChangeNotifierProvider<AuthService>(
            child: MyApp(),
            create: (BuildContext context) {
              return AuthService();
            }),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hochschulkommunikation',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      //home: Home(),
      home: FutureBuilder(                                                // Entscheidet, welche Seite als Startseite angezeigt werden soll
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //   print("main $snapshot");
            return snapshot.hasData ? Home() : Login();
          } else {
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}

// tutorials used

// dynamic themes                           https://medium.com/flutter-community/dynamic-theming-with-flutter-78681285d85f
// grouped buttons                          https://pub.dev/packages/grouped_buttons
// how to hide and show text                https://stackoverflow.com/questions/49572747/flutter-how-to-hide-or-show-more-text-within-certain-length (Antwort von Vicky Salunkhe)
// login page                               https://dev.to/aaronksaunders/simple-login-flow-in-flutter-then-firebase-part-one-29n6
// alert to confirm when dismissed          https://medium.com/flutter-community/an-in-depth-dive-into-implementing-swipe-to-dismiss-in-flutter-41b9007f1e0
// update parent Widget from child Widget   https://stackoverflow.com/questions/48481590/how-to-set-update-state-of-statefulwidget-from-other-statefulwidget-in-flutter

// picture source

// https://www.hs-fulda.de/fileadmin/_processed_/0/1/csm_01_Blatt_RGB-300_1112507ad5.jpg
