import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/firebase_repository.dart';
import '../screens/pageviews/chat_list_screen.dart';
import '../utils/universal_variables.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  PageController pageController;
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: PageView(
        children: <Widget>[
          Container(
            child:ChatListScreen()
          ),
          Center(
            child: Text(
              "Call Logs ",
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
          ),
          Center(
            child: Text("Call List Screen ",  style: TextStyle(fontSize: 35, color: Colors.white),),
          ),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: UniversalVariables.blackColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat,
                      color: (_page == 0)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  title: Text("Charts",
                      style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 0)
                              ? UniversalVariables.lightBlueColor
                              : Colors.grey))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call,
                      color: (_page == 1)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  title: Text("call",
                      style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 1)
                              ? UniversalVariables.lightBlueColor
                              : Colors.grey))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_phone,
                      color: (_page == 2)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  title: Text("contact phone",
                      style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 2)
                              ? UniversalVariables.lightBlueColor
                              : Colors.grey))),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
