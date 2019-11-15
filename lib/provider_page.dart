import 'package:demo_state_management/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => Counter()),
        ],
        child: ProviderPageContent(),
      ),
    );
  }
}

class ProviderPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Text('Increase number'),
            onPressed: () =>
                Provider.of<Counter>(context, listen: false).increment(),
          ),
          height10,
          Consumer<Counter>(
            builder: (context, counter, _) {
              return Container(
                child: Text(
                  'Number is: ${Provider.of<Counter>(context).count}',
                  style: textResultStyle,
                ),
                padding: EdgeInsets.all(5),
                color: createRandomColor(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
