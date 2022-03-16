import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/app/global_state/global_state.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  final state1 = Get.find<StateManager1>();

  @override
  Widget build(BuildContext context) {
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
                state1.value1 = 'value 1 from state 1';
                // state2.value1 = 'state 2 from 1';
                state1.save();
                Get.toNamed('/page2');
              },
              child: const Text('Get state 1 and push to page 2'),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                try {
                  final state2 = Get.find<StateManager2>();
                  print(state2.value1);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Get state 2'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
