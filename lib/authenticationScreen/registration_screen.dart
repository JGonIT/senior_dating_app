import 'dart:io';

import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/cutom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();

  //Background - Cultural Values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();

  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              const Text(
                "to get Started Now",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //choose image circle avatar
              authenticationController.imageFile == null ?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/profile_avatar.png"
                ),
                backgroundColor: Colors.white,
              ) :
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(
                      File(
                        authenticationController.imageFile!.path,
                      )
                    )
                  ),
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.pickImageFileFromGallery();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.captureImageFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              //personal info
              const Text(
                "Personal Info: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_open_outlined,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone Number",
                  iconData: Icons.phone_android_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile Heading",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "What you're looking for in a partner",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // Appearance
              const Text(
                "Appearance: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // height
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // bodyType
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //LifeStyle info
              const Text(
                "LifeStyle Info: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // drink
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Smoke",
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //smoke
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: "Drink",
                  iconData: Icons.smoke_free_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //martialStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: martialStatusTextEditingController,
                  labelText: "Martial Status",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //haveChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: "Do you have Children?",
                  iconData: Icons.person_3,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //noOfChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: noOfChildrenTextEditingController,
                  labelText: "Number of Children",
                  iconData: Icons.person_2_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //profession
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //employmentStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //income
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: incomeTextEditingController,
                  labelText: "Income",
                  iconData: CupertinoIcons.money_dollar_circle_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //livingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: "Living Situation",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //willingToRelocate
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: willingToRelocateTextEditingController,
                  labelText: "Are you willing to Relocate?",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //relationship
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: relationshipYouAreLookingForTextEditingController,
                  labelText: "What relationship you are looking for?",
                  iconData: CupertinoIcons.heart_circle_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //Background info
              const Text(
                "LifeStyle Info: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // nationality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: CupertinoIcons.flag_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // education
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: CupertinoIcons.book_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // language
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  labelText: "Language",
                  iconData: CupertinoIcons.person,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // religion
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: "Religion",
                  iconData: CupertinoIcons.book_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              // ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: CustomTextFieldWidget(
                  editingController: ethnicityTextEditingController,
                  labelText: "Ethnicity",
                  iconData: CupertinoIcons.person_crop_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                  height: 30
              ),

              //create account Button
              Container(
                  width: MediaQuery.of(context).size.width - 36,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )
                  ),
                  child: InkWell(
                    onTap: () async
                    {
                      if(authenticationController.imageFile != null){
                        if(
                            // Person Info
                            nameTextEditingController.text.trim().isNotEmpty
                          && emailTextEditingController.text.trim().isNotEmpty
                          && passwordTextEditingController.text.trim().isNotEmpty
                          && nameTextEditingController.text.trim().isNotEmpty
                          && ageTextEditingController.text.trim().isNotEmpty
                          && phoneNoTextEditingController.text.trim().isNotEmpty
                          && cityTextEditingController.text.trim().isNotEmpty
                          && countryTextEditingController.text.trim().isNotEmpty
                          && profileHeadingTextEditingController.text.trim().isNotEmpty
                          && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty

                            // Appearance
                          && heightTextEditingController.text.trim().isNotEmpty
                          && weightTextEditingController.text.trim().isNotEmpty
                          && bodyTypeTextEditingController.text.trim().isNotEmpty

                            // Life Style
                          && drinkTextEditingController.text.trim().isNotEmpty
                          && smokeTextEditingController.text.trim().isNotEmpty
                          && martialStatusTextEditingController.text.trim().isNotEmpty
                          && haveChildrenTextEditingController.text.trim().isNotEmpty
                          && noOfChildrenTextEditingController.text.trim().isNotEmpty
                          && professionTextEditingController.text.trim().isNotEmpty
                          && employmentStatusTextEditingController.text.trim().isNotEmpty
                          && incomeTextEditingController.text.trim().isNotEmpty
                          && livingSituationTextEditingController.text.trim().isNotEmpty
                          && willingToRelocateTextEditingController.text.trim().isNotEmpty
                          && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty

                            // Background - Cultural Value
                          && nationalityTextEditingController.text.trim().isNotEmpty
                          && educationTextEditingController.text.trim().isNotEmpty
                          && languageSpokenTextEditingController.text.trim().isNotEmpty
                          && religionTextEditingController.text.trim().isNotEmpty
                          && ethnicityTextEditingController.text.trim().isNotEmpty
                        ){
                            setState(() {
                              showProgressBar = true;
                            });


                            await authenticationController.createNewUserAccount(
                              // Person info
                              authenticationController.profileImage!,
                              emailTextEditingController.text.trim(),
                              passwordTextEditingController.text.trim(),
                              nameTextEditingController.text.trim(),
                              ageTextEditingController.text.trim(),
                              phoneNoTextEditingController.text.trim(),
                              cityTextEditingController.text.trim(),
                              countryTextEditingController.text.trim(),
                              profileHeadingTextEditingController.text.trim(),
                              lookingForInaPartnerTextEditingController.text.trim(),

                              // Appearance
                              heightTextEditingController.text.trim(),
                              weightTextEditingController.text.trim(),
                              bodyTypeTextEditingController.text.trim(),

                              // Life style
                              drinkTextEditingController.text.trim(),
                              smokeTextEditingController.text.trim(),
                              martialStatusTextEditingController.text.trim(),
                              haveChildrenTextEditingController.text.trim(),
                              noOfChildrenTextEditingController.text.trim(),
                              professionTextEditingController.text.trim(),
                              employmentStatusTextEditingController.text.trim(),
                              incomeTextEditingController.text.trim(),
                              livingSituationTextEditingController.text.trim(),
                              willingToRelocateTextEditingController.text.trim(),
                              relationshipYouAreLookingForTextEditingController.text.trim(),

                              // Background
                              nationalityTextEditingController.text.trim(),
                              educationTextEditingController.text.trim(),
                              languageSpokenTextEditingController.text.trim(),
                              religionTextEditingController.text.trim(),
                              ethnicityTextEditingController.text.trim()
                            );
                            setState(() {
                              showProgressBar = false;
                              authenticationController.imageFile = null;
                            });

                          }
                        else {
                          Get.snackbar("A Field is Empty", "Please fill out all field in text fields.");
                        }
                      }
                      else {
                        Get.snackbar("Image File Missing", "Please pick image from Gallery or  capture with Camera");
                      }
                    },
                    child: const Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),

                  )
              ),

              const SizedBox(
                  height: 16
              ),

              //already have an account login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Already have account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                  height: 16
              ),

            ],
          ),
        ),
      ),
    );
  }
}
