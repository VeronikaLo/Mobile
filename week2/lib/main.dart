import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      title: "My first App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first app",), centerTitle: true,
        ),
        body: Column(
          children:const [
            Image(image: AssetImage('assets/images/winnie-pooh.jpg')),
            Text(
              'Happy Bithday to you!\n' 
            'Wish you happiness\n'
            'and much honey!\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue ,
                fontSize: 24, 
                fontFamily:'JosefinSans', 
                fontWeight: FontWeight.bold,
                wordSpacing: 10.0,
                letterSpacing: 2.0, )
              ,),
            Text(
              'Yours,  Winnie',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue ,
                fontSize: 18, 
                fontFamily:'JosefinSans', 
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
                decorationThickness: 2.0,
                decorationColor: Colors.red,
                
                  )
              ,),
          ],
        ),
      ),
  ));
}




