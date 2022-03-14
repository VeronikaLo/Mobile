import 'package:flutter/material.dart';

import 'package:week7_task2/components/home_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funny giphy',
      home: HomePage(),
    );
  }
}