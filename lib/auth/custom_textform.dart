import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';

typedef myValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String label;

  /// String? Function(String?) validator;  ( or )
  myValidator validator;
  TextInputType keyboardType;
  TextEditingController controller;
  bool obscure;
  Widget? icon;

  CustomTextFormField(
      {required this.label,
      required this.validator,
      required this.controller,
      this.icon,
      this.keyboardType = TextInputType.name,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: icon,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 3)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3)),
          labelText: label,
          // labelStyle: Theme.of(context).textTheme.labelLarge
        ),
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscure,
      ),
    );
  }
}
