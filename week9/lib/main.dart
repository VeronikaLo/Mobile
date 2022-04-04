import 'package:flutter/material.dart';
//import 'package:week9/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: Home(),
    );
  }
}



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//inherited widget

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
              activeTrackColor: Colors.purple[200],
              activeColor: Colors.purple[500],
              onChanged: (bool value){
                setState(()=> _isOn = value);
              }),
            const Text('\u{1F47F}'),
          ],
        ) ,
      ),
      body: SuperState(superheroState: _isOn, child: const Hero()),
    );
  }
}


class SuperState extends InheritedWidget {
  final bool superheroState;

const SuperState({ Key? key, required this.superheroState, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant SuperState oldWidget) =>
      oldWidget.superheroState != superheroState;

  static bool? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SuperState>()!.superheroState;
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

  

  final String image1 = "https://static.wikia.nocookie.net/avengers/images/9/90/Bruce_Banner_Avengers_2.png/revision/latest/scale-to-width-down/505?cb=20141019124251&path-prefix=de";
  final String image2 = "https://comicvine.gamespot.com/a/uploads/original/11123/111230072/6000203-7447360750-latest";

  @override
  Widget build(BuildContext context) {
    final superheroState = SuperState.of(context) ?? false;
    return Stack(
      
      alignment: Alignment.bottomCenter,
      children: [
        
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(superheroState ? image2 : image1),
          fit: BoxFit.cover,
          )
          ),
        ),
        Container(
          height: 130,
          width: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.brown,
          ),
          margin: const EdgeInsets.only(bottom: 30.0) ,
          padding: const EdgeInsets.all(10),
          child: Column(children:  [
            Text(superheroState ? "Hulk" : "Bruce Banner",
                  style: const TextStyle(fontSize: 25.0),),
            const Text('aaaa'),
          ],)
            
        ),
      ], 
    );
  }
}