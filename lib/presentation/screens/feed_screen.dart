import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/presentation/styles/colors.dart';
import 'package:aura/presentation/widgets/bottom_navbar.dart';
import 'package:aura/presentation/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remixicon/remixicon.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        surfaceTintColor: context.colorScheme.onSecondary,
        title: Text(
          'Feed',
          style: context.displaySmall!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          height(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Whats on your mind? Mohammed',
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
                          thinkAnimation,
                          width: 36,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                width(16),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEFEFEF),
                      ),
                      child: Icon(
                        Remix.image_circle_line,
                        color: lightSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          height(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 412,
              height: 481,
              child: Column(
                children: [
                  SizedBox(
                    height: 91,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {}, // onTap method to navigate to view profile
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              width(14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Wesam Inseiw',
                                    style: context.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Mobile App Developer',
                                    style: context.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: context.colorScheme.secondary.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'FOLLOW',
                            style: context.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '16 Jun 2024',
                              style: context.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '@wesaminseiw',
                              style: context.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFFE72260),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.link),
                          ),
                        ),
                        width(6),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.heart_line),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 412,
              height: 481,
              child: Column(
                children: [
                  SizedBox(
                    height: 91,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {}, // onTap method to navigate to view profile
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              width(14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Wesam Inseiw',
                                    style: context.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Mobile App Developer',
                                    style: context.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: context.colorScheme.secondary.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'FOLLOW',
                            style: context.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '16 Jun 2024',
                              style: context.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '@wesaminseiw',
                              style: context.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFFE72260),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.link),
                          ),
                        ),
                        width(6),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.heart_line),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 412,
              height: 481,
              child: Column(
                children: [
                  SizedBox(
                    height: 91,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {}, // onTap method to navigate to view profile
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              width(14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Wesam Inseiw',
                                    style: context.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Mobile App Developer',
                                    style: context.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: context.colorScheme.secondary.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'FOLLOW',
                            style: context.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '16 Jun 2024',
                              style: context.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '@wesaminseiw',
                              style: context.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFFE72260),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.link),
                          ),
                        ),
                        width(6),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: context.colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(width: 2, color: context.colorScheme.secondary),
                            ),
                            child: Icon(Remix.heart_line),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: currentIndex),
    );
  }
}
