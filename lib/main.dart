import 'package:flutter/material.dart';
import 'package:midterm/sign_in.dart';
import 'package:midterm/sign_up.dart';
import 'package:midterm/anonymous.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            LinkButton(buttonText: 'Go to Sign In', destination: SignIn()),
            LinkButton(buttonText: 'Go to Sign Up', destination: SignUp()),
            LinkButton(buttonText: 'Go Anonymously', destination: Anonymous()),
          ]),
        ));
  }
}

class LinkButton extends StatelessWidget {
  LinkButton({Key? key, required this.buttonText, required this.destination})
      : super(key: key);
  String buttonText;
  Widget destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => destination));
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
