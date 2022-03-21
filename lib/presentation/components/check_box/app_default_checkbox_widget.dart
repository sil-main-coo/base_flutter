import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'package:base_flutter/presentation/components/spaces/horizontal_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCheckBoxWidget extends StatefulWidget {
  const AppCheckBoxWidget(
      {Key? key, this.label, this.labelWidget, required this.onChanged})
      : super(key: key);

  final String? label;
  final Widget? labelWidget;
  final Function(bool?) onChanged;

  @override
  _AppDefaultCheckboxWidgetState createState() =>
      _AppDefaultCheckboxWidgetState();
}

class _AppDefaultCheckboxWidgetState extends State<AppCheckBoxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final checkBoxLabelStyle = TextStyle(
        fontSize: AppTextTheme.fzCallOut,
        fontWeight: FontWeight.normal,
        color: mDescriptionColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 4.w, left: 2.w),
          width: 12.w,
          height: 12.w,
          child: Checkbox(
            checkColor: Colors.white,
            value: _isChecked,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
                widget.onChanged(_isChecked);
              });
            },
          ),
        ),
        HSpace.init8(),
        Flexible(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
                widget.onChanged(_isChecked);
              });
            },
            child: widget.labelWidget ??
                Text(
                  widget.label!,
                  style: checkBoxLabelStyle,
                ),
          ),
        ),
      ],
    );
  }
}
