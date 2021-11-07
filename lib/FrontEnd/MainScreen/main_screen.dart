import 'package:chat_app2/FrontEnd/MainScreen/chat_activity_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: WillPopScope(
          onWillPop: () async {
            if (_currentIndex > 0) {
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              toolbarHeight: 60,
              elevation: 10.0,
              shadowColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
                side: BorderSide(width: 0.7),
              ),
              title: const Text(
                "Chat App",
                style: TextStyle(fontSize: 25.0, fontFamily: 'Lora'),
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.search_outlined,
                    size: 25.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh_outlined,
                        size: 25.0,
                      )),
                )
              ],
              bottom: TabBar(
                indicatorPadding:
                    const EdgeInsets.only(left: 20.0, right: 20.0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.white,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                automaticIndicatorColorAdjustment: true,
                labelStyle: const TextStyle(
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w500,
                ),
                onTap: (index) {
                  print("\nIndex is: $index");
                  if (mounted) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                },
                tabs: const [
                  Tab(
                    child: Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Logs",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.store,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Center(),
                ChatActivityScreen(),
                Center(),
                Center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
