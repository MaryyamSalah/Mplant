
import 'package:flutter/material.dart';
import 'package:mplant/components/body.dart';
import 'package:mplant/screens/constant.dart';
import 'package:mplant/screens/menu.dart';
import 'package:mplant/screens/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: buildAppBar(context),
      body: Body() ,
        bottomNavigationBar: Container(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(
                Icons.person,
                color: Colors.green,
                size: 35,
              ),
            ),
            IconButton(
             
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.green,
                size: 35,
              ),
            ),
            IconButton(
             
              onPressed: () {
                Navigator.pushNamed(context, '/plantList');},
              icon: const Icon(
                Icons.grass_outlined,
                color: Colors.green,
                size: 35,
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(icon: const Icon(Icons.menu_open), onPressed: () { 
        Navigator.pushNamed(context, '/menu');
       },),
      
      
      );
  }
}