import 'package:flutter/material.dart';

void main() => runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar:  AppBar(
            title:  const Text('Регистрация питомца'), centerTitle: true),
        body: const MyForm())));

        enum GenderList { male, female }

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _choice1 = false;
  bool _choice2 = false;
  bool _choice3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child:  Form(
            key: _formKey,
            child:  ListView(
              children: <Widget>[
                const Text(
                  'Ваши имя и фамилия:',
                  style: TextStyle(fontSize: 10.0),
                ),
                TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свое имя';
                }),
                const Text(
                  'Контактный E-mail:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свой E-mail';
                  if (!value.contains('@')) return 'Это не E-mail';
                }),
                const SizedBox(height: 10.0),
                const Text(
                  'Контактный телефон:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите свой номер телефона';
                }),
                const SizedBox(height: 10.0),
                const Text(
                  'Кличка питомца:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите имя питомца';
                }),
                const SizedBox(height: 10.0),
                const Text(
                  'Порода питомца:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  TextFormField(validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста введите породу питомца';
                }),
                const SizedBox(height: 10.0),
                const Text(
                  'Пол питомца:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  RadioListTile(
                  title: const Text('Самец'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                  RadioListTile(
                  title: const Text('Самка'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Чем питается:',
                  style: TextStyle(fontSize: 10.0),
                ),
                  CheckboxListTile(
                    value: _choice1,
                    title: const Text('сухой корм'),
                    onChanged: (bool? value) =>
                        setState(() => _choice1 = value!)),
                  CheckboxListTile(
                    value: _choice2,
                    title: const Text('влажный корм'),
                    onChanged: (bool? value) =>
                        setState(() => _choice2 = value!)),
                  CheckboxListTile(
                    value: _choice3,
                    title: const Text('натуральный корм'),
                    onChanged: (bool? value) =>
                        setState(() => _choice3 = value!)),
                  ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Color color = Colors.red;
                      String text ;

                    // if(_choice1==false && _choice2==false && _choice3==false )
                      if (!_choice1 && !_choice2 && !_choice3) {
                        text = 'Выберите корм питомца';
                      } else {
                        text = 'Форма успешно заполнена';
                        color = Colors.green;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(text),
                        backgroundColor: color,
                      ));
                    }
                  },
                  child: const Text('Проверить'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  
                ),
              ],
            )));
  }
}
