import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('MeryPlant'),
            accountEmail: Text('Meryplant@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'asset/images/profile.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green[900],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('asset/images/plants.png'),
               ),
            ),
          ),
           ListTile(
            leading: Icon(Icons.home,color: Colors.green,),
            title: Text('Home'),
            onTap: () => {
              Navigator.pushNamed(context, '/'),
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_rounded,color: Colors.green,),
            title: Text('Buy'),
            onTap: () => { Navigator.pushNamed(context, '/plantList'),},
          ),
          ListTile(
            leading: Icon(Icons.share,color: Colors.green,),
            title: Text('Share'),
            onTap: () => { Navigator.pushNamed(context, '/share')},
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.green,),
            title: Text('Setting'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.border_color,color: Colors.green,),
            title: Text('Feedback'),
            onTap: () => {Navigator.pushNamed(context,'/feedback' ),},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.green,),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}