import 'package:demo/features/menu/presentation/widgets/menu_widget.dart';
import 'package:flutter/material.dart';




class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu application'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            calendarSection(context),
            routeSearchSection(context),
          ],
        ),
      ),
    );
  }
  
}
