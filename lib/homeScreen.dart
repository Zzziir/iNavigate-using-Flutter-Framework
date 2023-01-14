import 'dart:async';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_project/loginScreen.dart';
import 'package:final_project/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './loginScreen.dart';
import './Malls.dart';
import 'mallScreen.dart';
import 'profileScreen.dart';
import './search.dart';

//testing
// String mall_name = '';

class HomeScreen extends StatefulWidget {
  int account_id;
  HomeScreen(this.account_id);

  @override
  State<HomeScreen> createState() => HomeScreenState(account_id);
}

class HomeScreenState extends State<HomeScreen> {
  final int account_id;
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  HomeScreenState(this.account_id);

  //Function to set suggested malls in the home screen
  List<Mall> setSuggestedMalls() {
    List<Mall> suggestedMalls = [];
    switch (accounts.latest_city_column.elementAt(account_id - 1)) {
      case 'Makati City':
        suggestedMalls.clear();
        suggestedMalls = malls_near_makati;
        break;
      case 'Taguig City':
        suggestedMalls.clear();
        suggestedMalls = malls_near_taguig;
        break;
      case 'Pasig City':
        suggestedMalls.clear();
        suggestedMalls = malls_near_pasig;
        break;
      case 'Pasay City':
        suggestedMalls.clear();
        suggestedMalls = malls_near_pasay;
        break;
      case 'Quezon City':
        suggestedMalls.clear();
        suggestedMalls = malls_near_quezon;
        break;
    }
    return suggestedMalls;
  }

  //Function to set map image
  String setMapImage() {
    String mapImage = accounts.latest_city_column.elementAt(account_id - 1);
    switch (mapImage) {
      case 'Makati City':
        mapImage = 'assets/makati_map.png';
        break;
      case 'Taguig City':
        mapImage = 'assets/taguig_map.png';
        break;
      case 'Pasig City':
        mapImage = 'assets/pasig_map.png';
        break;
      case 'Pasay City':
        mapImage = 'assets/pasay_map.png';
        break;
      case 'Quezon City':
        mapImage = 'assets/quezon_map.png';
    }
    return mapImage;
  }

  @override
  Widget build(BuildContext context) {
    SingleValueDropDownController homeScreen_dropdown_value =
        SingleValueDropDownController();

    FutureOr onGoBack(dynamic value) {
      setState(() {
        search_controller.clear();
      });
    }

    void navigateToSearchMallScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Search(account_id)),
      ).then(onGoBack);
    }

    void navigateToMallScreen(Mall mall) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MallScreen(account_id, mall)),
      );
    }

    return Scaffold(
      // drawer: NavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 120,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        //   onPressed: null,
        // ),
        backgroundColor: Color(0xFF527091),
        //City picked by the user
        //Changeable by clicking the textButton then a bottom sheet will appear
        title: TextButton(
          child: Text(
            accounts.latest_city_column[account_id - 1],
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          onPressed: (() {
            //Bottom Sheet for Changing City
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                backgroundColor: Color.fromRGBO(122, 152, 184, 1),
                context: context,
                builder: ((context) {
                  return FractionallySizedBox(
                    heightFactor: 0.7,
                    child: Wrap(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            //Column children
                            children: [
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromRGBO(92, 115, 139, 1),
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //Changing City Label
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 30, bottom: 10),
                                child: Text(
                                  'Changing City?',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ),
                              //Divider
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, bottom: 10),
                                child: const Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              ),
                              //label
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 30, bottom: 15),
                                child: Text(
                                  'SELECT A CITY HERE  ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              //dropdown
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                    )),
                                child: DropDownTextField(
                                  // initialValue: "Select City,
                                  searchDecoration: InputDecoration(
                                      hintText: 'Enter a city here'),
                                  textFieldDecoration: InputDecoration(
                                      icon: Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  )),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  controller: homeScreen_dropdown_value,
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
                                    DropDownValueModel(
                                        name: 'Makati City', value: "value1"),
                                    DropDownValueModel(
                                      name: 'Taguig City',
                                      value: "value2",
                                    ),
                                    DropDownValueModel(
                                        name: 'Pasig City', value: "value3"),
                                    DropDownValueModel(
                                      name: 'Pasay City',
                                      value: "value4",
                                    ),
                                    DropDownValueModel(
                                        name: 'Quezon City', value: "value5"),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          padding: EdgeInsets.only(right: 30),
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(127, 179, 129, 1),
                                shape: StadiumBorder()),
                            child: Text('UPDATE'),
                            onPressed: (() {
                              setState(() {
                                accounts.latest_city_column[account_id - 1] =
                                    homeScreen_dropdown_value
                                        .dropDownValue!.name;
                                Navigator.pop(context);
                              });
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  );
                }));
          }),
        ),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.only(
              bottom: 15,
            ),
            child: ElevatedButton(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Search for malls here',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onPressed: navigateToSearchMallScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
        ),
      ),
      //Drawer Navigation Bar
      drawer: new NavigationDrawer(account_id),
      //Scaffold Body
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 219, 219, 219),
          child: SingleChildScrollView(
            child: Column(children: [
              // Text(mall_name),
              //Map Image
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                height: 370,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5,
                          offset: Offset(5, 5))
                    ],
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(setMapImage())),
                    borderRadius: BorderRadius.all((Radius.circular(15)))),
              ),
              //Suggested Malls
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Suggested Malls',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: malls_near_makati.length,
                            itemBuilder: (BuildContext ctxt, int Index) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.white),
                                //navigates to mall screen depending on the clicked suggested mall
                                onPressed: (() {
                                  mallSearchHistory.search_id_column.add(
                                      mallSearchHistory
                                              .search_id_column.length +
                                          1);
                                  mallSearchHistory
                                      .account_id_column_foreign_key
                                      .add(account_id);
                                  mallSearchHistory.mall_name_column
                                      .add(setSuggestedMalls()[Index].name);
                                  navigateToMallScreen(
                                      setSuggestedMalls()[Index]);
                                }),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(15),
                                        width: 250,
                                        // color: Colors.purple[600],
                                        child: Container(
                                          width: 250,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    blurRadius: 5,
                                                    offset: Offset(5, 5))
                                              ],
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      setSuggestedMalls()[Index]
                                                          .mall_image)),
                                              borderRadius: BorderRadius.all(
                                                  (Radius.circular(15)))),
                                        ),
                                      ),
                                      //Mall Name Label and Operating Hours
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 25, top: 5),
                                        child: Row(
                                          children: [
                                            //mall name
                                            Text(
                                              setSuggestedMalls()[Index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            //operating hours
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 4,
                                                  bottom: 4),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    157, 188, 222, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: Text(
                                                setSuggestedMalls()[Index]
                                                    .operating_hours,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      //Location Label
                                      Container(
                                        width: 190,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 5),
                                        child: Text(
                                          setSuggestedMalls()[Index].location,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                              );
                            })

                        //=================================

                        ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

//========================= Navigation Drawer =================================

//returns a drawer navigation bar when called
class NavigationDrawer extends StatelessWidget {
  final int account_id;
  const NavigationDrawer(this.account_id);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Color(0xFF527091),
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
        child: Column(
          children: [
            Container(
                height: 120,
                width: 120,
                child: Image.asset('assets/user_image_placeholder.png')),
            SizedBox(
              height: 12,
            ),
            Text(
              accounts.name_column.elementAt(account_id - 1),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              accounts.email_column.elementAt(account_id - 1),
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) {
    //function to logout and go back to loginScreen

    void navigateToLoginScreen() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: (() {
              Navigator.pop(context);
            }),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: (() {
              //close navigation drawer before proceeding to profile screen
              Navigator.pop(context);

              //navigates to profile screen and passes the account id of the current user
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(account_id)))
                  .then((value) {
                profile_name_controller.clear();
                profile_email_controller.clear();
                profile_password_controller.clear();
                profile_confirm_password_controller.clear();
              });
            }),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          //Log out button
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: (() {
                // mall_name = ''; //for testing

                navigateToLoginScreen();
              })),
        ],
      ),
    );
  }
}
