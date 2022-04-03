import 'package:flutter/material.dart';

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