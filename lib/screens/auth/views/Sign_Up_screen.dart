import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/my_text_Filed.dart';
import 'package:pizza/helpers/app.regex.dart';
import 'package:pizza/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  IconData iconpassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpReqired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpericalChar = false;
  bool contains8Lenght = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
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
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20,
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
                },
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
