import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double fontSize = 12;

  void increment(){
  setState((){
    fontSize++;
  });
}

void decrement(){
  setState((){
    fontSize--;
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Stateful Widget Vs. Stateless Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                  decrement();
                  },

                  icon: const Icon(
                    Icons.remove,
                    color: Colors.pink,
                    ),
                ),
                TextField(
                  controller: TextEditingController()..text = fontSize.toString(),
                  decoration: const InputDecoration(labelText: "Размер шрифта", border: OutlineInputBorder(),),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  onChanged: (String font) {
										double newFont = double.parse(font);
                    setState(() {
                      fontSize = newFont;
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    increment();
                  },

                  icon: const Icon(
                    Icons.add,
                    color: Colors.pink,
                    ),
                ),
                Text("Винни-пух и пятачок отдыхали на веточке дуба. Пух сказал: ”Интересно, как долго мы ещё будем здесь торчать?” Пятачок ответил: ” Я думаю, ещё лет десять.",
                    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}