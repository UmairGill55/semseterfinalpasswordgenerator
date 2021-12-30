import 'package:flutter/material.dart';
import 'routes.dart';
import 'storageview.dart';
import 'harderview.dart';
import 'easyview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: _createTheme(),
      home: TransactionView(),
      routes: {
        routes.transaction: (context) => TransactionView(),
        routes.categories: (context) => CategoriesView(),
        routes.reports: (context) => ReportsView(),
      },
    );
  }
}

ThemeData _createTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple[800],
    accentColor: Colors.pink[600],
    canvasColor: Color.fromRGBO(251, 228, 251, 1),
    fontFamily: 'Georgia',
  );
}
