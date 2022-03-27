import 'package:flutter/material.dart';


class Success extends StatelessWidget {
  const Success({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Поздравляем 🐱!'),
        centerTitle: true,  
      ) ,
      body: Container(
        padding:const EdgeInsets.all(20.0),
        child: Center(child: ListView(children:  [
                Image.network("https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554__340.jpg", width: 300,),
          const Text("Форма успешно отправлена!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold
              ),),
          const SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, '/second');
              },
            child: const Text("Завершить регистрацию")
            )    

        ],),),
      ),

      
    );
  }
}