import 'package:flutter/material.dart';

 class DefaultFomField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final FormFieldValidator<String> validate;
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final bool isPassword;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final bool isClickable;
  DefaultFomField({
    Key? key,
    required this.controller,
    required this.type,
    this.onChanged,
    this.onSubmit,
    required this.validate,
    required this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.onTap,
    this.isClickable = true,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
            : null,
      ),
    );
  }
}
