import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:dating_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {

  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";

  readCurrentUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot){
       setState(() {
         senderName = dataSnapshot.data()!["name"].toString();
       });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx((){
          return PageView.builder(
            itemCount: profileController.allUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index)
            {
              final eachProfileInfo = profileController.allUsersProfileList[index];

              return DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(eachProfileInfo.imageProfile.toString(),
                    ),
                    fit: BoxFit.cover,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [

                      const SizedBox(
                        height: 20
                      ),
                      //filter icon button
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: IconButton(
                            onPressed: ()
                            {

                            },
                            icon: const Icon(
                              Icons.filter_list,
                              size: 30,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      //user data
                      GestureDetector(
                        onTap: ()
                        {
                          profileController.viewSentAndViewReceived(
                            eachProfileInfo.uid.toString(),
                            senderName,
                          );

                          //send user to profile person userDetailScreen
                          Get.to(UserDetailsScreen(
                            userID: eachProfileInfo.uid.toString(),
                          ));
                        },
                        child: Column(
                          children: [

                            // name
                            Text(
                              eachProfileInfo.name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // age
                            Text(
                              eachProfileInfo.age.toString() + " ◦ " + eachProfileInfo.city.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 4,
                              ),
                            ),
                            
                            const SizedBox(
                              height: 4,
                            ),
                            
                            // profession and religion
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //profession
                                ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)
                                  )
                                ),
                                  child: Text(
                                    eachProfileInfo.profession.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),
                                //religion
                                ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.religion.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // country and ethnicity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //country
                                ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.country.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),
                                //ethnicity
                                ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                      )
                                  ),
                                  child: Text(
                                    eachProfileInfo.ethnicity.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //favorite button
                          GestureDetector(
                            onTap: (){
                              profileController.favoriteSentAndFavoriteReceived(
                                  eachProfileInfo.uid.toString(),
                                  senderName,
                              );
                            },
                            child: Image.asset(
                              "images/favorite.png",
                              width: 60,
                            ),
                          ),

                          //chat button
                          GestureDetector(
                            onTap: (){

                            },
                            child: Image.asset(
                              "images/chat2.png",
                              width: 210,
                              height: 80,
                              fit: BoxFit.contain

                            ),
                          ),

                          //like button
                          GestureDetector(
                            onTap: (){

                            },
                            child: Image.asset(
                              "images/like.png",
                              width: 60,
                            ),
                          ),

                        ],
                      )


                    ],
                  )
                ),

              );
            },
          );
        }),
    );
  }
}
