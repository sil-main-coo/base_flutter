import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'package:base_flutter/presentation/components/spaces/vertical_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonBottomSheetModel {
  String label;
  Color color;
  Function() onPressed;

  ButtonBottomSheetModel(
      {required this.label, required this.color, required this.onPressed});
}

class ContentBottomSheetDefault extends StatelessWidget {
  const ContentBottomSheetDefault(
      {Key? key, required this.title, required this.buttons})
      : super(key: key);

  final String title;
  final List<ButtonBottomSheetModel> buttons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _titleWidget(context: context, title: title),
          _buildButtons(context),
          VSpace.init8(),
          _cancelButton(context),
          VSpace.init8(),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final buttonWidgets = List<Widget>.generate(
        buttons.length,
        (index) => _buttonItem(context,
            color: buttons[index].color,
            label: buttons[index].label,
            onPressed: buttons[index].onPressed,
            borderBottom: index == buttons.length - 1));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: buttonWidgets,
    );
  }

  Widget _titleWidget({required BuildContext context, required String title}) {
    return Container(
      height: 45.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.w), topRight: Radius.circular(14.w))),
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Widget _cancelButton(BuildContext context) {
    return _buttonItem(context,
        borderAll: true,
        isBoldText: true,
        label: S.current.cancel,
        color: mBodyTextColor,
        onPressed: () => Navigator.pop(context));
  }

  Widget _buttonItem(BuildContext context,
      {bool borderTop = false,
      bool borderBottom = false,
      bool borderAll = false,
      bool isBoldText = false,
      required Function() onPressed,
      required String label,
      required Color color}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 58.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderTop
                ? BorderRadius.only(
                    topLeft: Radius.circular(14.w),
                    topRight: Radius.circular(14.w))
                : borderBottom
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(14.w),
                        bottomRight: Radius.circular(14.w))
                    : borderAll
                        ? BorderRadius.all(Radius.circular(14.w))
                        : null),
        child: Text(
          label,
          style: Theme.of(context).textTheme.buttonDark.copyWith(
              color: color, fontWeight: isBoldText ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
