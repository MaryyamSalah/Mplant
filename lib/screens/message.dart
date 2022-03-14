
import 'package:flutter/material.dart';
import 'constant.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger,color: Colors.green,), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people,color: Colors.green,), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call,color: Colors.green,), label: "Calls"),
        BottomNavigationBarItem(
          icon: 
          CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("asset/images/gp.jpg"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: kPrimaryColor,
      title: Text("Chats"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () {}
            ),
          ),
        ),
      ],
    );
  }
}
class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20* 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(chat.time),
            ),
          ],
        ),
      ),
    );
  }
}

  




class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Huda",
    lastMessage: "Hope you are doing well...",
    image: "asset/images/a.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Sara",
    lastMessage: "Hello Rony! I am...",
    image: "asset/images/b.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ronza",
    lastMessage: "Do you have update...",
    image: "asset/images/co.jpg",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Nuha",
    lastMessage: "You’re welcome :)",
    image: "asset/images/first.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Danya",
    lastMessage: "Thanks",
    image: "asset/images/g.jpg",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Rozhin",
    lastMessage: "Hope you are doing well...",
    image: "asset/images/grass.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Zhin",
    lastMessage: "Hello Abdullah! I am...",
    image: "asset/images/green.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Gasha",
    lastMessage: "Do you have update...",
    image: "asset/images/n.jpg",
    time: "5d ago",
    isActive: false,
  ),
];

