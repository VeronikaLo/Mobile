import 'dart:convert';
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
  String defaultGif =
      "https://media3.giphy.com/media/d2W7eZX5z62ziqdi/200w.gif";

  void updateData(gifData) {
    setState(() {
      if (gifData != null) {
        debugPrint("from home_page updateData:");
        debugPrint(jsonEncode(gifData));
        for (int i = 0; i < limit; i++) {
          _gifs.add(
              gifData["data"][i]["images"]["fixed_width"]["url"].toString());
        }
      } else {
        for (int i = 0; i < limit; i++) {
          _gifs.add(defaultGif);
        }
      }
    });
  }

  _getDataGifs(gifySearch) async {
    debugPrint("from home_page _getGifs: $gifySearch");
    //clear gifs array by new call
    _gifs.clear();
    try {
     
    var dataDecoded = await _dataFetch.getDataGifs(gifySearch);
    updateData(dataDecoded);

    } catch (e) {
      print(e);
    }
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