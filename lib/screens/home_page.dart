import 'package:flutter/material.dart';

import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> femaleAnimation;
  late Animation<Offset> maleAnimation;
  late Animation<Offset> weightAnimation;
  late Animation<Offset> ageAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    femaleAnimation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(animationController);

    maleAnimation = Tween<Offset>(
      begin: const Offset(1, -1),
      end: Offset.zero,
    ).animate(animationController);

    weightAnimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: Offset.zero,
    ).animate(animationController);

    ageAnimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  var decoration = BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        color: Global.backColor,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: femaleAnimation,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Global.chang = 1;
                          Global.chang2 = 0;
                        });
                      },
                      child: Ink(
                        child: Container(
                          height: 190,
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: (Global.chang == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (Global.chang == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (Global.chang == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: (Global.chang == 1)
                                ? const Color(0xff3b3c4d)
                                : const Color(0xff1d1e33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: maleAnimation,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Global.chang2 = 1;
                          Global.chang = 0;
                        });
                      },
                      child: Ink(
                        child: Container(
                          height: 190,
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: (Global.chang2 == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (Global.chang2 == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (Global.chang2 == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: (Global.chang2 == 1)
                                ? const Color(0xff3b3c4d)
                                : const Color(0xff1d1e33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2.5),
            Expanded(
              flex: 33,
              child: Center(
                child: Container(
                  height: 190,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff626473),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "height",
                            child: Text(
                              Global.sliderVal.toString(),
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Container(
                            height: 100,
                            alignment: const Alignment(0, 0.2),
                            child: const Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff626473),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: Global.sliderVal.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            Global.sliderVal = val.toInt();
                          });
                        },
                        thumbColor: const Color(0xffeb1555),
                        activeColor: const Color(0xfff5c1d1),
                        inactiveColor: const Color(0xff555555),
                        max: 270,
                        min: 90,
                      ),
                    ],
                  ),
                  decoration: decoration,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: weightAnimation,
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: decoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Hero(
                            tag: "weight",
                            child: Text(
                              Global.weight.toString(),
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Global.weight--;
                                    Global.changWeight1 = 1;
                                    Global.changWeight2 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: (Global.changWeight1 == 1)
                                            ? const Color(0xfff67fa4)
                                            : Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Global.changWeight1 == 1)
                                          ? const Color(0xff6e6f7a)
                                          : const Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Global.weight++;
                                    Global.changWeight2 = 1;
                                    Global.changWeight1 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: (Global.changWeight2 == 1)
                                          ? const Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Global.changWeight2 == 1)
                                          ? const Color(0xff6e6f7a)
                                          : const Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: ageAnimation,
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: decoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Hero(
                            tag: "age",
                            child: Text(
                              Global.age.toString(),
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Global.age--;
                                    Global.changAge1 = 1;
                                    Global.changAge2 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: (Global.changAge1 == 1)
                                            ? const Color(0xfff67fa4)
                                            : Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Global.changAge1 == 1)
                                          ? const Color(0xff6e6f7a)
                                          : const Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Global.age++;
                                    Global.changAge2 = 1;
                                    Global.changAge1 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: (Global.changAge2 == 1)
                                          ? const Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Global.changAge2 == 1)
                                          ? const Color(0xff6e6f7a)
                                          : const Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                double height = Global.sliderVal / 100;

                double heightSquare = height * height;
                Global.result = Global.weight / heightSquare;

                Navigator.of(context).pushNamed("calculate_page");
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: const Text(
                  "Calculate",
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
