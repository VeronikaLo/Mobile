import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing data with inherited widget',
      home: Home(),
    );
  }
}



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('\u{1F466}'),
            Switch(
              value: _isOn,
              activeTrackColor: Colors.brown[200],
              activeColor: Colors.brown,
              onChanged: (bool value){
                setState(()=> _isOn = value);
              }),
            const Text('\u{1F47F}'),
          ],
        ) ,
      ),
      body: SuperState(heroState: _isOn, child: const Hero()),
    );
  }
}

//inherited widget
class SuperState extends InheritedWidget {
  final bool heroState;

const SuperState({ Key? key, required this.heroState, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant SuperState oldWidget) =>
      oldWidget.heroState != heroState;

  static bool? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SuperState>()!.heroState;
}


/*
class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('\u{1F466}'),
            Switch(
              value: _isOn,
              activeTrackColor: Colors.purple[200],
              activeColor: Colors.purple[500],
              onChanged: (bool value){
                setState(()=> _isOn = value);
              }),
            const Text('\u{1F47F}'),
          ],
        );
  }
}
*/
class Hero extends StatelessWidget {
  const Hero({ Key? key }) : super(key: key);
  
  final String image1 = "assets/images/Banner.webp";
  final String image2 = "assets/images/hulk.jfif";


  @override
  Widget build(BuildContext context) {
    final heroState = SuperState.of(context) ?? false;
    return Stack(
      
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(heroState ? image2 : image1),
            fit: BoxFit.cover,
            )
          ),
        ),

        Container(
          height: 130,
          width: 200,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: heroState ? Colors.amberAccent : Colors.indigo[200],
          ),
          margin: const EdgeInsets.only(bottom: 30.0) ,
          padding: const EdgeInsets.all(10),
          child: Column(children:  [
            Text(heroState ? "Hulk" : "Bruce Banner",
                  style: const TextStyle(fontSize: 25.0, color: Colors.white ),),
            Text(heroState ? "a green-skinned, hulking and muscular humanoid with limitless  physical strength" : "a genius scientist, physicist, and medical doctor with seven Ph.D.s",
            textAlign: TextAlign.center,),
          ],)
            
        ),
      ], 
    );
  }
}