import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/app/utils/utils.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:aura/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 64),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for users, posts and hashtags...',
              hintStyle: context.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: lightSecondaryColor,
              ),
              fillColor: Color(0xFFEFEFEF),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(154),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(8), // Adjust padding as needed
                child: Lottie.asset(
                  searchAnimation,
                  width: 36,
                  height: 32,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
      ),
    );
  }
}
