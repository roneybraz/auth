import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:app_auth/core/widgets/background.dart';
import 'package:app_auth/core/widgets/data_input.dart';
import 'package:app_auth/core/widgets/default_button.dart';
import 'package:app_auth/modules/auth/presentation/widgets/login_container.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  bool? isPasswordIcon = true;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.heightMultiplier! * 20,
                ),
                LoginContainer(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Olá!, acesse sua conta.",
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 2,
                        ),
                        DataInput(
                          controller: _emailController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hidePassword: isPasswordIcon,
                          label: "Email",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppTheme.defaultBlue,
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 2,
                        ),
                        DataInput(
                          controller: _passwordController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hidePassword: isPasswordIcon,
                          label: "Senha",
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppTheme.defaultBlue,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordIcon!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppTheme.defaultBlue,
                            ),
                            onPressed: () {},
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 4,
                        ),
                        DefaultButton(
                          height: AppSize.heightMultiplier! * 7,
                          width: AppSize.widthMultiplier! * 100,
                          textButton: 'Entrar',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
