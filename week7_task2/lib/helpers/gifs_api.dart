
import 'dart:convert';
import 'package:http/http.dart';
import 'package:week7_task2/helpers/constants.dart';

class FetchHelper {
  final String url;
  FetchHelper(this.url);

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}


class DataFetch {
  
  Future<dynamic> getDataGifs(String gifySearch) async {
    FetchHelper fetchData = FetchHelper("$apiEndPoint?api_key=$apiKey&q=$gifySearch&limit=$limit&offset=0&rating=g&lang=en");

    var decodedData = await fetchData.getData();
    return decodedData;
  }
}