import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DefaultButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;

  const DefaultButton(
      {Key? key,
      required this.textButton,
      required this.onPressed,
      this.color = const Color(0xff184c85),
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: AppSize.screenWidth!),
        decoration: BoxDecoration(
          color: AppTheme.defaultGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: MaterialButton(
          height: 20,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(15.5),
            child: Text(
              textButton,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}
