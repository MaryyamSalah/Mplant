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
                textAlign: TextAlign.start,
                onChanged: (value){},
                decoration: InputDecoration(
                  hintText: "     Search",
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
        ),Container(margin: EdgeInsets.all(40),),
      
       ImageSlideshow(
         
         width: double.infinity,
         height: 250,
         initialPage: 0,
         indicatorColor: Colors.greenAccent,
         indicatorBackgroundColor: Colors.grey,
          children: [
            Image.network('https://m.media-amazon.com/images/I/61PPYUoc2aL._AC_SX425_.jpg',
            fit: BoxFit.fitHeight),
            Image.network('https://media.istockphoto.com/photos/decorative-tropical-tree-planted-standing-gold-pot-isolated-on-white-picture-id1334662212?k=20&m=1334662212&s=612x612&w=0&h=gHX8rOgaxbcQ1_xn2MBprOD-fF-Q045oj3n39q_E7rs=',
            fit: BoxFit.fitHeight),
            Image.network('https://cdn.shopify.com/s/files/1/1706/1307/products/Livin-Beauty-Plant-Vase-Silver-Carved-Fine-Line-Aspidistra_a070e36d-0410-4478-a0d4-1524ba2d0a61_1200x.jpg?v=1641643409',
            fit: BoxFit.fitHeight),
            Image.network('https://media.istockphoto.com/photos/natural-green-succulents-cactus-haworthia-attenuata-in-white-on-picture-id1090442826?k=20&m=1090442826&s=612x612&w=0&h=rV46p11fKMX-eY5UMJiFAwbnKZwvH6OFTRH7nynKG2Y=',
            fit: BoxFit.fitHeight),
            Image.network('https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1615232722-41GO-vxKV0L.jpg?crop=0.764xw:1.00xh;0.233xw,0&resize=320%3A%2A',
            fit: BoxFit.fitHeight),
            Image.network('https://media.istockphoto.com/photos/adorable-little-yellow-flower-plant-picture-id484717175?k=20&m=484717175&s=612x612&w=0&h=mQ9cK9cpizyQQllu9GFDPN5a8GoqV5TB0k9qc6bfrOA=',
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
