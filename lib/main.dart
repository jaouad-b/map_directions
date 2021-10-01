import 'package:demo/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application demo',
      theme: ThemeData(

        backgroundColor: Colors.blue.shade50,
      ),
      home: const MenuPage() ,

    );
  }
}


