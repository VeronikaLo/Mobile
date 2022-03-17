//test versuch
import 'package:flutter/material.dart';
import 'package:week7_task2/helpers/constants.dart';
import 'package:week7_task2/helpers/gifs_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //array for the gifs list
  final _gifs = <String>[];
  final _dataFetch = DataFetch();
  

  //Step1: search mit API

  _getDataGifs(gifySearch) async {
    debugPrint("from home_page _getGifs: $gifySearch");

    //clear gifs array by new call:
    _gifs.clear();

    try {
  
    var dataDecoded = await _dataFetch.getDataGifs(gifySearch);

    updateData(dataDecoded);

    //debugPrint("from home_page _getGifs: $dataDecoded");

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Step2: render the data

  void updateData(giphyUrl) {
    setState(() {
      if (giphyUrl != null) {

        debugPrint("from home_page updateData:");
        debugPrint(giphyUrl.toString()); // jsonEncode(giphyUrl)
        
        
        for (int i = 0; i < limit; i++) {
          _gifs.add(
              giphyUrl["data"][i]["images"]["fixed_width"]["url"].toString());
        }
        
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Giphy Search"),
          centerTitle: true,
        ) ,
        body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Search 🔎...'),
              onSubmitted: (String gifySearch) => _getDataGifs(gifySearch),
            ),
            if (_gifs.isNotEmpty)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5, ),
                    itemCount: _gifs.length,
                    itemBuilder: (BuildContext contex, int index){
                      return Container(
                        decoration: BoxDecoration(
	                      image: DecorationImage(
	                      fit: BoxFit.cover,
	                      image: NetworkImage(_gifs[index]),
                          ),
	                      ),
                      );
                    })))
          ],
        ), 
    ));
  }
}