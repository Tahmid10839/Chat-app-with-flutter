import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

// import 'package:generation/BackendAndDatabaseManager/global_controller/different_types.dart';
// import 'package:generation/FrontEnd/MenuScreen/Settings/chat_wallpaper_maker.dart';
// import 'package:generation/FrontEnd/MenuScreen/Settings/chat_history_maker_and_media_view.dart';
// import 'package:generation/FrontEnd/MenuScreen/Settings/settings_notification_screen.dart';
// import 'package:generation/FrontEnd/MenuScreen/Settings/phone_call_config.dart';

class SettingsWindow extends StatefulWidget {
  @override
  _SettingsWindowState createState() => _SettingsWindowState();
}

class _SettingsWindowState extends State<SettingsWindow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          foregroundColor: Colors.black,
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Lora',
              letterSpacing: 1.0,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            everySettingsItem(
                mainText: 'Notification',
                icon: Icons.notification_important_outlined,
                smallDescription: 'Different Notification Customization'),
            const SizedBox(
              height: 15.0,
            ),
            everySettingsItem(
                mainText: 'Chat Wallpaper',
                icon: Icons.wallpaper_outlined,
                smallDescription: 'Change Chat Common Wallpaper'),
            const SizedBox(
              height: 15.0,
            ),
            everySettingsItem(
                mainText: 'Generation Direct Calling Setting',
                icon: Icons.call,
                smallDescription: 'Add Phone Number to Receive Call'),
            const SizedBox(
              height: 15.0,
            ),
            everySettingsItem(
                mainText: 'Chat History',
                icon: Entypo.text_document_inverted,
                smallDescription: 'Chat History Including Media'),
            const SizedBox(
              height: 15.0,
            ),
            everySettingsItem(
                mainText: 'Storage',
                icon: Icons.storage,
                smallDescription: 'Storage Usage'),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: Text(
                  'Copyright © 2021 @ Chat App',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget everySettingsItem(
      {required String mainText,
      required IconData icon,
      required String smallDescription}) {
    return OpenContainer(
      closedElevation: 0.0,
      openColor: Colors.white,
      middleColor: Colors.white,
      closedColor: Colors.white,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (_, __) {
        switch (mainText) {
          // case 'Notification':
          //   return SettingsNotificationConfiguration();
          //
          // case 'Chat Wallpaper':
          //   return ChatWallPaperMaker(allUpdatePermission: true, userName: '');
          //
          // case 'Generation Direct Calling Setting':
          //   return PhoneNumberConfig();
          //
          // case 'Chat History':
          //   return ChatHistoryMakerAndMediaViewer(
          //       historyOrMediaChoice: HistoryOrMediaChoice.History);
          //
          // case 'Storage':
          //   return ChatHistoryMakerAndMediaViewer(
          //       historyOrMediaChoice: HistoryOrMediaChoice.Media);

        }
        return Center(
          child: Text(
            'Sorry, Not yet Implemented',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        );
      },
      closedBuilder: (_, __) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 70.0,
          margin: EdgeInsets.only(
            left: 20.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    mainText,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    left: 40.0,
                  ),
                  child: Text(
                    smallDescription,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
