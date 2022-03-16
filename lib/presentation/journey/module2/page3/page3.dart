import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1_cubit.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state1 = context.read<StateManager1Cubit>();

    print(state1.value1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1.value1 ?? 'null'),
          ],
        ),
      ),
    );
  }
}
