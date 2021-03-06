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
  
  String userMessage = "";
  int userAge = 0;

  String checkAge( int age){
  
    if(age < 16){
        return "Лучше посмотри мультики";
    }
    
    else if(16 <= age && age < 18){
        return "Можно в сопровождении взрослых";
    }
    
    else{
        return "Вам можно на этот фильм\n   Приятного просмотра!";
    }
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cinema App"),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: TextEditingController()..text = userAge.toString(),
                      decoration: const InputDecoration(labelText: "Ваш возраст", border: OutlineInputBorder(),),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      onSubmitted: (String input) {
                        int age = int.parse(input);
                    setState(() {
                      
                      userAge = age;
                      userMessage = checkAge(userAge);
                      userAge = 0;
                      
                    });
                  },
                ), 
                  ),
                  
                  Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Text(userMessage,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)
                    ),
                  ),
                  ],
                ),
            ),
          ),
        ),
      );
  }


}


