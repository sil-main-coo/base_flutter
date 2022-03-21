import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'arrow_clipper.dart';
import 'dropdown_menu_model.dart';

class DropDownWithArrow extends StatefulWidget {
  final List<DropDownMenuModel> childrenModel;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final double widthBox;
  final Widget icon;
  final double? sizeArrow;
  final double? sizeIcon;
  final ArrowClipperDirection direction;
  final String? textTitle;

  const DropDownWithArrow({
    Key? key,
    this.textTitle,
    this.direction = ArrowClipperDirection.UP,
    this.sizeArrow,
    this.sizeIcon,
    required this.widthBox,
    required this.childrenModel,
    required this.icon,
    this.borderRadius,
    this.backgroundColor = const Color(0xfff67c0b9),
  }) : super(key: key);

  @override
  _DropDownWithArrowState createState() => _DropDownWithArrowState();
}

class _DropDownWithArrowState extends State<DropDownWithArrow>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;
  late AnimationController _animationController;
  late double _sizeArrow;

  final double _paddingRightArrow = 4.w;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(8);

    _key = LabeledGlobalKey("drop_down_with_arrow");
    _sizeArrow = widget.sizeArrow ?? 17.w;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = _key.currentContext!.size!;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (isMenuOpen) {
          closeMenu();
        } else {
          openMenu();
        }
      },
      child: SizedBox(
        key: _key,
        width: widget.sizeIcon,
        height: widget.sizeIcon,
        child: widget.icon,
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => closeMenu(),
              child: Container(
                color: Colors.black45,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: buttonPosition.dy + buttonSize.height - _sizeArrow / 2,
              right: ScreenUtil().screenWidth -
                  buttonPosition.dx -
                  buttonSize.width / 2 -
                  _sizeArrow / 2 -
                  _paddingRightArrow,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: _paddingRightArrow,
                      child: ClipPath(
                        clipper: ArrowClipper(direction: widget.direction),
                        child: Container(
                          width: _sizeArrow,
                          height: _sizeArrow,
                          color: widget.backgroundColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0.h),
                      child: Container(
                        width: widget.widthBox,
                        decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius: _borderRadius,
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _buildListMenu(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildListMenu(BuildContext context) {
    final menus = List.generate(widget.childrenModel.length,
        (index) => _buttonItem(widget.childrenModel[index]));
    if (widget.textTitle != null) {
      menus.insert(0, _titleWidget());
    }

    return menus;
  }

  Widget _titleWidget() {
    return Container(
      height: 45.h,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(width: 1, color: mBorderLineColor),
          )),
      child: Text(
        widget.textTitle!,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Widget _buttonItem(DropDownMenuModel downMenuModel) {
    return GestureDetector(
      onTap: () {
        closeMenu();
        downMenuModel.onPressed();
      },
      child: Container(
        height: 58.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              top: downMenuModel.borderTop
                  ? BorderSide(width: 1, color: mBorderLineColor)
                  : BorderSide.none,
              bottom: downMenuModel.borderBottom
                  ? BorderSide(width: 1, color: mBorderLineColor)
                  : BorderSide.none,
            )),
        child: Text(
          downMenuModel.label,
          style: Theme.of(context).textTheme.buttonDark.copyWith(
              color: downMenuModel.color,
              fontWeight: downMenuModel.isBoldText ? FontWeight.bold : null),
        ),
      ),
    );
  }
}
