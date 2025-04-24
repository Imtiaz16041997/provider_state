import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Screen", style: TextStyle(color: Colors.white)));
  }
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Store Screen", style: TextStyle(color: Colors.white)));
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("More Screen", style: TextStyle(color: Colors.white)));
  }
}
