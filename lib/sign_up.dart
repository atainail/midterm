import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/auth.dart';
import 'package:midterm/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late TextEditingController _emailController,
      _reemailController,
      _passwordController,
      _repasswordController,
      _firstnameController,
      _lastnameController,
      _phoneController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _reemailController = TextEditingController();
    _passwordController = TextEditingController();
    _repasswordController = TextEditingController();
    _firstnameController = TextEditingController();
    _lastnameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _reemailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
        key: _formKey,
        child: Column(children: [
          BasicView(title: 'Sign Up'),
          TextBox(
            hint: 'Enter your Email',
            label: "Email",
            iconType: Icons.email,
            isObscure: false,
            myController: _emailController,
          ),
          TextBox(
            hint: 'RE-enter your Email',
            label: "Email",
            iconType: Icons.email,
            isObscure: false,
            myReController: _reemailController,
          ),
          TextBox(
            hint: 'Enter your Password',
            label: "Password",
            iconType: Icons.lock,
            isObscure: true,
            myController: _passwordController,
          ),
          TextBox(
            hint: 'RE-enter your Password',
            label: "Password",
            iconType: Icons.email,
            isObscure: false,
            myReController: _repasswordController,
          ),
          OutlinedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')));

                setState(() {
                  register();
                });
              }
            },
            child: const Text('Submit'),
          )
        ]));
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      _db
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
            "first_name": _firstnameController.text,
            "last_name": _lastnameController.text,
            "phone": _phoneController.text,
          })
          .then((value) => null)
          .onError((error, stackTrace) => null);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something Else")));
    } catch (e) {
      print(e);
    }

    setState(() {});
  }
}

class BasicView extends StatelessWidget {
  BasicView({Key? key, required this.title}) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 60, fontFamily: 'RobotoMono'),
            textAlign: TextAlign.center,
          ),
          Auth(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_return),
      ),
    );
  }
}
