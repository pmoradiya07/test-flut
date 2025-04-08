// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/utilities/colors.dart';
import 'package:my_app/utilities/text.dart';
import 'package:swipe_to/swipe_to.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: ' ',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    super.initState();
    _navigatotohome();
  }

  _navigatotohome() async {
    await Future.delayed(Duration(seconds: 3));
    Get.to(SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/logo.png"),
            SizedBox(height: 25,),
            Text(txt().mnyg, style: TextStyle(fontFamily: "Rockwell", fontSize: 40, color: Color.fromRGBO(11, 146, 105, 1), fontWeight: FontWeight.bold)),
            Spacer()
          ],
        ),
        )
      );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeTo(
        onLeftSwipe: () {
          Get.to(Home());
        },
        child: Column(
          children: [
            SizedBox(height: 130),
            Container(
              height: 500,
              width: 393,
              child: Image.asset("assets/images/splash.png")
            ),
            Text(txt().frsttxt, style: TextStyle(fontFamily: "InriaSans"), textAlign: TextAlign.center,),
            Text(txt().frstyg, style: TextStyle(color: clr().mnclr), textAlign: TextAlign.center, ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 42, right: 20, bottom: 74),
              child: Stack(
                children: [
                  Container(
                    height:50 ,
                    width: 331,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Stack(
                      children: [
                        Container(
                          height: 40,
                          width: 331,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Color.fromRGBO(19, 164, 120, 1), width: 3)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 88),
                            child: Row(
                              children: [
                                Text("Swipe to start", style: TextStyle(color: Color.fromRGBO(19, 164, 120, 1), fontSize: 15, fontWeight: FontWeight.w400), textAlign: TextAlign.center, ),
                                Image.asset("assets/icons/arrow.png")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(19, 164, 120, 1),
                      radius: 25,
                      child: Image.asset("assets/icons/Yoga.png"),),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _asanas = [];

  Future<void> jsonReader () async {
    final String response = await rootBundle.loadString("assets/json/demo.json");
    final data = await json.decode(response);
    setState(() {
      _asanas = data["asanas"];
    });
  }

  @override
  void initState() {
    super.initState();
  jsonReader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 47),
              Image.asset("assets/images/tinyLogo.png"),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  height: 20,
                  child: SearchBar(
                    hintText: "Search here"
                  )
                ),
              ),
              ListTile()
            ],
          ),
        ),
      ),
    );
  }
}
