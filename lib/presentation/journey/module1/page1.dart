import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1_cubit.dart';
import 'package:base_flutter/presentation/journey/module2/module2_route.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2_cubit.dart';


class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state1 = context.read<StateManager1Cubit>();

    print(state1.value1.toString());
    print(state1.value2.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1.value1 ?? 'null'),
            RaisedButton(
              onPressed: () {
                state1.value1 = 'state 1 from 1';
                // state2.value1 = 'state 2 from 1';
                state1.save();
                Navigator.pushNamed(context, Module2Route.page2);
              },
              child: const Text('Push to page 2'),
              color: Colors.blue,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  final state2 = context.read<StateManager2Cubit>();
                  print(state2.value1);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Get state 2'),
            )
          ],
        ),
      ),
    );
  }
}
