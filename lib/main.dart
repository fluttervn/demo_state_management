import 'package:demo_state_management/bloc_page.dart';
import 'package:flutter/material.dart';

import 'app_util.dart';
import 'provider_page.dart';
import 'set_state_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter State Management demo'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              child: Text('setState()'),
              onPressed: () => goToScreen(context, SetStatePage()),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('BLoC - Business Logic Component'),
              onPressed: () => goToScreen(context, BlocPage()),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Provider'),
              onPressed: () => goToScreen(context, ProviderPage()),
            ),
          ],
        ),
      ),
    );
  }
}
