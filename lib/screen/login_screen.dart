import 'dart:convert';

import 'package:agro_app/constant/validator.dart';
import 'package:agro_app/screen/home_screen.dart';
import 'package:agro_app/screen/sign_in_screen.dart';
import 'package:agro_app/screen/widget/rember_me_widget.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:agro_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  String? _message = '';

  get http => null;

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        setState(() {
          _message = 'Login successful. Token: ${responseBody['token']}';
        });
      } else {
        setState(() {
          _message = 'Failed to log in. Please check your credentials.';
        });
      }
    } catch (error) {
      setState(() {
        _message = 'An error occurred. Please try again later.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                                          login(_emailController.text,
                                              _passwordController.text);
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
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                "Don't have an account",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black26),
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                  backGroundColor: Colors.white,
                                  text: 'CREATE AN ACCOUNT',
                                  textColor: Color.fromARGB(255, 27, 96, 199),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
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
