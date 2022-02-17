// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mplant/screens/constant.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';



class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(height: size.height *0.2,
        child: Stack(
          children:<Widget> [
            Container(
              padding: EdgeInsets.only(left: kDefaultPadding,right: kDefaultPadding,bottom: 40),
              
              height: size.height*0.2 -27,
            
              decoration: BoxDecoration(color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                
                bottomRight: Radius.circular(36),
              ),),
              child: Row(
                children: <Widget>[
                  Text('Welcome to MeryPlant!',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
          
                  CircleAvatar(
                    
            radius: 50 / 2,
            backgroundImage: NetworkImage(
                'https://image.shutterstock.com/image-vector/m-letter-logo-icon-design-260nw-1652916667.jpg'),
          ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              
              child:
              TextField(
                onChanged: (value){},
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search_sharp,color: kPrimaryColor.withOpacity(0.5),),
                ),
              ),
              

              ),),
          ],),
        ),Container(margin: EdgeInsets.all(20),),
      
       ImageSlideshow(
         
         width: double.infinity,
         height: 250,
         initialPage: 0,
         indicatorColor: Colors.greenAccent,
         indicatorBackgroundColor: Colors.grey,
          children: [
            Image.network('https://m.media-amazon.com/images/I/61PPYUoc2aL._AC_SX425_.jpg',
            fit: BoxFit.fitHeight),
            Image.network('https://m.media-amazon.com/images/I/61PPYUoc2aL._AC_SX425_.jpg',
            fit: BoxFit.fitHeight),
            Image.network('https://cdn.shopify.com/s/files/1/1706/1307/products/Livin-Beauty-Plant-Vase-Silver-Carved-Fine-Line-Aspidistra_a070e36d-0410-4478-a0d4-1524ba2d0a61_1200x.jpg?v=1641643409',
            fit: BoxFit.fitHeight),
            Image.network('https://cdn.shopify.com/s/files/1/0151/1650/1046/products/Monstera_deliciosa_indoor_pot_plant_growers_pot_14cm_2400x.jpg?v=1581991154',
            fit: BoxFit.fitHeight),
            Image.network('https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1615232722-41GO-vxKV0L.jpg?crop=0.764xw:1.00xh;0.233xw,0&resize=320%3A%2A',
            fit: BoxFit.fitHeight),
            Image.network('https://cdn.shopify.com/s/files/1/0532/5881/3612/products/snake-plant-medium-1_1024x1024@2x.jpg?v=1615662961',
            fit: BoxFit.fitHeight),
          ],
          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,
          /// Loops back to first slide.
          isLoop: true,
       ),
        
      ],
      
      
    );
    
    
  }
}
