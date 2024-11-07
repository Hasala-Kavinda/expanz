import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //method to store the username and user email in shredpreferances
  static Future<void> storeUserDetails(String userName, String email,
      String password, String confirmPassword, BuildContext context) async {
    //Check weather the password and the confirm password are the same
    if (password != confirmPassword) {
      //Convey the massage to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password and Confirm Password do not match!"),
        ),
      );
    }

    // If they valid store them in sharedpref
    try {
      //create an instance from sharedPref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      

    } catch (e) {
      e.toString();
    }
  }
}
