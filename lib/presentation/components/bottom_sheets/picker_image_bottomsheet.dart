import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'content_bottom_sheet_default.dart';

class PickerImageBottomSheet {
  static void show(
      {required BuildContext context,
      required Function cameraCallback,
      required Function galleryCallback}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => PickerImageBottomSheetWidget(
        cameraCallback: cameraCallback,
        galleryCallback: galleryCallback,
      ),
    );
  }
}

class PickerImageBottomSheetWidget extends StatelessWidget {
  const PickerImageBottomSheetWidget(
      {Key? key, required this.cameraCallback, required this.galleryCallback})
      : super(key: key);

  final Function cameraCallback;
  final Function galleryCallback;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ButtonBottomSheetModel(
          label: S.current.takePicture,
          color: Colors.black,
          onPressed: () {
            cameraCallback();
            Navigator.pop(context);
          }),
      ButtonBottomSheetModel(
        label: S.current.selectPicture,
        color: Colors.black,
        onPressed: () async {
          galleryCallback();
          Navigator.pop(context);
        },
      )
    ];

    return ContentBottomSheetDefault(
      title: S.current.option,
      buttons: buttons,
    );
  }
}
