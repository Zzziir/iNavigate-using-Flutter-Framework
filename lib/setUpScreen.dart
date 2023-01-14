import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_project/homeScreen.dart';
import 'package:final_project/loginScreen.dart';
import 'package:flutter/material.dart';
import './loginScreen.dart';
import './homeScreen.dart';

class SetUpScreen extends StatefulWidget {
  final int account_id;

  SetUpScreen(this.account_id);

  @override
  State<SetUpScreen> createState() => SetUpScreenState(account_id);
}

class SetUpScreenState extends State<SetUpScreen> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  final int account_id;
  SetUpScreenState(this.account_id);

  @override
  Widget build(BuildContext context) {
    SingleValueDropDownController setUpScreen_dropdown_value =
        SingleValueDropDownController();

    void navigateToHomeScreen() {
      setState(() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(account_id)),
          (Route<dynamic> route) => false,
        );
      });
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      // ),
      body: Container(
        alignment: Alignment.topLeft,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color.fromARGB(255, 0, 51, 105),
              Color.fromARGB(0, 0, 66, 124),
            ])),
        child: Column(children: [
          Container(
            child: Image.asset('assets/Logo_with_shadow.png'),
            margin: EdgeInsets.only(top: 70, bottom: 15),
            height: 150,
            width: 120,
          ),
          Center(
              child: Column(children: [
            Text(
              'Let us set up first your  ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
            Text(
              'iNavigate experience! ',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: const Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                'SELECT A CITY  ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  )),
              child: DropDownTextField(
                // initialValue: "Select City,
                searchDecoration:
                    InputDecoration(hintText: 'Enter a city here'),
                textFieldDecoration: InputDecoration(
                    icon: Icon(
                  Icons.location_city,
                  color: Colors.white,
                )),
                padding: EdgeInsets.symmetric(horizontal: 20),
                controller: setUpScreen_dropdown_value,
                textStyle: TextStyle(color: Colors.white),
                clearOption: false,

                textFieldFocusNode: textFieldFocusNode,
                searchFocusNode: searchFocusNode,
                // searchAutofocus: true,
                dropDownItemCount: 4,
                searchShowCursor: false,
                enableSearch: true,
                searchKeyboardType: TextInputType.text,
                dropDownList: const [
                  DropDownValueModel(name: 'Makati City', value: "value1"),
                  DropDownValueModel(
                    name: 'Taguig City',
                    value: "value2",
                  ),
                  DropDownValueModel(name: 'Pasig City', value: "value3"),
                  DropDownValueModel(
                    name: 'Pasay City',
                    value: "value4",
                  ),
                  DropDownValueModel(name: 'Quezon City', value: "value5"),
                ],
                onChanged: (val) {},
              ),
            ),
          ])),

          //Tester for Data
          // Text(accounts.account_id_column.elementAt(account_id - 1).toString()),
          // Text(accounts.username_column.elementAt(account_id - 1)),
          // Text(accounts.email_column.elementAt(account_id - 1)),
          // Text(accounts.name_column.elementAt(account_id - 1)),
          // Text(accounts.password_column.elementAt(account_id - 1)),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          accounts.latest_city_column[account_id - 1] =
              setUpScreen_dropdown_value.dropDownValue!.name;
          print(accounts.latest_city_column[account_id - 1]);
          navigateToHomeScreen();
        },
        backgroundColor: Colors.blue,
        label: Text('Apply'),
        icon: Icon(
          Icons.update,
          color: Colors.white,
        ),
      ),
    );
  }
}
