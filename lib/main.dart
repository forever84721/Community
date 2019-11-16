import 'package:community/Common/Routes.dart';
import 'package:community/Pages/Index.dart';
import 'package:community/Pages/Login.dart';
import 'package:community/Widget/ProgressDialog/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return MaterialApp(
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback:
          i18n.resolution(fallback: new Locale("en", "US")),
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.login,
      routes: {
        Routes.login: (context) =>
            ProgressDialog(loading: LoadingStatus(false), child: Login()),
        Routes.index: (context) =>
            ProgressDialog(loading: LoadingStatus(false), child: Index()),
        // '/second': (context) => SecondScreen(),
      },
    );
    // List<Widget> widgetList = [];
    // widgetList.add(CircularProgressIndicator());
    // widgetList.add(app);
    // return Stack(
    //   children: widgetList,
    // );
  }
}
