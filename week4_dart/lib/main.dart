import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            centerTitle: true,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.lightBlue.shade50,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: [for (int i = 1; i < 7; i++) const ContactCard()],
            ),
          )),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 350,
        height: 100,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 85,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 10) ,
              child: Image.asset("assets/images/pic1.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mark Müller',
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Tel: +49 174 525-347-85',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('geb: 12.03.1979',
                    style: TextStyle(fontSize: 16, color: Colors.black))
              ],
            )
          ],
        ));
  }
}




