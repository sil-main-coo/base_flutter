import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'text_input_formatters/currency_text_input_formatter.dart';
import 'text_input_formatters/number_text_input_formatter.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.onTapFieldCallback,
      this.hintText,
      this.isRequired = false,
      this.labelText,
      this.prefixIcon,
      this.errorMaxLines = 1,
      this.autofocus = false,
      this.focusNode,
      this.controller,
      this.suffixIcon,
      this.textInputAction,
      this.maxLen,
      this.textInputType,
      this.suffixIconCallback,
      this.obscureText = false,
      this.isEnable = true,
      this.errorText,
      this.inputFormatters,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key);

  AppTextField.number(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputFormatters,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.onTapFieldCallback,
      this.hintText,
      this.prefixIcon,
      this.textInputAction,
      this.errorMaxLines = 1,
      this.autofocus = false,
      this.controller,
      this.isRequired = false,
      this.suffixIcon,
      this.suffixIconCallback,
      this.maxLen,
      this.focusNode,
      this.labelText,
      this.obscureText = false,
      this.errorText,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key) {
    isEnable = true;
    textInputType = TextInputType.number;
    inputFormatters ??= [];
    inputFormatters!.add(NumberTextInputFormatter());
  }

  AppTextField.money(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.onTapFieldCallback,
      this.hintText,
      this.prefixIcon,
      this.textInputAction,
      this.errorMaxLines = 1,
      this.autofocus = false,
      this.controller,
      this.isRequired = false,
      this.suffixIcon,
      this.suffixIconCallback,
      this.maxLen,
      this.focusNode,
      this.labelText,
      this.obscureText = false,
      this.errorText,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key) {
    isEnable = true;
    textInputType = TextInputType.number;

    inputFormatters = [CurrencyTextInputFormatter()];
  }

  AppTextField.phone(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.onTapFieldCallback,
      this.hintText,
      this.prefixIcon,
      required this.controller,
      this.isRequired = false,
      this.errorMaxLines = 1,
      this.autofocus = false,
      this.suffixIcon,
      this.maxLen,
      this.focusNode,
      this.labelText,
      this.suffixIconCallback,
      this.textInputAction,
      this.obscureText = false,
      this.errorText,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key) {
    isEnable = true;
    textInputType = TextInputType.phone;
    inputFormatters = [NumberTextInputFormatter()];
  }

  AppTextField.withAction(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.hintText,
      this.prefixIcon,
      this.controller,
      required this.onTapFieldCallback,
      this.isRequired = false,
      this.errorMaxLines = 1,
      this.autofocus = false,
      this.suffixIcon,
      this.maxLen,
      this.focusNode,
      this.textInputType,
      this.labelText,
      this.suffixIconCallback,
      this.textInputAction,
      this.obscureText = false,
      this.inputFormatters,
      this.errorText,
      this.onFieldSubmitted,
      this.onChanged})
      : super(key: key) {
    isEnable = false;
  }

  AppTextField.passwordOnlyDigits(
      {Key? key,
      this.isRedTextWhenError = true,
      this.contentPadding,
      this.inputBorder = const UnderlineInputBorder(),
      this.initialValue,
      this.validator,
      this.hintText,
      this.prefixIcon,
      required this.controller,
      this.autofocus = false,
      this.maxLen,
      this.focusNode,
      this.textInputAction,
      this.labelText,
      this.obscureText = true,
      this.errorMaxLines = 1,
      this.onFieldSubmitted,
      this.isRequired = false,
      this.suffixIconCallback,
      this.onTapFieldCallback,
      this.errorText,
      this.onChanged})
      : super(key: key) {
    isEnable = true;
    inputFormatters = [NumberTextInputFormatter()];
    textInputType = TextInputType.number;
  }

  final String? hintText;
  final String? errorText;
  final String? labelText;
  final Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? textInputType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool obscureText;
  List<TextInputFormatter>? inputFormatters;
  final int? maxLen;
  final TextInputAction? textInputAction;
  final int errorMaxLines;
  final Function(String)? onFieldSubmitted;
  final bool autofocus;
  final bool isRequired;

  final Function? suffixIconCallback;
  final Function? onTapFieldCallback;
  late bool isEnable;

  final String? Function(String?)? validator;
  final String? initialValue;
  final InputBorder inputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRedTextWhenError;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = widget.obscureText;
    if (widget.initialValue != null && widget.controller != null) {
      widget.controller!.text = widget.initialValue!;
    }
    super.initState();
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return _visibilityPasswordSuffix();
    }
    if (widget.suffixIcon != null) {
      return _iconSuffix();
    }

    return null;
  }

  Widget _iconSuffix() {
    return GestureDetector(
      child: widget.suffixIcon,
      onTap: () {
        if (widget.suffixIconCallback != null) widget.suffixIconCallback!();
      },
    );
  }

  Widget _visibilityPasswordSuffix() {
    return IconButton(
      icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
          if (widget.suffixIconCallback != null) widget.suffixIconCallback!();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.contentTextField.copyWith(
        color: widget.errorText != null && widget.isRedTextWhenError
            ? mBadTextColor
            : null);
    final hintStyle =
        widget.isEnable ? Theme.of(context).textTheme.hintTextField : textStyle;
    final errorStyle = Theme.of(context).textTheme.errorTextField;
    final labelStyle = Theme.of(context).textTheme.labelTextField;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.labelText!,
                style: labelStyle,
              ),
              if (widget.isRequired)
                Text(
                  ' *',
                  style: errorStyle,
                ),
            ],
          ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            widget.onTapFieldCallback!();
          },
          child: TextFormField(
            key: widget.key,
            initialValue:
                widget.controller == null ? widget.initialValue : null,
            enabled: widget.isEnable,
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: textStyle,
            cursorColor: mAccentColor,
            autofocus: widget.autofocus,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLen,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: _passwordVisible,
            keyboardType: widget.textInputType,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            validator: (value) {
              if (widget.errorText != null) return widget.errorText;
              if (widget.validator != null) return widget.validator!(value);
              return null;
            },
            decoration: InputDecoration(
                counterText: "",
                contentPadding: widget.contentPadding,
                prefixIcon: widget.prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 10.h, right: 16.w),
                        child: widget.prefixIcon,
                      )
                    : null,
                suffixIcon: _buildSuffixIcon(),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 16.w,
                  minHeight: 16.w,
                ),
                errorMaxLines: widget.errorMaxLines,
                hintText: widget.hintText,
                hintStyle: hintStyle,
                errorStyle: errorStyle,
                errorText: widget.errorText,
                enabledBorder: widget.inputBorder.copyWith(
                  borderSide: BorderSide(color: mBorderLineColor),
                  //  when the TextFormField in unfocused
                ),
                focusedBorder: widget.inputBorder.copyWith(
                  borderSide: BorderSide(color: mAccentColor),
                  //  when the TextFormField in focused
                ),
                border: widget.inputBorder,
                errorBorder: widget.inputBorder.copyWith(
                  borderSide: BorderSide(color: mBadTextColor),
                )
                // style
                ),
          ),
        ),
      ],
    );
  }
}
