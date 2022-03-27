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

class Butterfly {

  String name;
  String description;

   static const List<String> _butterflies = <String>[
    "Marbled White",
    "Wall",
    "Red Admiral",
    "Grayling",
    "Gatekeeper",
    "Holly Blue"
  ];

  static const List<String> _buttText = <String>[
    "The Marbled White is a distinctive and attractive black and white butterfly, unlikely to be mistaken for any other species. It shows a marked preference for purple flowers.",
    "The Wall is named after its habit of basking on walls, rocks, and stony places. The delicately patterned light brown undersides provide good camouflage against a stony or sandy surface.",
    "A large and strong-flying butterfly and common in gardens. This familiar and distinctive insect may be found anywhere in Britain and Ireland and in all habitat types.",
    "А distinctive, large butterfly with a looping and gliding flight. Cryptic colouring provides the Grayling with excellent camouflage, making it difficult to see when at rest on bare ground, tree trunks, or stones.",
    "As its English name suggests, the Gatekeeper (also known as the Hedge Brown) is often encountered where clumps of flowers grow in gateways and along hedgerows and field edges.",
    "Wings are bright blue. Females have black wing edges. Undersides pale blue with small black spots which distinguish them from Common Blue. It tends to fly high around bushes and trees. "
  ];

  //constructor:
  Butterfly(this.name, this.description);

  //class methods:

  // 1. get butts array
   static List<Butterfly> getList() {
    var _buttList = <Butterfly>[];
    for (int i = 0; i < _butterflies.length; i++) {
      _buttList.add(Butterfly(_butterflies[i], _buttText[i]));
    }
    return _buttList;
  }

  // 2. searched butt valid or not
  static bool isNameValid(String name) {
    return _butterflies.contains(name);
  }

  // 3.  offers Help list
  static List<String> getHelpList() {
    return _butterflies;
  }
}






class ButterfliesList extends StatefulWidget {
  const ButterfliesList({Key? key}) : super(key: key);
  
  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList>{

  
  var _buttList = <Butterfly>[];

  String _description = "";

  final _controller = TextEditingController();

  int _selectedIndex = -1;

  //function to find the index of the searched butt name
  int _getIndex(String name) {
    if (Butterfly.isNameValid(name)) {
      for (Butterfly b in _buttList) {
        if (b.name == name) return _buttList.indexOf(b);
      }
    }
    return -1; //return "Theres no such butt in our collection";
  }

  @override
  void initState() {
    //
    _buttList = Butterfly.getList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
            Text(  _selectedIndex == -1 ?
              'Choose your butterfly':
              _buttList[_selectedIndex].name +' 🦋',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.blue  ),),

            
          TextField(
            controller: _controller,
            decoration:
              InputDecoration(
                  hintText: "Search 🔎...",
              // for the Help list
              suffixIcon: PopupMenuButton(
                //при выборе бабочки
                onSelected: (String value) {
                  setState(() {
                    //имя бабочки записывается в поле
                    _controller.text = value;
                    //find the index of the searched butt
                    _selectedIndex = _getIndex(value);
                    //
                    _description = _buttList[_selectedIndex].description;
                  });
                },
                icon: const Icon(Icons.help),
                itemBuilder: (BuildContext context) {
                  //get Help list
                  var _items = Butterfly.getHelpList();
                  //список элементов для PopupMenuButton
                  return _items.map((String value) {
                    return PopupMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList();

                },
              )),
            onSubmitted: (String value) {
              setState(() {
                //find the index of the selected but.
                _selectedIndex = _getIndex(value);
                //if true
                if (_selectedIndex != -1) {
        
                  _description = _buttList[_selectedIndex].description;
                }
                //if not
                else {
                  _description = "There's no such butterfly in our collection";
                }
              });
            }
          ),

            
            Container(
                padding: const EdgeInsets.all(10.0),
                height: 200.0,
                child:ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemExtent: 180,
                  itemCount: _buttList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: () {
                          setState(() {
                            // set selected index 
                            _selectedIndex = index;
                            _description = _buttList[index].description;
                          });
                        },
                      
                      selected: index == _selectedIndex,
                      title: Container(
                          height: 80,
                          width: 180,
                          padding: const EdgeInsets.only(top:7.0),
                          decoration: BoxDecoration(
                              color: index == _selectedIndex
                                ?  Colors.pink[100]
                                :  Colors.yellow[100],
                              border: Border.all(color: Colors.blue, width: 3),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text("🦋" + _buttList[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 22)),
                      ), 
                  ),
                ),
              ),
            

            Center(
              child: Text(  _description ,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize:24, fontWeight: FontWeight.bold, color: Colors.blue  ),),
            ),

        ],
      ),

    );
  }
}

