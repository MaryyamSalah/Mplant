import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mplant/screens/Login.dart';
import 'package:mplant/screens/constant.dart';


class notify extends StatefulWidget {
  notify({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           backgroundColor: kPrimaryColor,
        title: Text('Notifications'),
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            onPressed: (){
              
            },

            ),
          )
        ],
        ),
        body: Column(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   
                  )
                ],
              ),
              
            ],
          ), //to show the clock

          Expanded(
              child: GestureDetector(
                  onTap: () {
                    print('Tapped');
                  },
                  child: Container(
                      width: 900,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                            
                          ),
                          color: Colors.green[100]),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          ListTile(
                            leading: ClipOval(
                                child: Image.asset(
                              'asset/images/gp.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                            )),
                            title: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Rony',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: ' Started following you',
                              )
                            ])),
                            subtitle: Text('9 mins ago'),
                            trailing: Icon(Icons.delete, color: Colors.grey),
                          ),
                          ListTile(
                            leading: ClipOval(
                                child: Image.asset(
                              'asset/images/p.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                            )),
                            title: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Maria',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: ' has one unread message',
                              )
                            ])),
                            subtitle: Text('47 mins ago'),
                            trailing: Icon(Icons.delete, color: Colors.grey),
                          ),
                          ListTile(
                            leading: ClipOval(
                                child: Image.asset(
                              'asset/images/a.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                            )),
                            title: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Delan',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: ' Started following you',
                              )
                            ])),
                            subtitle: Text('9 mins ago'),
                            trailing: Icon(Icons.delete, color: Colors.grey),
                          ),
                        ],
                      ))))
        ]));
  }
}
