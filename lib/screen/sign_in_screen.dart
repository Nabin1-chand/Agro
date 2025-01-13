import 'package:agro_app/widget/custom_button.dart';
import 'package:agro_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    final TextEditingController _passwordController = TextEditingController();
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
                          'Create your account',
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
                        CustomTextField(
                          controller: _usernameController,
                          icon: const Icon(Icons.person),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          icon: const Icon(Icons.email),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          icon: const Icon(Icons.lock),
                          isPassword: true,
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            text: 'REGISTER',
                            onPressed: () {},
                            width: MediaQuery.of(context).size.width),
                        SizedBox(
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
                          Expanded(
                            child: Text(
                              "By tapping Sign Up your accept our terms and condition",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "Already have account",
                          style: TextStyle(fontSize: 18, color: Colors.black26),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            backGroundColor: Colors.white,
                            text: 'SIGN IN',
                            textColor: Color.fromARGB(255, 27, 96, 199),
                            onPressed: () {},
                            width: MediaQuery.of(context).size.width)
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
