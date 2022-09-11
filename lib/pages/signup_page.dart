import 'dart:typed_data';

import 'package:explorego/components/password_field_input.dart';
import 'package:explorego/pages/main_page.dart';
import "package:flutter/material.dart";
import 'package:explorego/utils/colors.dart';
import 'package:explorego/utils/logo.dart';
import 'package:explorego/components/text_field_input.dart';
import 'package:explorego/resources/auth_methods.dart';
import 'package:explorego/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        file: _image!);
    if (res == "success") {
      setState(() {
        _isLoading = false;
        showSnackBar(context, "Signed Up.");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage()));
      });
    } else {
      setState(() {
        _isLoading = false;
        showSnackBar(context, res);
      });
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(flex: 2, child: Container()),
                      // Logo
                      getLogo(30),
                      const SizedBox(height: 24),
                      // Create a photo
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                  backgroundColor: redColor,
                                )
                              : const CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                  backgroundColor: redColor,
                                ),
                          Positioned(
                              bottom: -10,
                              left: 80,
                              child: IconButton(
                                onPressed: () {
                                  selectImage();
                                },
                                icon: const Icon(Icons.add_a_photo_rounded),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // Name input
                      TextFieldInput(
                          textEditingController: _nameController,
                          hintText: "Enter your name",
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 24,
                      ),
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
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("Sign Up",
                                    style: TextStyle(color: Colors.white))),
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          signUpUser();
                        },
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Text("Already have an account? ",
                                  style: TextStyle(fontSize: 18))),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: const Text(
                                    "Login.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ))),
                        ],
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
