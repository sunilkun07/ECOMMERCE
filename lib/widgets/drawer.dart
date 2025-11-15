import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
final imageUrl =
    "https://i.pinimg.com/736x/d9/66/6c/d9666cf9ee36e1c1cd64e1853bf3a9bc.jpg";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('sunil'),
            accountEmail: Text('sunil@gmail.com'),
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
            },
          ),
        ],
      ),
    );
  }
}
