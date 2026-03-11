import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/counter/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterBloc.close();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => _counterBloc,
        child: Scaffold(
          appBar: AppBar(title: Text('Counter Example')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                      state.counter.toString(), style: TextStyle(fontSize: 50));
                },
              ),

              Row(
                mainAxisAlignment: .center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      print('build');
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementCounter());
                        },
                        child: Text('Increment'),
                      );
                    },
                  ),

                  SizedBox(width: 20),
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {

                      print('build');
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementCounter());
                        },
                        child: Text('Decrement'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )

    );
  }
}
