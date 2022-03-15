import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? onResume;
  final AsyncCallback? onInactive;
  final AsyncCallback? onPaused;
  final AsyncCallback? onDetached;

  LifecycleEventHandler({
    this.onResume,
    this.onInactive,
    this.onPaused,
    this.onDetached,
  });

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (onResume != null) {
          await onResume!();
        }
        break;
      case AppLifecycleState.inactive:
        if (onInactive != null) {
          await onInactive!();
        }
        break;
      case AppLifecycleState.paused:
        if (onPaused != null) {
          await onPaused!();
        }
        break;
      case AppLifecycleState.detached:
        if (onDetached != null) {
          await onDetached!();
        }
        break;
    }
  }
}
