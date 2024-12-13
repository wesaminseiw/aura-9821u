import 'package:aura/app/utils/extensions.dart';
import 'package:aura/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text('Feed'),
      ),
      body: Column(
        // TODO: next week: finish the ui of home, profile, settings screens, also instead of taking the full name, take the first and last name separetely, and take the username later in customization screen.
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Remix.heart_line,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
    );
  }
}
