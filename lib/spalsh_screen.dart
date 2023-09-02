import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirole/home_screen.dart';
import 'package:multirole/login_screen.dart';
import 'package:multirole/student_screen.dart';
import 'package:multirole/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}):super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class  _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if (isLogin) {
      if (userType == 'student') {
        Timer(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if (userType == 'teacher') {
        Timer(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherView()));
        });
      } else {
        Timer(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: AssetImage("assets/newimage.jpg"),),
    );
  }
}


