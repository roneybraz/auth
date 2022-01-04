import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.screenHeight,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: AppTheme.defaultBlue),
          child: const Align(
            alignment: Alignment.bottomCenter,
          ),
        ),
        GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: child),
      ],
    );
  }
}
