import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, 
      home: Scaffold(
    body: const ButterfliesList(),
    appBar: AppBar(
      title: const Text("Butterflies"),
      centerTitle: true,
    ),
  )));
}

class ButterfliesList extends StatefulWidget {
  const ButterfliesList({Key? key}) : super(key: key);
  
  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList>{

  final List<String> _butterflies = <String>[
    "Marbled White",
    "Wall",
    "Red Admiral",
    "Grayling",
    "Gatekeeper",
    "Holly Blue"
  ];

  final List<String> _buttText = <String>[
    "The Marbled White is a distinctive and attractive black and white butterfly, unlikely to be mistaken for any other species. It shows a marked preference for purple flowers.",
    "The Wall is named after its habit of basking on walls, rocks, and stony places. The delicately patterned light brown undersides provide good camouflage against a stony or sandy surface.",
    "A large and strong-flying butterfly and common in gardens. This familiar and distinctive insect may be found anywhere in Britain and Ireland and in all habitat types.",
    "А distinctive, large butterfly with a looping and gliding flight. Cryptic colouring provides the Grayling with excellent camouflage, making it difficult to see when at rest on bare ground, tree trunks, or stones.",
    "As its English name suggests, the Gatekeeper (also known as the Hedge Brown) is often encountered where clumps of flowers grow in gateways and along hedgerows and field edges.",
    "Wings are bright blue. Females have black wing edges. Undersides pale blue with small black spots which distinguish them from Common Blue. It tends to fly high around bushes and trees. "
  ];

  int _selectedIndex = -1;
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
            Text(  _selectedIndex == -1 ?
              'Choose your butterfly':
              _butterflies[_selectedIndex] +' 🦋',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.blue  ),),

            

            
            Container(
                padding: const EdgeInsets.all(10.0),
                height: 200.0,
                child:ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemExtent: 180,
                  itemCount: _butterflies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: () {
                          setState(() {
                            // устанавливаем индекс выделенного элемента
                            _selectedIndex = index;
                          });
                        },
                      
                      selected: index == _selectedIndex,
                      title: Container(
                          height: 80,
                          width: 180,
                          padding: const EdgeInsets.only(top:7.0),
                          decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              border: Border.all(color: Colors.blue, width: 3),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text("🦋" + _butterflies[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 22)),
                      ), 
                  ),
                ),
              ),
            

            Center(
              child: Text(  _selectedIndex == -1 ?
                '':
                _buttText[_selectedIndex] ,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize:24, fontWeight: FontWeight.bold, color: Colors.blue  ),),
            ),

        ],
      ),

    );
  }
}

