import 'package:final_project/Shops.dart';
import 'package:final_project/shopData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import './main.dart';
import './mallScreen.dart';
import './Malls.dart';
import './homeScreen.dart';
import './tables.dart';

TextEditingController search_shop_controller = TextEditingController();

//ss = shop search
List<int> ss_search_id_column = [];
List<int> ss_account_id_column_foreign_key = [];
List<String> shop_name_column = [];

ShopSearchHistoryTable shopSearchHistory = ShopSearchHistoryTable(
    ss_search_id_column, ss_account_id_column_foreign_key, shop_name_column);

//current
List<String> current_user_SHOP_search_history = [];
int ss_count = 0;
int ss_ctr = 1;

class SearchShop extends StatefulWidget {
  int account_id;
  Mall mall;
  SearchShop(this.account_id, this.mall);

  @override
  State<SearchShop> createState() => SearchShopState(account_id, mall);
}

class SearchShopState extends State<SearchShop> {
  int account_id;
  Mall mall;
  SearchShopState(this.account_id, this.mall);

  List<Shop> Shops = [];
  List<Shop> AllShops = [];

  void ss_setEverythingInSearch() {
    print('natawag ang setEverythingInSearch');
    current_user_SHOP_search_history.clear();
    for (int index = 0;
        index < shopSearchHistory.search_id_column.length;
        index++) {
      //iaadd ang mga kaparehong account id sa current user from searchHistory table
      if (shopSearchHistory.account_id_column_foreign_key.elementAt(index) ==
          account_id) {
        current_user_SHOP_search_history
            .add(shopSearchHistory.shop_name_column.elementAt(index));
      }
    }
    ss_count = current_user_SHOP_search_history.length;
  }

  @override
  Widget build(BuildContext context) {
    ss_setEverythingInSearch();

    void ss_determineSearchInTable(String SearchText) {
      for (int index = 0;
          index < shopSearchHistory.search_id_column.length;
          index++) {
        //iaadd ang mga kaparehong account id sa current user from searchHistory table
        if (shopSearchHistory.account_id_column_foreign_key.elementAt(index) ==
            account_id) {
          if (ss_count == 4) {
            print('PUMASOK NA SA COUNT == 4');
            current_user_SHOP_search_history[0] =
                current_user_SHOP_search_history[1];
            current_user_SHOP_search_history[1] =
                current_user_SHOP_search_history[2];
            current_user_SHOP_search_history[2] =
                current_user_SHOP_search_history[3];
            current_user_SHOP_search_history[3] = SearchText;
            break;
          } else {
            ss_count += 1;
            print('else ng determinesearch pumasok');
            current_user_SHOP_search_history.add(SearchText);
            break;
          }
        }
      }
    }

    void addSearchShopHistory(String searchText) {
      if (current_user_SHOP_search_history.length < 4) {
        print(current_user_SHOP_search_history.length);
        print('pumasok sa unang if ng addsearchmall history');
        shopSearchHistory.search_id_column
            .add(shopSearchHistory.search_id_column.length + 1);
        shopSearchHistory.account_id_column_foreign_key.add(account_id);
        shopSearchHistory.shop_name_column.add(searchText);
      } else {
        print('pumasok sa else ng add search mall');
        print('mall search history DOT LENGTH');
        print(shopSearchHistory.search_id_column.length);
        for (int index = 0;
            index < shopSearchHistory.search_id_column.length;
            index++) {
          print('ctr value:');
          print(ss_ctr);
          if (shopSearchHistory.account_id_column_foreign_key
                  .elementAt(index) ==
              account_id) {
            if (ss_ctr == 1) {
              shopSearchHistory.shop_name_column[index] =
                  current_user_SHOP_search_history.elementAt(1);
              ss_ctr += 1;
            } else if (ss_ctr == 2) {
              shopSearchHistory.shop_name_column[index] =
                  current_user_SHOP_search_history.elementAt(2);
              ss_ctr += 1;
            } else if (ss_ctr == 3) {
              shopSearchHistory.shop_name_column[index] =
                  current_user_SHOP_search_history.elementAt(3);
              ss_ctr += 1;
            } else if (ss_ctr == 4) {
              shopSearchHistory.shop_name_column[index] = searchText;
            }
          }
        }
        ss_ctr = 1;
      }
      ss_determineSearchInTable(searchText);
    }

    AllShops = mall.floorPlan.shops;
    // print(Shops);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: TextField(
          controller: search_shop_controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 177, 177, 177).withOpacity(0.4),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(
                      color:
                          Color.fromARGB(255, 177, 177, 177).withOpacity(0.4),
                      width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(
                      color:
                          Color.fromARGB(255, 177, 177, 177).withOpacity(0.4),
                      width: 1)),
              // labelText: 'Username',
              // labelStyle:
              //     TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              hintText: 'Search for shops here',
              hintStyle: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
              prefixIcon: Container(
                margin: EdgeInsets.only(left: 22, right: 20),
                child: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 78, 78, 78),
                ),
              )),
          onChanged: searchShop,
          onSubmitted: searchShop,
        ),
        // actions: [
        // ],
      ),
      body: Column(children: [
        //Previous Malls Visited Label
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, top: 15),
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            'Previous shops visited',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 17),
          ),
        ),

        //Mall Search History
        Column(
          children: <Widget>[
            for (var i in current_user_SHOP_search_history)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 40),
                child: TextButton(
                  child: Text(
                    i,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  onPressed: (() {
                    print(i);
                    setState(() {
                      search_shop_controller.text = i;
                    });
                  }),
                ),
              )
          ],
        ),

        //Divider
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),

        //List of Shops
        Expanded(
          child: ListView.builder(
              itemCount: Shops.length,
              itemBuilder: ((context, index) {
                // print(Shops);
                final shop = Shops[index];
                return Column(children: [
                  ListTile(
                    title: Text(
                      shop.shop_name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    leading: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 140,
                        width: 100,
                        child: Image.asset(shop.shop_logo),
                      ),
                    ),
                    subtitle: Text(shop.shop_floor_label),
                    onTap: (() {
                      addSearchShopHistory(shop.shop_name);

                      //creates a ShopData object to pass contents after Navigator.pop
                      ShopData contents = new ShopData(shop.shop_image,
                          shop.shop_name, shop.shop_floor_label);
                      Navigator.pop(context, contents);
                      setState(() {
                        // floor_image = shop.shop_image;
                        search_shop_controller.clear();
                      });
                    }),
                  ),
                  //Divider
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ]);
              })),
        )
      ]),
    );
  }

  void searchShop(String query) {
    // print(Shops);
    final suggestions = AllShops.where((shop) {
      final shopTitle = shop.shop_name.toLowerCase();
      final input = query.toLowerCase();
      return shopTitle.contains(search_shop_controller.text.toLowerCase());
    }).toList();

    setState(() {
      Shops = suggestions;
    });
  }
}
