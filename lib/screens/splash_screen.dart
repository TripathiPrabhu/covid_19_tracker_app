import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  
  late final AnimationController _animation = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    Timer(Duration(seconds: 4),
            ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:AppBar(title: Text('Covin-APP',),centerTitle: true,) ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            AnimatedBuilder(
                animation: _animation,
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('images/virus.png'),
                  ),
                ),
                builder: (BuildContext context, Widget? child){
                  return Transform.rotate(
                      angle: _animation.value* 2.0 *math.pi,
                    child: child,
                  );
                }
                ),
            SizedBox(height: 40,),
            Text('Covid-19\n Tracker App',textAlign: TextAlign.center,  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),)
          ],
        ),
        ),);
  }
}
