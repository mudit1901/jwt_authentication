import 'package:flutter/material.dart';
import 'package:login_signup/screens/signup_screen.dart';
import 'package:login_signup/services/auth_service.dart';
import 'package:login_signup/utils/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthService _authService = AuthService();

  void loginUser() {
    _authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF3a41c6),
              Color(0xFF3d3bbb),
              Color(0xFF4634a7),
              Color(0xFF4c2c96),
              Color(0xFF512888)
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        CustomTextField(
                            hintText: 'Email Here',
                            controller: emailController,
                            icon: Icons.email,
                            isPassword: false,
                            textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            hintText: 'Password Here',
                            controller: passwordController,
                            icon: Icons.lock,
                            isPassword: true,
                            textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: loginUser,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFF3a41c6),
                              Color(0xFF3d3bbb),
                              Color(0xFF4634a7),
                              Color(0xFF4c2c96),
                              Color(0xFF512888)
                            ])),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
                            );
                          },
                          child: const Text('Donot have Account? Register'),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )));
  }
}
