import 'dart:convert';

import 'package:agro_app/constant/validator.dart';
import 'package:agro_app/screen/login_screen.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:agro_app/widget/custom_dailouge_box.dart';
import 'package:agro_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false;
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _message = '';
  // void loginForm(String email, String password) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     Response response =
  //         await post(Uri.parse("https://reqres.in/api/register"), body: {
  //       'email': email,
  //       'password': password,
  //     });

  //     if (response.statusCode == 200) {
  //       final responseBody = json.decode(response.body);
  //       setState(() {
  //         _message = 'Registration successful. Token: ${responseBody['token']}';
  //       });
  //       print('Account created');
  //       _showSuccessDialog(() {
  //         Future.delayed(const Duration(seconds: 2), () {
  //           Navigator.of(context).pop();
  //           Navigator.pushReplacement(context,
  //               MaterialPageRoute(builder: (context) => LoginScreen()));
  //         });
  //       });
  //     } else {
  //       print('Registration failed');
  //       _showErrorDialog('Registration failed. Please try again.');
  //     }
  //   } catch (ex) {
  //     print(ex.toString());
  //     _showErrorDialog('An error occurred. Please try again later.');
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  // void _showSuccessDialog(VoidCallback onPressed) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // Prevent dismissing the dialog
  //     builder: (context) {
  //       return CustomDialog(
  //         title: "Success",
  //         message: "Your account has been created successfully!",
  //         onPressed: onPressed,
  //         isLoading: _isLoading,
  //       );
  //     },
  //   );
  // }

  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Error'),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create your account',
                            style: TextStyle(
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
                          CustomTextField(
                            controller: _usernameController,
                            validator: usernameValidator,
                            icon: const Icon(Icons.person),
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            validator: emailValidator,
                            icon: const Icon(Icons.email),
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            validator: passwordValidator,
                            icon: const Icon(Icons.lock),
                            isPassword: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              text: 'REGISTER',
                              onPressed: () {
                                // if (_formKey.currentState?.validate() ??
                                //     false) {
                                //   loginForm(_emailController.text,
                                //       _passwordController.text);
                                // }
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }
                              },
                              width: MediaQuery.of(context).size.width),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            const Expanded(
                              child: Text(
                                "By tapping Sign Up you accept our terms and conditions",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                              child: Text(
                            "Already have an account?",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black26),
                          )),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              backGroundColor: Colors.white,
                              text: 'SIGN IN',
                              textColor: const Color.fromARGB(255, 27, 96, 199),
                              onPressed: () {},
                              width: MediaQuery.of(context).size.width)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
