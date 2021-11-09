import 'dart:ui';

import 'package:flutter/material.dart';

final signupPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(145, 131, 222, 1),
  Color.fromRGBO(160, 148, 227, 1),
]);
final signupDarkPurple = Color.fromRGBO(82, 67, 154, 1);

final loginPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(229, 178, 202, 1),
  Color.fromRGBO(205, 130, 222, 1),
]);
final loginDarkPurple = Color.fromRGBO(120, 37, 139, 1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bar ve Onboard Screen',
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(145, 131, 222, 1),
          Color.fromRGBO(160, 148, 227, 1),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('AppBar ve Onboardscreen'),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  
                  SizedBox(height: topPadding),
                  SizedBox(height: 10),
                  AnimatedImage(),
                  Text(
                    'Merhaba',
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'ZenKurenaido',
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    'Bu uygulamayı ilk ödev olan appbar ve ikinci ödev olan Onboardscreen Uygulamasını birleştirerek hazırladım.'
                        'Aynı zamanda uygulama içerisinde animasyon ve google fonts kullandım.Satır sayısını max lines ile sınırladım',
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'ZenKurenaido',
                      color: Colors.white,
                    ),
                  ),

              SizedBox(
                width: 200,
                height: 60,
              ),
              OutlinedButton(

                onPressed: () {
                  print('Received click');
                },
                child: const Text('Ben Bir Outline Butonum',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),

                ),

              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/clouds.png'),
        SlideTransition(
          position: _animation,
          child: Image.asset('images/rocket_person.png'),
        ),
      ],
    );
  }
}
