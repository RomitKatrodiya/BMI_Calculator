import 'package:flutter/material.dart';

import '../global.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var decoration = BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(10),
  );

  var textStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xffeb1555),
    fontSize: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backColor,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Global.backColor,
        centerTitle: true,
        elevation: 0,
        title: const Hero(
          tag: "bmi",
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              decoration: decoration,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  Height",
                        style: textStyle,
                      ),
                      const SizedBox(width: 20),
                      Hero(
                        tag: "height",
                        child: Text(
                          Global.sliderVal.toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff626473),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: textStyle,
                      ),
                      const SizedBox(width: 20),
                      Hero(
                        tag: "weight",
                        child: Text(
                          Global.weight.toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "kg  ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff626473),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  Age     ",
                        style: textStyle,
                      ),
                      const SizedBox(width: 20),
                      Hero(
                        tag: "age",
                        child: Text(
                          Global.age.toString(),
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "year",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff626473),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: decoration,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  Text(
                    "Your BMI",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Global.result.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    (Global.result <= 18.5)
                        ? "Under Weight"
                        : (Global.result >= 18.5 && Global.result <= 24.9)
                            ? "Normal Weight"
                            : (Global.result >= 25.0 && Global.result <= 29.9)
                                ? "Pre-obesity"
                                : (Global.result >= 30.0 &&
                                        Global.result <= 34.9)
                                    ? "Obesity Class i"
                                    : (Global.result >= 35.0 &&
                                            Global.result <= 39.9)
                                        ? "Obesity Class ii"
                                        : "Obesity Class iii",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: const Text(
                  "Recalculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffeb1555),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
