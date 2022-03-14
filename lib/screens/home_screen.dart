
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
                color: Colors.grey,
                size: 35,
              ),
            ),
              IconButton(
              
              onPressed: () {Navigator.pushNamed(context, '/notification');
                
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
                size: 35,
              ),
            ),
            IconButton(
             
              onPressed: () {
                Navigator.pushNamed(context, '/upload');
              },
              icon: const Icon(
                Icons.add_circle_outline_rounded,
                color: Color(0xFF0C9869),
                size:35,
              ),
            ),
              IconButton(
              
              onPressed: () { Navigator.pushNamed(context, '/message');
                
              },
              icon: const Icon(
                Icons.message,
                color: Colors.grey,
                size: 35,
              ),
            ),
            IconButton(
             
              onPressed: () {
                Navigator.pushNamed(context, '/plantList');},
              icon: const Icon(
                Icons.grass_outlined,
                color: Colors.grey,
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