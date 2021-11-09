import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ChatActivityScreen extends StatefulWidget {
  @override
  _ChatActivityScreenState createState() => _ChatActivityScreenState();
}

class _ChatActivityScreenState extends State<ChatActivityScreen> {
  final bool _isLoading = false;

  final List<String> _allUserConnectionActivity = [
    "Chat App",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names"
  ];
  final List<String> _allConnectionsUserName = [
    "Chat App",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names",
    "Other Names",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoadingOverlay(
          isLoading: _isLoading,
          color: Colors.black54,
          progressIndicator: const CircularProgressIndicator(
            backgroundColor: Colors.deepPurple,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              _activityList(context),
              _connectionList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activityList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height / 3
          : MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _allUserConnectionActivity.length,
          itemBuilder: (context, position) {
            return _activityCollectionList(context, position);
          }),
    );
  }

  Widget _activityCollectionList(BuildContext context, int index) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              OpenContainer(
                closedColor: Colors.deepPurple,
                openColor: Colors.deepPurple,
                middleColor: Colors.deepPurple,
                closedShape: CircleBorder(),
                closedElevation: 0.0,
                transitionDuration: const Duration(milliseconds: 500),
                transitionType: ContainerTransitionType.fadeThrough,
                openBuilder: (context, openWidget) {
                  return Center();
                },
                closedBuilder: (context, closeWidget) {
                  return const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        ExactAssetImage("assets/images/google.png"),
                    radius: 35,
                  );
                },
              ),
              index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 50.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple,
                        ),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 7.0),
            width: 80,
            child: const Text(
              'Nazre Imam Tahmid',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _connectionList(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).orientation == Orientation.portrait
                ? 5.0
                : 0.0),
        padding: const EdgeInsets.only(top: 18.0),
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * (2.9 / 8)
            : MediaQuery.of(context).size.height * (5.3 / 8),
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // color: Colors.deepPurple,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, -5.0), // shadow direction: bottom right
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          border: Border.all(
            color: Colors.black26,
            width: 1.0,
          ),
        ),
        child: ReorderableListView.builder(
          onReorder: (first, last) {
            // if (mounted) {
            //   setState(() {
            //     final String _draggableConnection =
            //     this._allConnectionsUserName.removeAt(first);
            //
            //     this._allConnectionsUserName.insert(
            //         last >= this._allConnectionsUserName.length
            //             ? this._allConnectionsUserName.length
            //             : last > first
            //             ? --last
            //             : last,
            //         _draggableConnection);
            //   });
            // }
          },
          itemCount: _allConnectionsUserName.length,
          itemBuilder: (context, position) {
            return chatTileContainer(
                context, position, _allConnectionsUserName[position]);
          },
        ),
      ),
    );
  }

  Widget chatTileContainer(BuildContext context, int index, String _userName) {
    return Card(
        key: Key('$index'),
        elevation: 0.0,
        // color: const Color.fromRGBO(31, 51, 71, 1),
        child: Container(
          //padding: EdgeInsets.only(left: 1.0, right: 1.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: Colors.white,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              print("Chat List Pressed");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: OpenContainer(
                    closedColor: Colors.white,
                    openColor: Colors.white,
                    middleColor: Colors.white,
                    closedShape: CircleBorder(),
                    closedElevation: 0.0,
                    transitionDuration: Duration(milliseconds: 500),
                    transitionType: ContainerTransitionType.fadeThrough,
                    openBuilder: (_, __) {
                      return Center();
                    },
                    closedBuilder: (_, __) {
                      return CircleAvatar(
                        radius: 30.0,
                        // backgroundColor: const Color.fromRGBO(31, 51, 71, 1),
                        // backgroundColor: Colors.deepPurple,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            ExactAssetImage('assets/images/google.png'),
                        //getProperImageProviderForConnectionsCollection(
                        //    _userName),
                      );
                    },
                  ),
                ),
                OpenContainer(
                  closedColor: Colors.white,
                  openColor: Colors.white,
                  middleColor: Colors.white,
                  closedElevation: 0.0,
                  openElevation: 0.0,
                  transitionDuration: Duration(milliseconds: 500),
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (context, openWidget) {
                    return Center();
                    // ChatScreen(
                    //   userName: _userName,
                    // );
                  },
                  closedBuilder: (context, closeWidget) {
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2 + 30,
                      padding: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        left: 5.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            _userName.length <= 18
                                ? _userName
                                : '${_userName.replaceRange(18, _userName.length, '...')}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),

                          /// For Extract latest Conversation Message
//                          _latestDataForConnectionExtractPerfectly(_userName)
                          Text(
                            'Hello Sam',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '12:00',
                          style: TextStyle(color: Colors.purpleAccent),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // Widget _activityList(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 20.0),
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).orientation == Orientation.portrait
  //         ? MediaQuery.of(context).size.height * (1.5 / 8)
  //         : MediaQuery.of(context).size.height * (3 / 8),
  //     child: ListView.builder(
  //         itemCount: _allUserConnectionActivity.length,
  //         itemBuilder: (context, position) {
  //           return _allUserCollectionList(context, position);
  //         }),
  //   );
  // }

  // Widget _allUserCollectionList(BuildContext context, int index) {
  //   return Container(
  //     margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
  //     padding: EdgeInsets.only(top: 3.0),
  //     height: MediaQuery.of(context).size.height * (1.5 / 8),
  //     child: Column(
  //       children: [
  //         Stack(
  //           children: [
  //             if (_allUserConnectionActivity[index]
  //                 .contains('[[[new_activity]]]'))
  //               Container(
  //                 height:
  //                     MediaQuery.of(context).orientation == Orientation.portrait
  //                         ? (MediaQuery.of(context).size.height *
  //                                 (1.2 / 7.95) /
  //                                 2.5) *
  //                             2
  //                         : (MediaQuery.of(context).size.height *
  //                                 (2.5 / 7.95) /
  //                                 2.5) *
  //                             2,
  //                 width:
  //                     MediaQuery.of(context).orientation == Orientation.portrait
  //                         ? (MediaQuery.of(context).size.height *
  //                                 (1.2 / 7.95) /
  //                                 2.5) *
  //                             2
  //                         : (MediaQuery.of(context).size.height *
  //                                 (2.5 / 7.95) /
  //                                 2.5) *
  //                             2,
  //                 child: const CircularProgressIndicator(
  //                   color: Colors.deepPurple,
  //                   value: 1.0,
  //                 ),
  //               ),
  //             OpenContainer(
  //               closedColor: Colors.deepPurple,
  //               openColor: Colors.deepPurple,
  //               middleColor: Colors.deepPurple,
  //               closedElevation: 0.0,
  //               closedShape: CircleBorder(),
  //               transitionDuration: Duration(milliseconds: 500),
  //               transitionType: ContainerTransitionType.fadeThrough,
  //               openBuilder: (context, openWidget) {
  //                 return Center();
  //               },
  //               closedBuilder: (context, closeWidget) {
  //                 return CircleAvatar(
  //                   backgroundImage:
  //                       ExactAssetImage("assets/images/google.png"),
  //                   radius: MediaQuery.of(context).orientation ==
  //                           Orientation.portrait
  //                       ? (MediaQuery.of(context).size.height * (1.2 / 8) / 2.5)
  //                       : (MediaQuery.of(context).size.height *
  //                           (2.5 / 8) /
  //                           2.5),
  //                 );
  //               },
  //             ),
  //             index == 0
  //                 ? Padding(
  //                     padding: EdgeInsets.only(
  //                       top: MediaQuery.of(context).orientation ==
  //                               Orientation.portrait
  //                           ? (MediaQuery.of(context).size.height * (0.7 / 8) -
  //                               10)
  //                           : (MediaQuery.of(context).size.height * (1.5 / 8) -
  //                               10),
  //                       left: MediaQuery.of(context).orientation ==
  //                               Orientation.portrait
  //                           ? (MediaQuery.of(context).size.width / 3 - 65)
  //                           : (MediaQuery.of(context).size.width / 8 - 15),
  //                     ),
  //                     child: Container(
  //                       decoration: const BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         color: Colors.deepPurple,
  //                       ),
  //                       child: GestureDetector(
  //                         child: Icon(
  //                           Icons.add,
  //                           color: Colors.white,
  //                           size: 25.0,
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 : const SizedBox(),
  //           ],
  //         ),
  //         Container(
  //           alignment: Alignment.center,
  //           margin: EdgeInsets.only(top: 7.0),
  //           child: Text(
  //             'Chat App',
  //             style: TextStyle(fontSize: 12.0, color: Colors.black),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
