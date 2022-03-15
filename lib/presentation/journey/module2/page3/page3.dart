import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  Page3({Key? key}) : super(key: key);

  final state1 = Get.find<StateManager1>();
  final state2 = Get.find<StateManager2>();

  @override
  Widget build(BuildContext context) {
    print(state1.value1);
    print(state1.value2);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
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
              child: Text('click'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
