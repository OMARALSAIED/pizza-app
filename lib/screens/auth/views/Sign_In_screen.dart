import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/my_text_Filed.dart';
import 'package:pizza/helpers/app.regex.dart';
import 'package:pizza/helpers/styles.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconpassword = CupertinoIcons.eye_fill;
  bool obscurepassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInLoading) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailuer) {
          setState(() {
            signInRequired = false;
            _errorMsg = "Invaild email or password";
          });
        }
      },
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: AppTextFormFiled(
                  hinttext: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(CupertinoIcons.mail_solid),
                  validator: (val) {
                    if (val == null ||
                        val.isEmpty ||
                        !AppRegex.isEmailValid(val)) {
                      return 'please enter a vaild email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: AppTextFormFiled(
                  hinttext: 'Password',
                  isObscreText: obscurepassword,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(CupertinoIcons.lock_fill),
                  validator: (val) {
                    if (val == null ||
                        val.isEmpty ||
                        !AppRegex.isPasswordValid(val)) {
                      return 'Please enter a vaild password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurepassword = !obscurepassword;
                        if (obscurepassword) {
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
              const SizedBox(
                height: 20,
              ),
              !signInRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                        onPressed: () {
                          if (_formkey.currentState != null &&
                              _formkey.currentState!.validate()) {
                            context.read<SignInBloc>().add(SignInRequired(
                                emailController.text, passwordController.text));
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
                          child: Text("Sign in",
                              textAlign: TextAlign.center,
                              style: Styles.font13w600),
                        ),
                      ),
                    )
                  : CircularProgressIndicator()
            ],
          )),
    );
  }
}
