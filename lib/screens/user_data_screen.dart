import 'package:expandz/constants/colors.dart';
import 'package:expandz/constants/constants.dart';
import 'package:expandz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //For the check box
  bool _rememberMe = false;

  //Form key for the form validation
  final _formKey = GlobalKey<FormState>();

//Controller for the text form fields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Form Filed for the username
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check whether the user enter a valid username
                          if (value!.isEmpty) {
                            return "Please Enter Your Username";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //Form Filed for the email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check whether the user enter a valid username
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //Form Filed for the password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check whether the user enter a valid username
                          if (value!.isEmpty) {
                            return "Please Enter a Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Form Filed for the confirm password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          //check whether the user enter a valid username
                          if (value!.isEmpty) {
                            return "Please Enter Same Password";
                          }
                          if (!(value == _passwordController.text)) {
                            return "Check the password again!";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Rimeber me
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 15,
                            ),
                          ),
                          Expanded(
                              child: Checkbox(
                            activeColor: kMainColor,
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                                print(_rememberMe);
                              });
                            },
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          //Check whether the form is valid, if not validate it
                          if (_formKey.currentState!.validate()) {
                            //if form is valid, process data

                            String userName = _userNameController.text;
                            String password = _passwordController.text;
                            String email = _emailController.text;
                          }
                        },
                        child: const CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
