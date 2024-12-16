import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/guichet_provider.dart';
import 'screens/guichet_list_screen.dart';
import 'screens/add_guichet_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GuichetProvider()..loadGuichets(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guichet App',
      initialRoute: '/',
      routes: {
        '/': (ctx) => GuichetListScreen(),
        '/add': (ctx) => AddGuichetScreen(),
      },
    );
  }
}
