import 'package:dating_app/authenticationScreen/registration_screen.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:dating_app/widgets/cutom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;
  var controllerAuth = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 120,
              ),

              Image.asset(
                "images/logo.png",
                width: 300,
              ),

              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Please login to find new friend.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                  height: 20
              ),

              //email
              Container(
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
                height: 20
              ),
              //password
              Container(
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

              //login Button
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
                    if(emailTextEditingController.text.trim().isNotEmpty
                    && passwordTextEditingController.text.trim().isNotEmpty)
                    {
                      setState(() {
                        showProgressBar = true;
                      });
                      await controllerAuth.loginUser(
                        emailTextEditingController.text.trim(),
                        passwordTextEditingController.text.trim()
                      );

                      setState(() {
                        showProgressBar = false;
                      });
                    } else {
                      Get.snackbar("Email/Password is Missing", "Please fill all fields.");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Login",
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

              // don't have an account create here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(RegistrationScreen());
                    },
                    child: const Text(
                      "Create Here",
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

              showProgressBar == true
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              )
                  : Container(),
            ],
          )
        )
      ),
    ); // Scaffold
  }
}
