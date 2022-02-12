import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
          title: const Text("Stateful Widget vs. Stateless Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  FloatingActionButton.small(
                  backgroundColor: Colors.pink,
                  onPressed: () {
                  decrement();
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    ),
                ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: TextEditingController()..text = fontSize.toString(),
                      decoration: const InputDecoration(labelText: "Размер шрифта", border: OutlineInputBorder(),),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      onSubmitted: (String font) {
										double newFont = double.parse(font);
                    setState(() {
                      fontSize = newFont;
                    });
                  },
                ), 
                  ),
                  FloatingActionButton.small(
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    increment();
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    ),
                ),
                  ],
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