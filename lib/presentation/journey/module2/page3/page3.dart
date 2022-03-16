import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1_cubit.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state1 = context.read<StateManager1Cubit>();
    final state2 = context.read<StateManager2Cubit>();

    print(state1.value1);
    print(state1.value2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1.value1 ?? 'null'),
            RaisedButton(
              onPressed: () {
                state1.value1 = 'state 1 from 3';
                state2.value2 = 'state 2 from 3';

                print(state1.get());
              },
              child: const Text('Get value from state'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
