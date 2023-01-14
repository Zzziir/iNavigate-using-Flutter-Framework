import 'dart:ffi';
import 'package:final_project/tables.dart';
import 'package:flutter/material.dart';
import './loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

final TextEditingController signUp_username_controller =
    new TextEditingController();
final TextEditingController email_controller = new TextEditingController();
final TextEditingController name_controller = new TextEditingController();
final TextEditingController signUp_password_controller =
    new TextEditingController();
final TextEditingController confirm_password_controller =
    new TextEditingController();

class SignUpScreenState extends State<SignUpScreen> {
  void navigateToLogInScreen() {
    setState(() {
      signUp_username_controller.clear();
      email_controller.clear();
      signUp_password_controller.clear();
      name_controller.clear();
      confirm_password_controller.clear();
      // print(accounts.account_id_column.elementAt(0));
      // print(accounts.username_column.elementAt(0));
      // print(accounts.name_column.elementAt(0));
      // print(accounts.email_column.elementAt(0));
      // print(accounts.password_column.elementAt(0));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  void createAccount() {
    accounts.account_id_column.add(account_id_column.length + 1);
    accounts.username_column.add(signUp_username_controller.text);
    accounts.name_column.add(name_controller.text);
    accounts.email_column.add(email_controller.text);
    accounts.password_column.add(signUp_password_controller.text);
    accounts.latest_city_column.add('');
    navigateToLogInScreen();
  }

  bool checkSameUsername() {
    bool hasSame = false;
    for (int i = 0; i < accounts.username_column.length; i++) {
      if (signUp_username_controller.text ==
          accounts.username_column.elementAt(i)) {
        hasSame = true;
        break;
      } else {
        hasSame = false;
      }
    }
    return hasSame;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('SignUp'),
      //   backgroundColor: Color.fromARGB(255, 0, 51, 105),
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color.fromARGB(255, 0, 51, 105),
              Color.fromARGB(0, 0, 66, 124),
            ])),
        height: double.infinity,
        // color: Colors.black,
        child: Column(
          children: [
            //Back Button & Sign Up Label Container
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, top: 50),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  //Back Button
                  ElevatedButton(
                    onPressed: navigateToLogInScreen,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor:
                          Colors.white.withOpacity(0.3), // <-- Button color
                      // foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  //Sign Up Label
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ])),
            //Divider
            Container(
              margin: EdgeInsets.only(top: 15, left: 30, right: 30),
              child: const Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //==========================================================
                    //Username Entry
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
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
                      child: TextFormField(
                        controller: signUp_username_controller,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (signUp_username_controller.text.isEmpty) {
                            return 'Please enter a valid username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Container(
                              margin: EdgeInsets.only(left: 22, right: 20),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    //==========================================================
                    //Name Entry
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
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
                      child: TextFormField(
                        controller: name_controller,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (name_controller.text.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Container(
                              margin: EdgeInsets.only(left: 22, right: 20),
                              child: Icon(
                                Icons.badge,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    //==========================================================
                    //Email Entry
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
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
                      child: TextFormField(
                        controller: email_controller,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (email_controller.text.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            hintText: 'Enter your email',
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
                    //==========================================================
                    //Password Entry
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
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
                      child: TextFormField(
                        controller: signUp_password_controller,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (signUp_password_controller.text.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Container(
                              margin: EdgeInsets.only(left: 22, right: 20),
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    //==========================================================
                    //CONFIRM Password
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
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
                      child: TextFormField(
                        controller: confirm_password_controller,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (confirm_password_controller.text.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)
                                        .withOpacity(0.3),
                                    width: 1)),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            hintText: 'Confirm your password',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Container(
                              margin: EdgeInsets.only(left: 22, right: 20),
                              child: Icon(
                                Icons.key,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
            //SIGN UP Button
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
                  onPressed: (() async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Processing Data'),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 2),
                      ));
                      //Ichecheck kung may same username sa database
                      if (checkSameUsername()) {
                        await Future.delayed(
                            const Duration(milliseconds: 2500));
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Username has been used'),
                                    content: const Text(
                                        'Try entering a different username'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ]));
                      } else {
                        if (signUp_password_controller.text ==
                            confirm_password_controller.text) {
                          print('same ang password and confirm pword.');
                          await Future.delayed(
                              const Duration(milliseconds: 2500));
                          //Submit data to database then navigate to Login After 2.5 seconds
                          createAccount(); //Function to add data to database then navigate back to login screen
                        }
                        //Kapag di same ang password sa confirm password
                        else {
                          await Future.delayed(
                              const Duration(milliseconds: 2500));
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Password not matched'),
                                      content: const Text(
                                          'Please confirm your password'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ]));
                        }
                      }
                    }
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.fact_check,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
