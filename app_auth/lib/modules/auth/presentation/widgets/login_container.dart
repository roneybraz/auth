import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      width: AppSize.widthMultiplier! * 100,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 7),
        ],
      ),
      child: Container(
          alignment: Alignment.center,
          margin:
              const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
          child: child),
    );
  }
}
