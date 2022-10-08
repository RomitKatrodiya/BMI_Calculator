import 'package:flutter/material.dart';

import '../global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed("/"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backColor2,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Image.asset("assets/images/bmi.png", width: 270),
            const SizedBox(height: 20),
            const Hero(
              tag: "bmi",
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(flex: 2),
            Theme(
              data: ThemeData(primarySwatch: Colors.pink),
              child: const CircularProgressIndicator(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
