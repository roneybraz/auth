import 'package:app_auth/app_injection_container.dart';
import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:app_auth/core/util/validate_input_information.dart';
import 'package:app_auth/core/widgets/background.dart';
import 'package:app_auth/core/widgets/data_input.dart';
import 'package:app_auth/core/widgets/default_button.dart';
import 'package:app_auth/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_auth/modules/auth/presentation/widgets/login_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  bool isPasswordIcon = true;

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
                        Text(
                          "Olá!, acesse sua conta.",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 2,
                        ),
                        DataInput(
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          label: "Email",
                          validator: validateEmail,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppTheme.colorBackgroundBlue,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 2,
                        ),
                        DataInput(
                          controller: _passwordController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hidePassword: isPasswordIcon,
                          validator: validatePassword,
                          label: "Senha",
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppTheme.colorBackgroundBlue,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordIcon
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppTheme.colorBackgroundBlue,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordIcon = !isPasswordIcon;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 6,
                        ),
                        BlocProvider<AuthBloc>(
                          create: (context) => sl<AuthBloc>(),
                          child: BlocListener<AuthBloc, AuthState>(
                            listener: (context, state) async {
                              if (state is AuthErrorState) {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      contentPadding: const EdgeInsets.all(50),
                                      title: Center(
                                          child: Text(
                                        state.message,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      )),
                                      children: [
                                        DefaultButton(
                                            height:
                                                AppSize.heightMultiplier! * 7,
                                            width:
                                                AppSize.widthMultiplier! * 50,
                                            textButton: 'OK',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    );
                                  },
                                );
                              } else if (state is AuthLoadedState) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home_page', (r) => false);
                              }
                            },
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is AuthLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppTheme.colorBackgroundBlue,
                                    ),
                                  );
                                }
                                return DefaultButton(
                                  height: AppSize.heightMultiplier! * 7,
                                  width: AppSize.widthMultiplier! * 100,
                                  textButton: 'Entrar',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      context.read<AuthBloc>().add(
                                          AuthLoginEvent(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text));
                                    } else {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.heightMultiplier! * 2,
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
