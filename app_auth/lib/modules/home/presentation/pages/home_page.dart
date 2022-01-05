import 'package:app_auth/app_injection_container.dart';
import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:app_auth/modules/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: AppTheme.colorBackgroundBlue),
        ),
        title: const Text("Perfil"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/auth', (r) => false);
              })
        ],
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => sl<HomeBloc>()..add(getUserEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.colorBackgroundBlue,
                ),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            } else if (state is HomeLoadedState) {
              return Container(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage(state.responseHomeEntity.avatar!),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: AppSize.widthMultiplier! * 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.responseHomeEntity.firstName!,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            state.responseHomeEntity.email!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
