import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_picker.dart';

class AppItemPicker {
  static void show<T>({
    required BuildContext context,
    required List<T> dataList,
    required T itemSelected,
    Function(T)? onPressedDone,
    Function(T)? onChanged,
  }) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ct) {
          return _AppItemPickerWidget<T>(
              onPressedDone: onPressedDone,
              onChanged: onChanged,
              dataList: dataList,
              itemSelected: itemSelected);
        });
  }
}

// ignore: must_be_immutable
class _AppItemPickerWidget<T> extends StatefulWidget {
  final Function(T)? onPressedDone;
  final Function(T)? onChanged;
  final List<T> dataList;
  final T itemSelected;

  const _AppItemPickerWidget(
      {this.onPressedDone,
      this.onChanged,
      required this.itemSelected,
      required this.dataList});

  @override
  _AppItemPickerWidgetState<T> createState() => _AppItemPickerWidgetState<T>();
}

class _AppItemPickerWidgetState<T> extends State<_AppItemPickerWidget<T>> {
  late T _selected;

  FixedExtentScrollController controller = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    controller = FixedExtentScrollController(
        initialItem: widget.dataList.indexOf(widget.itemSelected));
  }

  @override
  Widget build(BuildContext context) {
    _selected = widget.itemSelected;

    return AppPicker(
      onPressedDone: () {
        widget.onPressedDone!(_selected);
      },
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 34.h,
        scrollController: controller,
        onSelectedItemChanged: (index) {
          final value = widget.dataList[index];
          _selected = value;
          if (widget.onChanged != null) {
            widget.onChanged!(_selected);
          }
        },
        children: List<Widget>.generate(widget.dataList.length,
            (index) => _itemWidget(context, widget.dataList[index])),
      ),
    );
  }

  Widget _itemWidget(BuildContext context, T item) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        item.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
