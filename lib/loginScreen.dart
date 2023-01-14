import 'dart:async';
import 'package:final_project/homeScreen.dart';
import 'package:final_project/main.dart';
import 'package:final_project/tables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:final_project/signupScreen.dart';
import 'package:flutter/material.dart';
import 'setUpScreen.dart';
import './signupScreen.dart';
import './tables.dart';

//FOR FIREBASE DATABASE, gantong format na ginawa ko para mukhang database
List<int> account_id_column = [];
List<String> username_column = [];
List<String> name_column = [];
List<String> email_column = [];
List<String> password_column = [];
List<String> latest_city_column = [];

AccountsTable accounts = AccountsTable(account_id_column, username_column,
    name_column, email_column, password_column, latest_city_column);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

final TextEditingController username_controller = new TextEditingController();
final TextEditingController password_controller = new TextEditingController();

class LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    FutureOr onGoBack(dynamic value) {
      setState(() {});
    }

    //opening url links
    _launchURL(url) async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void navigateToSignUpScreen() {
      setState(() {
        username_controller.clear();
        password_controller.clear();
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()))
            .then(onGoBack);
      });
    }

    void navigateToSetUpScreen(int id) {
      Navigator.push(
              context, MaterialPageRoute(builder: (context) => SetUpScreen(id)))
          .then(onGoBack);
    }

    void navigateToHomeScreen(int id) {
      Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen(id)))
          .then(onGoBack);
    }

    void loginAccount() {
      bool noExistingAccount = true;
      //Executes this statement if there are no accounts created in the database
      if (accounts.account_id_column.isEmpty) {
        print('wala pang nacrecreate na account');
      } else {
        for (int i = 0; i < accounts.account_id_column.length; i++) {
          //Checks the database if there are existing accounts
          if (username_controller.text ==
                  accounts.username_column.elementAt(i) &&
              password_controller.text ==
                  accounts.password_column.elementAt(i)) {
            if (accounts.latest_city_column.elementAt(i) == '') {
              navigateToSetUpScreen(accounts.account_id_column.elementAt(i));
            } else {
              navigateToHomeScreen(accounts.account_id_column.elementAt(i));
            }
            username_controller.clear();
            password_controller.clear();
            noExistingAccount = false;
            break;
          }
        }
        //If entered username and password is not inside database, it will return a showDialog
        if (noExistingAccount) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                      title: const Text('Invalid Account'),
                      content: const Text('Please enter a valid account'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ]));
        }
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Color(0xFF527091),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromARGB(255, 0, 51, 105),
                Color.fromARGB(0, 0, 66, 124),
              ])),
          child: Column(
            children: [
              //Logo
              // Container(
              //   child: Image.asset('assets/Logo.png'),
              //   margin: EdgeInsets.only(top: 100, bottom: 15),
              //   height: 150,
              //   width: 150,
              // ),

              //Intro Label
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 100, bottom: 15, left: 30),
                  child: Row(children: [
                    Text(
                      'Welcome to  ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                    Text(
                      'iNavigate! ',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ])),
              //Divider na malupet
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              //Login Label
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  'LOGIN  ',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
              //Username Textfield
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                // padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: new BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(6, 6))
                    ]),
                child: TextField(
                  controller: username_controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.3),
                              width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.3),
                              width: 1)),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(left: 22, right: 20),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              //Password Textfield
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 25),
                  // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(40.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(6, 6))
                      ]),
                  child: TextField(
                    controller: password_controller,
                    obscureText: _isObscure,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                        enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.3),
                                width: 1)),
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.3),
                                width: 1)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Container(
                          margin: EdgeInsets.only(left: 22, right: 20),
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(right: 12),
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        )),
                  ),
                ),
              ),
              //Login Button
              Container(
                width: double.infinity,
                height: 56,
                margin: EdgeInsets.only(left: 30, right: 30, top: 25),
                // padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: new BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(6, 6))
                    ]),
                child: ElevatedButton(
                    onPressed: () {
                      if (username_controller.text == "" ||
                          password_controller.text == "") {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Missing Entries'),
                                    content: const Text(
                                        'Please fill out the remaining details'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ]));
                      } else {
                        loginAccount();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account yet?'),
                      TextButton(
                          onPressed: navigateToSignUpScreen,
                          child: Text(
                            'Sign up here!',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  )),
              //Isang Divider na malupet ulit
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'VISIT OUR OFFICIAL WEBSITES',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Facebook
                  IconButton(
                    onPressed: (() {
                      print('fb');
                      var fb_url = Uri.parse('https://www.facebook.com/');
                      _launchURL(fb_url);
                    }),
                    icon: Image.asset('assets/fb_icon.png'),
                    iconSize: 40,
                  ),
                  //Twitter
                  IconButton(
                    onPressed: (() {
                      print('twtr');
                      var twtr_url = Uri.parse('https://www.twitter.com/%27');
                      _launchURL(twtr_url);
                    }),
                    icon: Image.asset('assets/twitter_icon.png'),
                    iconSize: 40,
                  ),
                  //Instagram
                  IconButton(
                    onPressed: (() {
                      print('ig');
                      var ig_url = Uri.parse('https://www.instagram.com/%27');
                      _launchURL(ig_url);
                    }),
                    icon: Image.asset('assets/instagram_icon.png'),
                    iconSize: 40,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
