import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({ Key? key }) : super(key: key);
  @override
  _feedbackState createState() =>  _feedbackState();
}

class  _feedbackState extends State<FeedBack> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Sara',
      'pic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6d6vtNhobV_Z8DR3RlK5jQ04swbpiAC83Ew&usqp=CAU',
      'message': 'I love Plants'
    },
    {
      'name': 'Huda',
      'pic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmBQfC44Vom-jGmSAh5YCfp9l7ga_5OvQpmyrbm2Vnnc0CM0dZaSKPrDDQDrHgoh3nHxc&usqp=CAU',
      'message': 'Very cool'
    },
    {
      'name': 'Nuha',
      'pic': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToALOomF9jLHrBldObqpokC7_ut2HahOtAgA&usqp=CAU',
      'message': 'Amazing'
    },
    {
      'name': 'Ronza',
      'pic': 'https://ak.picdn.net/shutterstock/videos/20090347/thumb/1.jpg',
      'message': 'Fantastic'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Give Us Your Feedback!"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://media.istockphoto.com/photos/cute-girl-in-white-tshirt-smelling-sunflower-in-the-field-on-the-picture-id1267009612?k=20&m=1267009612&s=612x612&w=0&h=7QggXPNOOKJmu-m42v4T4Ibw0_jR2C1eJ6ws7t21kUY=",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://media.istockphoto.com/photos/cute-girl-in-white-tshirt-smelling-sunflower-in-the-field-on-the-picture-id1267009612?k=20&m=1267009612&s=612x612&w=0&h=7QggXPNOOKJmu-m42v4T4Ibw0_jR2C1eJ6ws7t21kUY=',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.green[50],
          textColor: Colors.black,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.green),
        ),
      ),
    );
  }
}