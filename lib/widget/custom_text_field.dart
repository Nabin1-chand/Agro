import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Icon icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Icon? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  CustomTextField(
      {super.key,
      required this.icon,
      this.controller,
      this.onChanged,
      this.isPassword = false,
      this.validator,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            width: 2.0,
            color: Color.fromARGB(255, 7, 101, 179),
          ),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 199, 199, 199),
        prefixIcon: widget.icon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: Icon(_isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off))
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      keyboardType: TextInputType.text,
    );
  }
}
