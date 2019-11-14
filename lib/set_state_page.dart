import 'package:demo_state_management/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SetStatePage extends StatefulWidget {
  @override
  _SetStatePageState createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setState'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: createRandomColor(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            textGuideRebuildWarning(),
            height10,
            textGuideTouchButtonToIncrease(),
            height10,
            RaisedButton(
              child: Text('Increase'),
              onPressed: () => setState(() {
                _number++;
              }),
            ),
            height10,
            Text('Number is: $_number', style: textResultStyle),
          ],
        ),
      ),
    );
  }
}
