import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1.dart';
import 'package:get/get.dart';
import '../module2_route.dart';
import '../state_manager/state_manager_2.dart';

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  final state1 = Get.find<StateManager1>();
  final state2 = Get.find<StateManager2>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('state1.value1: ${state1.value1}');
      print('state1.value2: ${state1.value2}');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1.value1 ?? 'null'),
            RaisedButton(
              onPressed: () {
                state1.value1 = 'state 1 from 2';
                state2.value1 = 'state 2 from 2';
                Get.toNamed('${Module2Route.page2}${Module2Route.page3}');
              },
              child: const Text('Get state and push to page3'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
