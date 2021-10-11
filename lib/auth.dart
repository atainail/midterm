import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/register.dart';
import 'package:midterm/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:midterm/credentials.dart';
import 'package:midterm/sign_up.dart';

class Auth extends StatelessWidget {
  Auth({Key? key})
      : super(
          key: key,
        );

  late TextEditingController _emailController,
      _reemailController,
      _passwordController,
      _repasswordController,
      _firstnameController,
      _lastnameController,
      _phoneController;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextBox(
            hint: 'Enter your Email',
            label: "Email",
            iconType: Icons.email,
            isObscure: false,
            myController: _emailController,
          ),
          TextBox(
            hint: 'Enter your Password',
            label: "Password",
            iconType: Icons.lock,
            isObscure: true,
            myController: _passwordController,
          ),
          LinkButton(buttonText: "Submit", destination: SignIn()),
          const Text(" "),
          const Text("OR"),
          const Text(" "),
          TextBox(
            hint: 'Enter your Phone Number',
            label: "Number",
            iconType: Icons.phone,
            isObscure: false,
            myController: _phoneController,
          ),
          LinkButton(buttonText: "Submit", destination: SignIn()),
          const Text(" "),
          const Text("OR"),
          const Text(" "),
          Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/fbook icon.png',
                height: 25,
                width: 25,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/google icon.png',
                height: 25,
                width: 25,
              ),
            ),
          ])),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  TextBox({
    Key? key,
    required this.hint,
    required this.label,
    required this.iconType,
    required this.isObscure,
    this.myController,
    this.myReController,
  }) : super(
          key: key,
        );
  String hint, label;
  IconData iconType = Icons.email;
  bool isObscure = false;
  var myController;
  var myReController;

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      TextFormField(
        controller: myController,
        autocorrect: false,
        obscureText: isObscure,
        decoration: InputDecoration(
          icon: Icon(iconType),
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value != myReController.text) {
            return 'Does not match';
          }
          return null;
        },
      ),
      const SizedBox(height: 5),
    ]));
  }
}
