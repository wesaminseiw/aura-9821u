import 'dart:developer';
import 'package:aura/app/router.dart';
import 'package:aura/app/utils/constants.dart';
import 'package:aura/app/utils/extensions.dart';
import 'package:aura/logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int currentIndex;
  BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.colorScheme.surface,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 80.0,
        child: Row(
          children: <Widget>[
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Expanded(
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.currentIndex = 0;
                          });
                          AppRouter.offAllNavigateWithoutAnimation(profileRoute);
                          log('=== PROFILE ===');
                        },
                        child: state is GetProfileImage_Success
                            ? CircleAvatar(
                                radius: 30,
                                backgroundColor: widget.currentIndex == 0 ? context.colorScheme.primary : Colors.grey[300], // Background color
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    state.imageUrl, // Display selected image
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.person,
                                color: widget.currentIndex == 0 ? context.colorScheme.primary : context.colorScheme.secondary,
                                size: widget.currentIndex == 0 ? 38 : 32,
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: IconButton(
                    icon: Icon(
                      Icons.home_rounded,
                      color: widget.currentIndex == 1 ? context.colorScheme.primary : context.colorScheme.secondary,
                      size: widget.currentIndex == 1 ? 38 : 32,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentIndex = 1;
                      });
                      AppRouter.offAllNavigateWithoutAnimation(homeRoute);
                      log('=== HOME ===');
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: widget.currentIndex == 2 ? context.colorScheme.primary : context.colorScheme.secondary,
                      size: widget.currentIndex == 2 ? 38 : 32,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.currentIndex = 2;
                      });
                      AppRouter.offAllNavigateWithoutAnimation(searchRoute);
                      log('=== SEARCH ===');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
