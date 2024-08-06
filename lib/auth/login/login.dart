import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/auth/custom_textform.dart';
import 'package:to_do_app/auth/register/register_screen.dart';
import 'package:to_do_app/home/home_screen.dart';

import '../dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.backgroundLightColor,
          child: Image.asset(
            'assets/images/sign.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('Login'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Welcome Back!',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.blackColor)),
                  ),
                  CustomTextFormField(
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your email';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'please enter vaalid email';
                        }
                        return null;
                      }),
                  CustomTextFormField(
                    label: 'Password',
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      if (text.length < 6) {
                        return 'password must be > 6 characters.';
                      }
                      return null;
                    },
                    obscure: obscure,
                    icon: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routName);
                      },
                      child: Text('or Create Account'))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      /// Login
      //todo : show dialog
      DialogUtils.showLoading(context: context, message: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text); // todo : hide dialog
        DialogUtils.hideLoading(context);
        // todo : show message
        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            title: 'Success :)',
            posActionName: 'OK',
            posAction: () {
              Navigator.pushNamed(context, HomeScreen.routName);
            });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          print('No user found for that email.\n or the password Wrong');
          // todo : hide dialog
          DialogUtils.hideLoading(context);
          // todo : show message
          DialogUtils.showMessage(
            context: context,
            message: 'No user found for that email.\n or the password Wrong',
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (e.code == 'network-request-failed') {
          print('erro.');
          // todo : hide dialog
          DialogUtils.hideLoading(context);
          // todo : show message
          DialogUtils.showMessage(
            context: context,
            message: "Network Error.",
            title: 'Error',
            posActionName: 'OK',
          );
        }
      } catch (e) {
        print(e);
        // todo : hide dialog
        DialogUtils.hideLoading(context);
        // todo : show message
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: 'Error',
          posActionName: 'OK',
        );
      }
    }
  }
}
