import 'package:flutter/material.dart';

class PasswordFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const PasswordFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  @override
  State<PasswordFieldInput> createState() => _PasswordFieldInputState();
}

class _PasswordFieldInputState extends State<PasswordFieldInput> {
  bool _active = true;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if (_active) {
                  _active = false;
                } else {
                  _active = true;
                }
              });
            },
            icon: _active
                ? const Icon(Icons.visibility_rounded, size: 20)
                : const Icon(Icons.visibility_off_rounded, size: 20),
          )),
      keyboardType: TextInputType.text,
      obscureText: _active,
    );
  }
}
