import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:pizza/screens/auth/views/welecome_screen.dart';
import 'package:pizza/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza/screens/home/view/home_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class MyappView extends StatelessWidget {
  const MyappView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Delevriy',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade100,
              onSurface: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white)),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) => SignInBloc(
                    context.read<AuthenticationBloc>().userRepository)),
            BlocProvider(create: (context) => GetPizzaBloc(
              FirebasePizzaRepo()
            )..add(GetPizza()))
          ], child: const HomeScreen());
        } else {
          return const WelecomeScreen();
        }
      }),
    );
  }
}
