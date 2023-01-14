import 'package:final_project/mallScreen.dart';
import 'package:final_project/tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import './main.dart';
import './Malls.dart';
import './homeScreen.dart';

TextEditingController search_controller = TextEditingController();

//ms = mall search
List<int> ms_search_id_column = [];
List<int> ms_account_id_column_foreign_key = [];
List<String> mall_name_column = [];

MallSearchHistoryTable mallSearchHistory = MallSearchHistoryTable(
    ms_search_id_column, ms_account_id_column_foreign_key, mall_name_column);

//current
List<String> current_user_mall_search_history = [];
int ms_count = 0;
int ms_ctr = 1;

class Search extends StatefulWidget {
  int account_id;
  Search(this.account_id);

  @override
  State<Search> createState() => SearchState(account_id);
}

class SearchState extends State<Search> {
  int account_id;
  SearchState(this.account_id);

  List<Mall> Malls = allMalls;

  void ms_setEverythingInSearch() {
    print('natawag ang setEverythingInSearch');
    current_user_mall_search_history.clear();
    for (int index = 0;
        index < mallSearchHistory.search_id_column.length;
        index++) {
      //iaadd ang mga kaparehong account id sa current user from searchHistory table
      if (mallSearchHistory.account_id_column_foreign_key.elementAt(index) ==
          account_id) {
        current_user_mall_search_history
            .add(mallSearchHistory.mall_name_column.elementAt(index));
      }
    }
    ms_count = current_user_mall_search_history.length;
  }

  @override
  Widget build(BuildContext context) {
    ms_setEverythingInSearch();
    //
    void ms_determineSearchInTable(String SearchText) {
      for (int index = 0;
          index < mallSearchHistory.search_id_column.length;
          index++) {
        //iaadd ang mga kaparehong account id sa current user from searchHistory table
        if (mallSearchHistory.account_id_column_foreign_key.elementAt(index) ==
            account_id) {
          if (ms_count == 4) {
            print('PUMASOK NA SA COUNT == 4');
            current_user_mall_search_history[0] =
                current_user_mall_search_history[1];
            current_user_mall_search_history[1] =
                current_user_mall_search_history[2];
            current_user_mall_search_history[2] =
                current_user_mall_search_history[3];
            current_user_mall_search_history[3] = SearchText;
            break;
          } else {
            ms_count += 1;
            print('else ng determinesearch pumasok');
            current_user_mall_search_history.add(SearchText);
            break;
          }
        }
      }
    }

    void addSearchMallHistory(String searchText) {
      if (current_user_mall_search_history.length < 4) {
        print(current_user_mall_search_history.length);
        print('pumasok sa unang if ng addsearchmall history');
        mallSearchHistory.search_id_column
            .add(mallSearchHistory.search_id_column.length + 1);
        mallSearchHistory.account_id_column_foreign_key.add(account_id);
        mallSearchHistory.mall_name_column.add(searchText);
      } else {
        print('pumasok sa else ng add search mall');
        print('mall search history DOT LENGTH');
        print(mallSearchHistory.search_id_column.length);
        for (int index = 0;
            index < mallSearchHistory.search_id_column.length;
            index++) {
          print('ctr value:');
          print(ms_ctr);
          if (mallSearchHistory.account_id_column_foreign_key
                  .elementAt(index) ==
              account_id) {
            if (ms_ctr == 1) {
              mallSearchHistory.mall_name_column[index] =
                  current_user_mall_search_history.elementAt(1);
              ms_ctr += 1;
            } else if (ms_ctr == 2) {
              mallSearchHistory.mall_name_column[index] =
                  current_user_mall_search_history.elementAt(2);
              ms_ctr += 1;
            } else if (ms_ctr == 3) {
              mallSearchHistory.mall_name_column[index] =
                  current_user_mall_search_history.elementAt(3);
              ms_ctr += 1;
            } else if (ms_ctr == 4) {
              mallSearchHistory.mall_name_column[index] = searchText;
            }
          }
        }
        ms_ctr = 1;
      }
      ms_determineSearchInTable(searchText);
    }

    //
    // void addSearchMallHistory(String searchText) {
    //   if (current_user_mall_search_history.length == 4) {
    //     current_user_mall_search_history[3] =
    //         current_user_mall_search_history[2];
    //     current_user_mall_search_history[2] =
    //         current_user_mall_search_history[1];
    //     current_user_mall_search_history[1] =
    //         current_user_mall_search_history[0];
    //     current_user_mall_search_history[0] = searchText;
    //   } else {
    //     current_user_mall_search_history.add(searchText);
    //   }
    // }

    void navigateToMallScreen(Mall mall) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MallScreen(account_id, mall)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: TextField(
          controller: search_controller,
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
              hintText: 'Enter mall name here',
              hintStyle: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
              prefixIcon: Container(
                margin: EdgeInsets.only(left: 22, right: 20),
                child: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 78, 78, 78),
                ),
              )),
          onChanged: searchMall,
          onSubmitted: searchMall,
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
            'Previous malls visited',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 17),
          ),
        ),

        //Mall Search History
        Column(
          children: <Widget>[
            for (var i in current_user_mall_search_history)
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
                      search_controller.text = i;
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
        //List of Malls
        Expanded(
          child: ListView.builder(
              itemCount: Malls.length,
              itemBuilder: ((context, index) {
                final mall = Malls[index];
                return ListTile(
                    // contentPadding: EdgeInsets.all(15),
                    title: Stack(
                      children: [
                        //Mall Image
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 15),
                          width: double.infinity - 20,
                          height: 200,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 5,
                                    offset: Offset(5, 5))
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(mall.mall_image)),
                              borderRadius:
                                  BorderRadius.all((Radius.circular(15)))),
                        ),
                        //Mall Name Label
                        Container(
                          width: double.infinity - 20,
                          height: 200,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 5, bottom: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.all(
                                        (Radius.circular(15)))),
                                child: Text(
                                  mall.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        //Mall Operating Hours
                        Container(
                          width: double.infinity - 20,
                          height: 165,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 5, bottom: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(68, 153, 37, 1)
                                        .withOpacity(0.8),
                                    borderRadius: BorderRadius.all(
                                        (Radius.circular(15)))),
                                child: Text(
                                  mall.operating_hours,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ],
                    ),
                    //Mall Location
                    subtitle: Text(mall.location),
                    onTap: (() {
                      // mall_name = mall.name; //for testing lang to
                      print('testing');
                      addSearchMallHistory(mall.name);
                      print('current user mall search history:');
                      print(current_user_mall_search_history);

                      print('mall search history table mall name column:');
                      print(mallSearchHistory.mall_name_column);

                      navigateToMallScreen(mall);
                      setState(() {
                        search_controller.clear();
                      });
                    }));
              })),
        )
      ]),
    );
  }

  void searchMall(String query) {
    final suggestions = allMalls.where((mall) {
      final mallTitle = mall.name.toLowerCase();
      final input = query.toLowerCase();
      return mallTitle.contains(search_controller.text.toLowerCase());
    }).toList();

    setState(() {
      Malls = suggestions;
    });
  }
}
