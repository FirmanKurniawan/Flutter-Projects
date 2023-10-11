import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('WhatsApp'),
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      const PopupMenuItem(value: 1, child: Text('New Group')),
                      const PopupMenuItem(value: 2, child: Text('Logout')),
                      const PopupMenuItem(value: 3, child: Text('Settings'))
                    ]),
          ],
          backgroundColor: Colors.teal,
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(child: Icon(Icons.camera_alt)),
            Tab(child: Text('Chats')),
            Tab(child: Text('Status')),
            Tab(child: Text('Calls')),
          ]),
        ),
        body: TabBarView(children: [
          const Text('camera'),
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle ,
                    border: Border.all(
                      color: Colors.teal,
                      width: 3,
                    )
                  ),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200'),
                  ),
                ),
                title: const Text('Ravneet Singh'),
                subtitle: const Text('Hello, how are you?'),
                trailing: const Text('9:36 PM'),
              );
            },
          ),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200'),
                ),
                title: Text('Ravneet Singh'),
                subtitle: Text('12h ago'),
              );
            },
          ),
          ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200'),
                ),
                title: Text('Ravneet Singh'),
                subtitle: Text('Missed call'),
                trailing: Icon(Icons.call),
              );
            },
          ),
        ]),
      ),
    );
  }
}
