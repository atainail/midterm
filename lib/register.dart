import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/register.dart';
import 'package:midterm/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:midterm/credentials.dart';
import 'package:midterm/sign_up.dart';
/*
class Register extends StatefulWidget {
  Register(
      {Key? key,
       emailController,
       passwordController,
       phoneController})
      : super(
          key: key,
        );
  static late TextEditingController emailController;
  static late TextEditingController passwordController;
  static late TextEditingController phoneController;

  @override
  _RegisterState createState() => _RegisterState();
  
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  late TextEditingController 
      emailController = Register.emailController,
      reemailController,
      passwordController = Register.passwordController,
      repasswordController,
      firstnameController,
      lastnameController,
      phoneController = Register.phoneController;

  @override
  void initState() {
    emailController = TextEditingController();
    reemailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    reemailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      _db
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
            "first_name": firstnameController.text,
            "last_name": lastnameController.text,
            "phone": phoneController.text,
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

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

*/
