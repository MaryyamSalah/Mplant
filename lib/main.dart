import 'package:flutter/material.dart';
import 'package:mplant/screens/constant.dart';
import 'package:mplant/screens/home_screen.dart';
import 'package:mplant/screens/menu.dart';
import 'package:mplant/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'MeryPlant',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      

      initialRoute: '/',
  routes: {
    
    '/': (context) => const HomeScreen(),
    
    '/menu': (context) =>   NavDrawer(),
    '/profile': (context) => MyProfile(),
  },

    );
  }
}

