
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mplant/screens/constant.dart';

List _dataDummy= [
{
    "albumId": 1,
    "id": 1,
    "title": "Monstera",
    "thumbnailUrl": "https://media.istockphoto.com/photos/large-leaf-house-plant-monstera-deliciosa-in-a-gray-pot-on-a-white-picture-id1310577216?b=1&k=20&m=1310577216&s=170667a&w=0&h=4SJ0-gaK5SSQhPCEO4_R3OK0PxfDPU_rvxBkTfLgPDI=",
    "Price":"30,000 IQD",
    "author":"kayle",
    "group":"Indoor"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Alocasia Baginda Silver Dragon",
    "thumbnailUrl": "https://media.istockphoto.com/photos/alocasia-dragon-scale-picture-id1342480051?b=1&k=20&m=1342480051&s=170667a&w=0&h=4yCC1TrNvIqnBvthj61bkali8QRhQo-W38QHgbE72rw=",
    "Price":"40,000 IQD",
    "author": "Liam",
    "group":"Indoor"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Asplenium nidus",
    "thumbnailUrl": "https://media.istockphoto.com/photos/houseplant-asplenium-nidus-in-white-flowerpot-isolated-on-white-picture-id1166437821?k=20&m=1166437821&s=170667a&w=0&h=g_Lddx-gQRo0nSVUyZIdqt1MIyMYgMT09wCZsD5_sXc=",
    "Price":"15,000 IQD",
    "author": "Emma",
    "group":"Indoor"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Green succulent",
    "thumbnailUrl": "https://images.unsplash.com/photo-1485955900006-10f4d324d411?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80",
    "Price":"20,000 IQD",
    "author": "Elijah",
    "group":"Indoor"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "crocuses",
    "thumbnailUrl": "https://media.istockphoto.com/photos/crocus-isolated-on-white-background-saffron-in-a-pot-picture-id1302332108?k=20&m=1302332108&s=612x612&w=0&h=MqQcZTkDuuItsEAOprdVNVJFeSJJQvmSgjMQWd8PjgE=",
    "Price":"60,000 IQD",
    "author": "James",
    "group":"Outdoor"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "Yellow chrysanthemum",
    "thumbnailUrl": "https://media.istockphoto.com/photos/pot-of-yellow-flowering-chrysanthemums-picture-id636687778?k=20&m=636687778&s=612x612&w=0&h=VXNpyGOylOCTFmIcozLjCV66sA4Fbykirfvt9jKQLAk=",
    "Price":"8,000 IQD",
    "author": "William",
    "group":"Outdoor"
  },
  {
  "albumId": 1,
    "id": 7,
    "title": "Lily",
    "thumbnailUrl": "https://images.unsplash.com/photo-1502977249166-824b3a8a4d6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "Price":"55,000 IQD",
    "author": "	Oliver",
    "group":"Outdoor"
  },
];

class PlantList extends StatefulWidget {
  const PlantList({ Key? key }) : super(key: key);

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,
        title: Text("List of Plants")),
      body: GroupedListView<dynamic, String>(
    elements: _dataDummy,
    groupBy: (element) => element['group'],
    groupSeparatorBuilder: (String groupByValue) => Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Text(groupByValue,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              )
            ],
          ),)
        ],
      ),
      ),
    itemBuilder: (context, dynamic element) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: ClipRRect(child: Image(image: 
          NetworkImage(element['thumbnailUrl']),
          fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          
          )),
          Expanded(flex: 5 ,child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(element['title'],
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
                
                ),
                Padding(padding: EdgeInsets.only(left: 0, right: 5, top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){Navigator.pushNamed(context, '/profile');},
                     icon: Icon(Icons.account_circle,color: Colors.green,
                    size: 16),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('${element['author']}'),
                    )
                  ],
                ),
                ),
                Padding(padding: EdgeInsets.only(left: 15, right: 10, top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.sell,color: Colors.green,
                    size: 16,),

                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('${element['Price']}'),
                    )
                  ],
                ),
                ),
              ],
            ),
          )
          )
        ],
      ),
      ),

    );
  },
    itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']), // optional
    useStickyGroupSeparators: true, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC, // optional
  ),
    );
  }
}