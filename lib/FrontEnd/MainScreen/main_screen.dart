import 'package:animations/animations.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/fb_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/google_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/signup_auth.dart';
import 'package:chat_app2/FrontEnd/AuthUi/login_page.dart';
import 'package:chat_app2/FrontEnd/MainScreen/chat_activity_screen.dart';
import 'package:chat_app2/FrontEnd/MainScreen/general_connection_section.dart';
import 'package:chat_app2/FrontEnd/MainScreen/logs_collection.dart';
import 'package:chat_app2/FrontEnd/MenuScreens/profile_screen.dart';
import 'package:chat_app2/FrontEnd/MenuScreens/settings_screen.dart';
import 'package:chat_app2/FrontEnd/MenuScreens/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final EmailAndPasswordAuth emailAndPasswordAuth = EmailAndPasswordAuth();
  final GoogleAuth googleAuth = GoogleAuth();
  final FacebookAuthentication facebookAuthentication =
      FacebookAuthentication();

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
            drawer: _drawer(),
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
                LogsCollection(),
                GeneralMessagingSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      elevation: 10.0,
      child: Container(
        color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
              child: Center(
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/google.png'),
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? MediaQuery.of(context).size.height * (1.2 / 8) / 2.5
                      : MediaQuery.of(context).size.height * (2.5 / 8) / 2.5,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            _menuOptions(Icons.person_outline_rounded, 'Profile'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.settings, 'Setting'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.support_outlined, 'Support'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.description_outlined, 'About'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.logout_outlined, 'Log out'),
            const SizedBox(
              height: 30.0,
            ),
            exitButtonCall(),
          ],
        ),
      ),
    );
  }

  Widget _menuOptions(IconData icon, String menuOptionIs) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
      closedElevation: 0.0,
      openElevation: 3.0,
      closedColor: Colors.white,
      openColor: Colors.white,
      middleColor: Colors.white,
      onClosed: (value) {
        // print('Profile Page Closed');
        // if (mounted) {
        //   setState(() {
        //     ImportantThings.findImageUrlAndUserName();
        //   });
        // }
      },
      openBuilder: (context, openWidget) {
        if (menuOptionIs == 'Profile') {
          return ProfileScreen();
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        } else if (menuOptionIs == 'Setting') {
          return SettingsWindow();
        } else if (menuOptionIs == 'Support') {
          return SupportMenuMaker();
        }
        // else if (menuOptionIs == 'About') return AboutSection();
        else if (menuOptionIs == "Log out") {
          _logOut();
        }
        return Center();
      },
      closedBuilder: (context, closeWidget) {
        return SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.deepPurple,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                menuOptionIs,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget exitButtonCall() {
    return GestureDetector(
      onTap: () async {
        await SystemNavigator.pop(animated: true);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.exit_to_app_rounded,
              color: Colors.deepPurple,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Exit',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _logOut() async {
    final bool googleResponse = await googleAuth.logOut();
    if (!googleResponse) {
      final bool fbResponse = await facebookAuthentication.logOut();
      if (!fbResponse) {
        await emailAndPasswordAuth.logOut();
      }
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
  }
}
