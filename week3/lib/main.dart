import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      title: "Composition",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basics of composition",), centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.lightBlue,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  YellowBalloon(),
                  YellowBalloon(),
                  RedBalloon(),
                  YellowBalloon()
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  YellowBalloon(),
                  RedBalloon(),
                  RedBalloon(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  RedBalloon(),
                  YellowBalloon(),
                  RedBalloon(),
                  YellowBalloon()
                ],
              ),
            ],),) ,
      ),
  ));
}

class YellowBalloon extends StatelessWidget {
  const YellowBalloon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}

class RedBalloon extends StatelessWidget {
  const RedBalloon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}