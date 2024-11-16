import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/my_text_Filed.dart';
import 'package:pizza/helpers/app.regex.dart';
import 'package:pizza/helpers/styles.dart';
import 'package:pizza/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final  _formkey = GlobalKey<FormState>();
  IconData iconpassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpReqired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpeicalChar = false;
  bool contains8Lenght = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpReqired = false;
          });
        } else if (state is SignUpLoading) {
          setState(() {
            signUpReqired = true;
          });
        } else if (state is SignUpFailuer) {
          return;
        }
      },
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AppTextFormFiled(
                controller: emailController,
                hinttext: 'Email',
                validator: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      !AppRegex.isEmailValid(val)) {
                    return 'Please enter a vaild email';
                  }
                   return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AppTextFormFiled(
                isObscreText: obscurePassword,
                controller: passwordController,
                hinttext: 'Password',
                validator: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      !AppRegex.isPasswordValid(val)) {
                    return 'Please enter a vaild password';
                  }
                   return null;
                },
                onChanged: (val) {
                    if(val!.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        containsUpperCase = true;
                      });
                    } else {
                      setState(() {
                        containsUpperCase = false;
                      });
                    }
                    if(val.contains(RegExp(r'[a-z]'))) {
                      setState(() {
                        containsLowerCase = true;
                      });
                    } else {
                      setState(() {
                        containsLowerCase = false;
                      });
                    }
                    if(val.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        containsNumber = true;
                      });
                    } else {
                      setState(() {
                        containsNumber = false;
                      });
                    }
                    if(val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
                      setState(() {
                        containsSpeicalChar = true;
                      });
                    } else {
                      setState(() {
                        containsSpeicalChar = false;
                      });
                    }
                    if(val.length >= 8) {
                      setState(() {
                        contains8Lenght = true;
                      });
                    } else {
                      setState(() {
                        contains8Lenght = false;
                      });
                    }
                    return null;
                  },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      if (obscurePassword) {
                        iconpassword = CupertinoIcons.eye_fill;
                      } else {
                        iconpassword = CupertinoIcons.eye_slash_fill;
                      }
                    });
                  },
                  icon: Icon(iconpassword),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚈  1 uppercase",
                      style: TextStyle(
                          color: containsUpperCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "⚈  1 lowercase",
                      style: TextStyle(
                          color: containsLowerCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "⚈  1 number",
                      style: TextStyle(
                          color: containsNumber
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "⚈  1 special character",
                      style: TextStyle(
                          color: containsSpeicalChar
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "    ⚈  8 minimum character",
                      style: TextStyle(
                          color: contains8Lenght
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AppTextFormFiled(
                hinttext: 'Name',
                controller: nameController,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(CupertinoIcons.person_fill),
                validator: (val) {
                  if (val == null || val.isEmpty || AppRegex.ishasNumber(val)) {
                    return 'Please enter a vaild name';
                  } else if (val.length > 30) {
                    return 'Name too long';
                  }
                   return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            !signUpReqired
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          MyUser myUser = MyUser.empty;
                          myUser.email = emailController.text;
                          myUser.name = nameController.text;
      
                          setState(() {
                            context.read<SignUpBloc>().add(
                                SignUpReqired(myUser, passwordController.text));
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: Styles.font13w600),
                      ),
                    ))
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
