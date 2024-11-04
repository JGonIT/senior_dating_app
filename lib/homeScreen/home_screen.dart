import 'package:dating_app/tabScreens/favorite_sent_favorite_received_screen.dart';
import 'package:dating_app/tabScreens/like_sent_like_received_screen.dart';
import 'package:dating_app/tabScreens/swipping_screen.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:dating_app/tabScreens/view_sent_view_received_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int screenIndex = 0;
  List tabScreensList =
  [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(userID: FirebaseAuth.instance.currentUser!.uid,),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber)
        {
          setState(() {
            screenIndex = indexNumber;
          });
        },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          currentIndex: screenIndex,
          items: const[
            // SwippingScreen
            BottomNavigationBarItem(icon: Icon(
              Icons.home,
              size: 30,
            ),
              label: ""
          ),
            //ViewSentViewReceivedScreen
            BottomNavigationBarItem(icon: Icon(
              Icons.remove_red_eye,
              size: 30,
            ),
                label: ""
            ),
            //FavoriteScreen
            BottomNavigationBarItem(icon: Icon(
              Icons.star,
              size: 30,
            ),
                label: ""
            ),
            //Like Screen
            BottomNavigationBarItem(icon: Icon(
              Icons.favorite,
              size: 30,
            ),
                label: ""
            ),
            //userDetailsScreen button
            BottomNavigationBarItem(icon: Icon(
              Icons.person,
              size: 30,
            ),
                label: ""
            ),
        ]
      ),
      body: tabScreensList[screenIndex],
    );
  }
}


    