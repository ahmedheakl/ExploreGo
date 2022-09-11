import 'package:explorego/components/password_field_input.dart';
import 'package:explorego/pages/main_page.dart';
import 'package:explorego/pages/signup_page.dart';
import 'package:explorego/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:explorego/utils/colors.dart';
import 'package:explorego/utils/logo.dart';
import 'package:explorego/components/text_field_input.dart';
import 'package:explorego/resources/auth_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "success") {
      navigate();
      setState(() {
        _isLoading = false;
        showSnackBar(context, "Logged in.");
      });
    } else {
      setState(() {
        _isLoading = false;
        showSnackBar(context, res);
      });
    }
  }

  void navigate() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                // Logo
                getLogo(30),
                const SizedBox(height: 64),
                // Email input
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your email",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 24,
                ),
                // Password input
                PasswordFieldInput(
                    textEditingController: _passwordController,
                    hintText: "Enter your password"),
                const SizedBox(
                  height: 24,
                ),
                // Login Button
                InkWell(
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: redColor,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Log in",
                              style: TextStyle(color: Colors.white))),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    loginUser();
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                // Logout case
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Text("Don't have an account? ",
                            style: TextStyle(fontSize: 18))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              "Signup.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
