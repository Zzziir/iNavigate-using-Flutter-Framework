import 'package:final_project/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  int account_id;
  ProfileScreen(this.account_id);

  @override
  State<ProfileScreen> createState() => ProfileScreenState(account_id);
}

final TextEditingController profile_name_controller =
    new TextEditingController();
final TextEditingController profile_email_controller =
    new TextEditingController();
final TextEditingController profile_password_controller =
    new TextEditingController();
final TextEditingController profile_confirm_password_controller =
    new TextEditingController();

class ProfileScreenState extends State<ProfileScreen> {
  int account_id;
  ProfileScreenState(this.account_id);

  bool _nameIsEditable = false;
  bool _emailIsEditable = false;
  bool _passwordIsEditable = false;
  bool _confirmPasswordIsEditable = false;

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xFF527091),
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 219, 219, 219),
        //Contents
        child: Column(children: [
          //============================ Name ==================================
          //Name Label
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'NAME',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(51, 77, 104, 1),
              ),
            ),
          ),
          //Name Textfield
          Stack(children: [
            //Editable
            Container(
              // color: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width - 40,
              height: 35,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(165, 184, 206, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  _nameIsEditable ? Icons.done_outline : Icons.edit,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    if (_nameIsEditable == true) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Changes Detected'),
                                  content: const Text(
                                      'Do you want to save changes in your name?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: (() {
                                        print('Clicked Cancel');
                                        Navigator.pop(context, 'Cancel');
                                      }),
                                      child: const Text('Cancel'),
                                    ),
                                    //Updates name if Save is clicked
                                    TextButton(
                                      onPressed: (() {
                                        print('Clicked Save');
                                        accounts.name_column[account_id - 1] =
                                            profile_name_controller.text;
                                        Navigator.pop(context, 'Save');
                                        Navigator.pop(context);
                                      }),
                                      child: const Text('Save'),
                                    ),
                                  ]));
                    }
                    _nameIsEditable = !_nameIsEditable;
                  });
                },
              ),
            ),
            //Textfield
            Container(
              width: MediaQuery.of(context).size.width - 85,
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(2, 2))
                  ]),
              child: TextField(
                enabled: _nameIsEditable,
                controller: profile_name_controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF527091),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          width: 1)),
                  disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          width: 1)),
                  //Get name from accounts table
                  hintText: accounts.name_column.elementAt(account_id - 1),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Container(
                    margin: EdgeInsets.only(left: 22, right: 20),
                    child: Icon(
                      Icons.badge,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          //============================ Email ==================================
          //Email Label
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'EMAIL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(51, 77, 104, 1),
              ),
            ),
          ),
          //Email Textfield
          Stack(children: [
            //Editable
            Container(
              // color: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width - 40,
              height: 35,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(165, 184, 206, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  _emailIsEditable ? Icons.done_outline : Icons.edit,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    if (_emailIsEditable == true) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Changes Detected'),
                                  content: const Text(
                                      'Do you want to save changes in your email?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: (() {
                                        print('Clicked Cancel');
                                        Navigator.pop(context, 'Cancel');
                                      }),
                                      child: const Text('Cancel'),
                                    ),
                                    //Updates email if Save is clicked
                                    TextButton(
                                      onPressed: (() {
                                        print('Clicked Save');
                                        accounts.email_column[account_id - 1] =
                                            profile_email_controller.text;
                                        Navigator.pop(context, 'Save');
                                        Navigator.pop(context);
                                      }),
                                      child: const Text('Save'),
                                    ),
                                  ]));
                    }
                    _emailIsEditable = !_emailIsEditable;
                  });
                },
              ),
            ),
            //Textfield
            Container(
              width: MediaQuery.of(context).size.width - 85,
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(2, 2))
                  ]),
              child: TextField(
                enabled: _emailIsEditable,
                controller: profile_email_controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF527091),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          width: 1)),
                  disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3),
                          width: 1)),
                  //Get email from accounts table
                  hintText: accounts.email_column.elementAt(account_id - 1),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Container(
                    margin: EdgeInsets.only(left: 22, right: 20),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          //Divider
          Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            child: const Divider(
              thickness: 2,
              color: Color.fromRGBO(51, 77, 104, 1),
            ),
          ),
          //============================ Password ==================================
          //Password Label
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'PASSWORD',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(51, 77, 104, 1),
              ),
            ),
          ),
          //Password Textfield
          Stack(children: [
            //Editable
            Container(
              // color: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width - 40,
              height: 35,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(165, 184, 206, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  _passwordIsEditable ? Icons.done_outline : Icons.edit,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _passwordIsEditable = !_passwordIsEditable;
                  });
                },
              ),
            ),
            //Textfield
            Container(
              width: MediaQuery.of(context).size.width - 85,
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(2, 2))
                  ]),
              child: TextField(
                obscureText: _isPasswordObscure,
                enabled: _passwordIsEditable,
                controller: profile_password_controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF527091),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            width: 1)),
                    disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            width: 1)),
                    //Get password from accounts table
                    //Obscure text = hidden
                    hintText: _isPasswordObscure == false
                        ? accounts.password_column.elementAt(account_id - 1)
                        : '${accounts.password_column.elementAt(account_id - 1).replaceAll(RegExp(r"."), "*")}',
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
                        icon: Icon(_isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                      ),
                    )),
              ),
            ),
          ]),
          //============================ Confirm Password ==================================
          //Confirm Password Label
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'CONFIRM PASSWORD',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(51, 77, 104, 1),
              ),
            ),
          ),
          //Confirm Password Textfield
          Stack(children: [
            //Editable
            Container(
              // color: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width - 40,
              height: 35,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(165, 184, 206, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  _confirmPasswordIsEditable ? Icons.done_outline : Icons.edit,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _confirmPasswordIsEditable = !_confirmPasswordIsEditable;
                  });
                },
              ),
            ),
            //Textfield
            Container(
              width: MediaQuery.of(context).size.width - 85,
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(2, 2))
                  ]),
              child: TextField(
                obscureText: _isConfirmPasswordObscure,
                enabled: _confirmPasswordIsEditable,
                controller: profile_confirm_password_controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF527091),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            width: 1)),
                    disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.3),
                            width: 1)),
                    //Get password from accounts table
                    //Obscure text = hidden
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 22, right: 20),
                      child: Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(_isConfirmPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordObscure =
                                !_isConfirmPasswordObscure;
                          });
                        },
                      ),
                    )),
              ),
            ),
          ]),

          //CHANGE PASSWORD BUTTON ========================================================
          Container(
            width: double.infinity,
            height: 56,
            margin: EdgeInsets.only(left: 30, right: 30, top: 35),
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
                  //if same
                  if (profile_password_controller.text.compareTo(
                          profile_confirm_password_controller.text) ==
                      0) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Update Password'),
                                content:
                                    const Text('Save changes to password?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: (() {
                                      accounts.password_column[account_id - 1] =
                                          profile_password_controller.text;
                                      Navigator.pop(context, 'Save');
                                      Navigator.pop(context);
                                    }),
                                    child: const Text('Save'),
                                  ),
                                ]));
                  } else {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Password not matched'),
                                content:
                                    const Text('Please confirm your password'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: (() {
                                      Navigator.pop(context, 'Ok');
                                    }),
                                    child: const Text('Ok'),
                                  ),
                                ]));
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
                      'CHANGE PASSWORD',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.how_to_reg,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
      //Floating Action Button -> applies all changes made to profile
      // floatingActionButton: FloatingActionButton.extended(
      //   //Updates the current account's profile
      //   onPressed: () {
      //     print('amazing');
      //   },
      //   backgroundColor: Color.fromRGBO(21, 119, 21, 1),
      //   label: Text('UPDATE'),
      //   icon: Icon(
      //     Icons.how_to_reg,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
