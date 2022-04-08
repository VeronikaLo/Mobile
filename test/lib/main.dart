import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Intl Demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   const MyHomePage(title: 'Intl Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('ru');
    timeFormat = DateFormat.Hms('ru');
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var dateTime =  DateTime.now();
    return  Scaffold(
      appBar:  AppBar(
        title:  Text(widget.title),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(dateFormat.format(dateTime), style: const TextStyle(color: Colors.blue, fontSize: 35) ,),
              Text(timeFormat.format(dateTime), style: const TextStyle(color: Colors.redAccent, fontSize: 35) ,),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}