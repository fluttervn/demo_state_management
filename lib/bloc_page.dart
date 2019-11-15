import 'package:bloc/bloc.dart';
import 'package:demo_state_management/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
      ),
      body: BlocProvider<CounterBloc>(
        builder: (context) => CounterBloc(),
        child: BlocPageContent(),
      ),
    );
  }
}

class BlocPageContent extends StatelessWidget {
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
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(CounterEvent.increment),
          ),
          height10,
          BlocBuilder<CounterBloc, int>(
            builder: (context, number) {
              return Container(
                child: Text('Number is: $number', style: textResultStyle),
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

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
