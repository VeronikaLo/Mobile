import 'package:flutter/material.dart';
import 'package:week8_navigation/city.dart';

class City{
  final String title;
  final String description;
  final String image;
  final String country;

 City (this.title, this.description, this.image, this.country);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: Home(
        cities: List.generate(
          4,
          (i) => City(
            cityName[i], cityDescription[i], cityImage[i], cityCountry[i]),
        ),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.cities}) : super(key: key);

  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amazing Cities'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(cities[index].image) ,),
            title: Text(cities[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, we're
            // also passing the current city through to it.
            subtitle:Text(cities[index].country) ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(city: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a City.
  const DetailScreen({Key? key, required this.city}) : super(key: key);

  // Declare a field that holds the City.
  final City city;

  @override
  Widget build(BuildContext context) {
    // Use the City to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(city.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(child: ListView(children: [
        Image.network(city.image , width: 200,),
        const SizedBox(height: 20.0,),
        Text(city.description),
        ],),),
      ),
    );
  }
}

