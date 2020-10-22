import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contador de Pessoas',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _people = 0;

  void _changePeople(int x) {
    setState(() {
      _people += x;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pessoas : $_people',
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: Text(
                        '+1',
                        style: TextStyle(color: Colors.blue, fontSize: 40),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    onPressed: () {
                      _changePeople(-1);
                    },
                    child: Text('-1',
                        style: TextStyle(color: Colors.blue, fontSize: 40)),
                  ),
                )
              ],
            ),
            Text(
              'Pode entrar',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
