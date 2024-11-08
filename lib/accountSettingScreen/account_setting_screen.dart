import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/widgets/global.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../homeScreen/home_screen.dart';
import '../widgets/cutom_text_field_widget.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool uploading = false;
  bool next = false;
  final List<File> _image = [];
  List<String> urlsList = [];
  double val = 0;

  //personal info
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

  // Personal info
  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  // Appearance
  String height = '';
  String weight = '';
  String bodyType= '';

  // Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';


  // Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';


  chooseImage() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImages() async
  {
    int i = 1;

    for(var img in _image)
      {
        setState(() {
          val = i / _image.length;
        });

        var refImages = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

        await refImages.putFile(img)
          .whenComplete(() async
        {
          await refImages.getDownloadURL()
              .then((urlImage)
          {
            urlsList.add(urlImage);

            i++;
          });
        });
      }
  }

  retrieveUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
        {
          setState(() {

            //personal info
            name = snapshot.data()!['name'];
            nameTextEditingController.text = name;
            age = snapshot.data()!['age'].toString();
            ageTextEditingController.text = age;
            phoneNo = snapshot.data()!['phoneNo'];
            phoneNoTextEditingController.text = phoneNo;
            city = snapshot.data()!['city'];
            cityTextEditingController.text = city;
            country = snapshot.data()!['country'];
            countryTextEditingController.text = country;
            profileHeading = snapshot.data()!['profileHeading'];
            profileHeadingTextEditingController.text = profileHeading;
            lookingForInaPartner = snapshot.data()!['lookingForInaPartner'];
            lookingForInaPartnerTextEditingController.text = lookingForInaPartner;

            //Appearance
            height = snapshot.data()!['height'];
            heightTextEditingController.text = height;
            weight = snapshot.data()!['weight'];
            weightTextEditingController.text = weight;
            bodyType = snapshot.data()!['bodyType'];
            bodyTypeTextEditingController.text = bodyType;

            //Life Style
            drink = snapshot.data()!['drink'];
            drinkTextEditingController.text = drink;
            smoke = snapshot.data()!['smoke'];
            smokeTextEditingController.text = smoke;
            martialStatus = snapshot.data()!['martialStatus'];
            martialStatusTextEditingController.text = martialStatus;
            haveChildren = snapshot.data()!['haveChildren'];
            haveChildrenTextEditingController.text = haveChildren;
            noOfChildren = snapshot.data()!['noOfChildren'];
            noOfChildrenTextEditingController.text = noOfChildren;
            profession = snapshot.data()!['profession'];
            professionTextEditingController.text = profession;
            employmentStatus = snapshot.data()!['employmentStatus'];
            employmentStatusTextEditingController.text = employmentStatus;
            income = snapshot.data()!['income'];
            incomeTextEditingController.text = income;
            livingSituation = snapshot.data()!['livingSituation'];
            livingSituationTextEditingController.text = livingSituation;
            willingToRelocate = snapshot.data()!['willingToRelocate'];
            willingToRelocateTextEditingController.text = willingToRelocate;
            relationshipYouAreLookingFor = snapshot.data()!['relationshipYouAreLookingFor'];
            relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;

            //Background
            nationality = snapshot.data()!['nationality'];
            nationalityTextEditingController.text = nationality;
            education = snapshot.data()!['education'];
            educationTextEditingController.text = education;
            languageSpoken = snapshot.data()!['languageSpoken'];
            languageSpokenTextEditingController.text = languageSpoken;
            religion = snapshot.data()!['religion'];
            religionTextEditingController.text = religion;
            ethnicity = snapshot.data()!['ethnicity'];
            ethnicityTextEditingController.text = ethnicity;

          });
        }
    });
  }

  updateUserDataToFirestoreDatabase(
      // Personal info
      String name,
      String age,
      String phoneNo,
      String city,
      String country,
      String profileHeading,
      String lookingForInaPartner,


      // Appearance
      String height,
      String weight,
      String bodyType,

      // Life style
      String drink,
      String smoke,
      String martialStatus,
      String haveChildren,
      String noOfChildren,
      String profession,
      String employmentStatus,
      String income,
      String livingSituation,
      String willingToRelocate,
      String relationshipYouAreLookingFor,

      // Background - Cultural Values
      String nationality,
      String education,
      String languageSpoken,
      String religion,
      String ethnicity,
      ) async
  {
    showDialog(
        context: context,
        builder: (context){
          return const AlertDialog(
            content: SizedBox(
              height: 200,
              child: Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10,),
                      Text("uploading images..."),
                    ],
                  )
              ),
            ),
          );
        }
    );
    await uploadImages();

    await FirebaseFirestore.instance.collection("users").doc(currentUserID).update(
      {
        //personal info
        'name': name,
        'age': int.parse(age),
        'phoneNo': phoneNo,
        'city': city,
        "country": country,
        "profileHeading": profileHeading,
        "lookingForInaPartner": lookingForInaPartner,

        //Appearance
        "height": height,
        "weight": weight,
        "bodyType": bodyType,

        //Life style
        "drink": drink,
        "smoke": smoke,
        "martialStatus": martialStatus,
        "haveChildren": haveChildren,
        "noOfChildren": noOfChildren,
        "profession": profession,
        "employmentStatus": employmentStatus,
        "income": income,
        "livingSituation": livingSituation,
        "willingToRelocate": willingToRelocate,
        "relationshipYouAreLookingFor": relationshipYouAreLookingFor,

        //Background - Cultural Values
        "nationality": nationality,
        "education": education,
        "languageSpoken": languageSpoken,
        "religion": religion,
        "ethnicity": ethnicity,

        //images
        'urlImage1': urlsList[0].toString(),
        'urlImage2': urlsList[1].toString(),
        'urlImage3': urlsList[2].toString(),
        'urlImage4': urlsList[3].toString(),
        'urlImage5': urlsList[4].toString(),

      }
    );

    Get.snackbar("Updated", "your account has been updated successfully");

    Get.to(HomeScreen());

    setState(() {
      uploading = false;
      _image.clear();
      urlsList.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "Choose 5 Images",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          next
          ? Container()
          : IconButton(
            onPressed: ()
            {
              if(_image.length == 5)
                {
                  setState(() {
                    uploading = true;
                    next = true;
                  });
                }
              else
                {
                  Get.snackbar("5 Images", "Please choose 5 images");
                }
            },
            icon: const Icon(Icons.navigate_next_outlined, size: 36),
          ),
        ],
      ),
      body: next
        ?
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 2,
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
                        if(
                        // Person Info
                        nameTextEditingController.text.trim().isNotEmpty
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

                          _image.length > 0 ?
                          await updateUserDataToFirestoreDatabase(
                            // Person info
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
                          ) : null;

                        }
                        else {
                          Get.snackbar("A Field is Empty", "Please fill out all field in text fields.");
                        }
                      },
                      child: const Center(
                          child: Text(
                            "Update Account",
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
              ],
            ),
          ),
        )
        :
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: GridView.builder(
                itemCount: _image.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index){
                  return index == 0
                  ? Container(
                    color: Colors.white30,
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          if(_image.length < 5)
                            {
                              !uploading ? chooseImage() : null;
                            }
                          else
                            {
                              setState(() {
                                uploading == true;
                              });

                              Get.snackbar("5 Images Chosen", "5 Images Already Selected");
                            }
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  )
                  : Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(_image[index-1],), fit: BoxFit.cover,),
                    ),
                  );
                },
              ),
            )
          ],

        ),
    );
  }
}
