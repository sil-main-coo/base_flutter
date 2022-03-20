import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentation/components/spaces/horizontal_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'alert_dialog_widget.dart';

class RadioDialogWidget<T> extends StatefulWidget {
  const RadioDialogWidget(
      {Key? key,
      required this.title,
      required this.data,
      required this.callbackSelect,
      this.dataSelected})
      : super(key: key);

  final String title;
  final List<T> data;
  final T? dataSelected;
  final Function(T) callbackSelect;

  @override
  _RadioDialogWidgetState<T> createState() => _RadioDialogWidgetState<T>();
}

class _RadioDialogWidgetState<T> extends State<RadioDialogWidget<T>> {
  late T _itemSelected;

  @override
  void initState() {
    _itemSelected = widget.dataSelected ?? widget.data[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      title: widget.title,
      contentPadding: EdgeInsets.only(top: 16.h),
      barrierDismissible: false,
      leftLabel: S.current.cancel,
      callBackLeft: () => Navigator.pop(context),
      rightLabel: S.current.select,
      callBackRight: () {
        widget.callbackSelect(_itemSelected);
        Navigator.pop(context);
      },
      content: _radiosWidget(),
    );
  }

  Widget _radiosWidget() {
    final len = widget.data.length;

    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: len,
        itemBuilder: (context, index) {
          return _itemRadioWidget(widget.data[index]);
        },
      ),
    );
  }

  Widget _itemRadioWidget(T data) {
    final titleStyle = Theme.of(context).textTheme.bodyText1;

    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            _itemSelected = data;
          });
        },
        child: Row(
          children: [
            SizedBox(
              height: 16.w,
              width: 16.w,
              child: Radio<T>(
                value: data,
                groupValue: _itemSelected,
                onChanged: (value) {},
              ),
            ),
            HSpace.init16(),
            Text(
              data!.toString(),
              style: titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
