import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/auth/custom_textform.dart';
import 'package:to_do_app/auth/dialog_utils.dart';

import '../../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool _obscure = true;

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
            title: Text('create account'),
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
                  CustomTextFormField(
                      label: 'User Name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter user name';
                        }
                        return null;
                      }),
                  CustomTextFormField(
                      label: 'E-mail Address',
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
                  CustomTextFormField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter uer name';
                      }
                      if (text != passwordController.text) {
                        return 'confirm password must be match password';
                      }
                      return null;
                    },
                    obscure: _obscure,
                    icon: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed: () {
                        _obscure = !_obscure;
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
                          register();
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      //todo : show dialog
      DialogUtils.showLoading(context: context, message: 'Loading...');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // todo : hide dialog
        DialogUtils.hideLoading(context);
        // todo : show message
        DialogUtils.showMessage(
            context: context,
            message: "Created Successfully",
            title: 'Welcome :)',
            posActionName: 'OK',
            posAction: () {
              Navigator.pushNamed(context, HomeScreen.routName);
            });
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          // todo : hide dialog
          DialogUtils.hideLoading(context);
          // todo : show message
          DialogUtils.showMessage(
            context: context,
            message: "The password provided is too weak",
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          // todo : hide dialog
          DialogUtils.hideLoading(context);
          // todo : show message
          DialogUtils.showMessage(
            context: context,
            message: "The account already exists for that email.",
            title: 'Notice',
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
