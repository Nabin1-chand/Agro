import 'dart:convert';

import 'package:agro_app/constant/validator.dart';
import 'package:agro_app/screen/home_screen.dart';
import 'package:agro_app/screen/navigation_screen.dart';
import 'package:agro_app/screen/sign_in_screen.dart';
import 'package:agro_app/screen/widget/rember_me_widget.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:agro_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _rememberMeNotifier = ValueNotifier<bool>(false);
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 27, 96, 199),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 27, 96, 199),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      'tanam',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Grocery App',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back',
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          style: TextStyle(color: Colors.black26),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _emailController,
                                icon: const Icon(Icons.person),
                                onChanged: (value) {},
                                validator: emailValidator,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                controller: _passwordController,
                                icon: const Icon(Icons.lock),
                                isPassword: true,
                                onChanged: (value) {},
                                validator: passwordValidator,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CustomButton(
                                      text: 'SIGN IN',
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // login(_emailController.text,
                                          //     _passwordController.text);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNavigationScreen()));
                                        }
                                      },
                                      width: MediaQuery.of(context).size.width),
                              const SizedBox(
                                height: 20,
                              ),
                              ValueListenableBuilder<bool>(
                                  valueListenable: _rememberMeNotifier,
                                  builder: (context, rememberMe, child) {
                                    return RememberMeRow(
                                        remeberMe: rememberMe,
                                        onRememberMeChanged: (value) {
                                          _rememberMeNotifier.value =
                                              value ?? false;
                                        },
                                        onForgetPassword: () {});
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                  child: Text(
                                "Don't have an account",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black26),
                              )),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                  backGroundColor: Colors.white,
                                  text: 'CREATE AN ACCOUNT',
                                  textColor:
                                      const Color.fromARGB(255, 27, 96, 199),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignInScreen()));
                                  },
                                  width: MediaQuery.of(context).size.width)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
