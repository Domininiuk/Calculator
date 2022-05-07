import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Calculator',
          style: Theme.of(context).textTheme.headline1,
        )),
        body: _Operands());
  }
}

class _Operands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Text("0", textScaleFactor: 2.0,))],
            ),

            Row(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('1', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('2', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,                  child: ElevatedButton(
                    child: Text('3', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('4', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('5', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('6', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('7', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('8', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('9', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('.', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('0', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: ElevatedButton(
                    child: Text('=', textScaleFactor: 2.0,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
