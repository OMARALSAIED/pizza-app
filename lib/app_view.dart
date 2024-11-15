import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza/screens/auth/views/welecome_screen.dart';
import 'package:pizza/screens/home/view/home_screen.dart';

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
              onBackground: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white)),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return HomeScreen();
        } else {
          return WelecomeScreen();
        }
      }),
    );
  }
}
