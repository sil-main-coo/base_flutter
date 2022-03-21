import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'arrow_tooltip_clipper.dart';

class TooltipWidget extends StatefulWidget {
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final double widthBox;
  final Widget icon;
  final double? sizeArrow;
  final double? sizeIcon;
  final ArrowTooltipClipperDirection direction;
  final Widget content;

  const TooltipWidget({
    Key? key,
    required this.content,
    this.direction = ArrowTooltipClipperDirection.DOWN,
    this.sizeArrow,
    this.sizeIcon,
    required this.widthBox,
    required this.icon,
    this.borderRadius,
    this.backgroundColor = const Color(0xfff67c0b9),
  }) : super(key: key);

  @override
  _TooltipWidgetState createState() => _TooltipWidgetState();
}

class _TooltipWidgetState extends State<TooltipWidget>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;
  late AnimationController _animationController;
  late double _sizeArrow;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(8);

    _key = LabeledGlobalKey("drop_down_with_arrow");
    _sizeArrow = widget.sizeArrow ?? 10.w;
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
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: ScreenUtil().screenHeight -
                  buttonPosition.dy + _sizeArrow/4,
              left: (buttonPosition.dx + buttonSize.width / 2) -
                  widget.widthBox / 2,
              child: Container(
                padding: EdgeInsets.all(8.w),
                width: widget.widthBox,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: _borderRadius,
                ),
                child: widget.content,
              ),
            ),
            Positioned(
              left: buttonPosition.dx,
              bottom: ScreenUtil().screenHeight -
                  buttonPosition.dy -
                  buttonSize.height / 2,
              child: ClipPath(
                clipper: ArrowTooltipClipper(direction: widget.direction),
                child: Container(
                  width: _sizeArrow,
                  height: _sizeArrow,
                  color: widget.backgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
