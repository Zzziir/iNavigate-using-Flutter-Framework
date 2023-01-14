import 'dart:async';

import 'package:final_project/searchShop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './Malls.dart';
import './shopData.dart';

class MallScreen extends StatefulWidget {
  int account_id;
  Mall mall;
  MallScreen(this.account_id, this.mall);

  @override
  State<MallScreen> createState() => MallScreenState(
      account_id, mall, mall.floorPlan.floors.elementAt(0).floor_image);
}

class MallScreenState extends State<MallScreen> {
  int account_id;
  final Mall mall;
  String floor_image;
  String shop_name = 'Welcome!';
  String floor_level = 'Search for a shop to display in the map';
  MallScreenState(this.account_id, this.mall, this.floor_image);

  // String setFloorImage(in) {
  //   //Shows the first floor of the mall first
  //   String floor_image = mall.floorPlan.floors.elementAt(0).floor_image;
  //   return floor_image;
  // }

  @override
  Widget build(BuildContext context) {
    // FutureOr onGoBack(dynamic value) {
    //   setState(() {
    //     search_shop_controller.clear();
    //   });
    // }

    void updateFloorImage(ShopData content) {
      setState(() {
        shop_name = content.shop_name;
        floor_image = content.image;
        floor_level = content.floor_level;
        search_shop_controller.clear();
      });
    }

    void navigateToSearchShopScreen() async {
      //Gets data from anything popped in the second screen
      final content = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchShop(account_id, mall)),
      );
      updateFloorImage(content);
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Color(0xFF527091),
          title: Text(
            mall.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                      'Search for shops here',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                onPressed: navigateToSearchShopScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 219, 219, 219),
          child: SingleChildScrollView(
              child: Column(children: [
            //Map Image
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 500,
              child: Stack(
                children: [
                  //Floor Plan image
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 16, bottom: 16, right: 20, left: 45),
                    height: 480,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5,
                              offset: Offset(5, 5))
                        ],
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(floor_image)),
                        borderRadius: BorderRadius.all((Radius.circular(15)))),
                  ),
                  //Buttons
                  Container(
                    // alignment: Alignment.bottomLeft,
                    // color: Colors.black.withOpacity(0.1),
                    margin: EdgeInsets.only(top: 30),
                    width: 50,
                    height: 500,
                    child: ListView.builder(
                        itemCount: mall.floorPlan.floors.length,
                        itemBuilder: (context, Index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: ElevatedButton(
                              onPressed: (() => setState(() {
                                    floor_image = mall.floorPlan.floors
                                        .elementAt(Index)
                                        .floor_image;
                                    shop_name = mall.floorPlan.floors
                                        .elementAt(Index)
                                        .floor_name;
                                    floor_level = '';
                                    //Debugging
                                    // print(floor_image);
                                    // print(mall.floorPlan.floors
                                    //     .elementAt(Index)
                                    //     .floor_image);
                                  })),
                              child: Text(
                                mall.floorPlan.floors
                                    .elementAt(Index)
                                    .floor_abbrev,
                                style: TextStyle(color: Colors.grey),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, backgroundColor: Colors.white),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            //Shop Name and Floor Level Label
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                        offset: Offset(5, 5))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              height: 80,
              width: double.infinity + 50,
              margin: EdgeInsets.only(left: 55, top: 5),
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Shop name
                  Text(
                    shop_name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  //Floor level
                  Text(
                    floor_level,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ])), //
        ));
  }
}
