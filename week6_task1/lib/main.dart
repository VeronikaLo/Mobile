import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Genius Ideas"),
        centerTitle: true,
      ),
      body: const IdeasList(),
    ),
  ));
}

class IdeasList extends StatefulWidget {
  const IdeasList({Key? key}) : super(key: key);

  @override
  _IdeasListState createState() => _IdeasListState();
}


class _IdeasListState extends State<IdeasList>{
  
  final Set <String> ideasList = {};

//  controller for TextField
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Add your ideas',
              style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, color: Colors.blue  ),
            ),
            Container(
              width:300,
              margin: const EdgeInsets.symmetric(vertical:20 ),
              child: TextField(
              controller: _myController ,
              decoration: const InputDecoration(labelText: "Your idea", border: OutlineInputBorder(),),
              onSubmitted: (String userInput){
                setState(() {
                  ideasList.add(userInput);
                  _myController.clear();
                });
              },
              ),
              
            ),
            SizedBox(height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                separatorBuilder: (BuildContext context, int index)=> const Divider(),
                itemCount: ideasList.length,
                itemBuilder: (BuildContext context, int index) {
                return   ListTile(
                  // convert ideasList from Set into List
                  title: Text( ideasList.toList()[index] , style: const TextStyle(fontSize: 14)),
                  leading: const Icon(Icons.favorite_border),
                  tileColor: Colors.pink[100],
                    );
              },
            ),)
          ],
      )
    );
  }
  
}
