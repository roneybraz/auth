import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? prefix;
  final String? hintText;
  final double? tamanhoFonte;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? hidePassword;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? enableInteractive;
  final VoidCallback? onTap;
  final Function(String)? submitFunc;
  final Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool? readOnly;
  final Function(String)? onChanged;
  final int? maxLength;
  final Widget? prefixIcon;

  const DataInput({
    Key? key,
    this.controller,
    this.label,
    this.prefix,
    this.tamanhoFonte,
    this.textInputType,
    this.hintText,
    this.hidePassword,
    this.validator,
    this.enabled,
    this.enableInteractive,
    this.suffixIcon,
    this.onTap,
    this.inputFormatters,
    this.onSaved,
    this.focusNode,
    this.submitFunc,
    this.textInputAction,
    this.readOnly,
    this.onChanged,
    this.maxLength,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText2,
      controller: controller,
      focusNode: focusNode,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: hidePassword ?? false,
      validator: validator,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLength: maxLength,
      onFieldSubmitted: submitFunc,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyText1,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.heightMultiplier! * 1,
            horizontal: AppSize.heightMultiplier! * 0.5),
        labelText: label,
        prefixText: prefix,
        hintText: hintText,
        counterText: "",
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppTheme.colorBackgroundBlue, width: 1.5),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppTheme.colorBackgroundBlue, width: 0.5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppTheme.colorBackgroundBlue, width: 0.5),
        ),
        border: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppTheme.colorBackgroundBlue, width: 1.5),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
      ),
      enabled: enabled ?? true,
      enableInteractiveSelection: enableInteractive ?? true,
    );
  }
}
