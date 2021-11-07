import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ChatActivityScreen extends StatefulWidget {
  @override
  _ChatActivityScreenState createState() => _ChatActivityScreenState();
}

class _ChatActivityScreenState extends State<ChatActivityScreen> {
  bool _isLoading = false;

  final List<String> _allUserConnectionActivity = [];

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
          child: Column(
            children: [
              _activityList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activityList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).orientation == Orientation.portrait
      //     ? MediaQuery.of(context).size.height * (1.5 / 8)
      //     : MediaQuery.of(context).size.height,
      // height: MediaQuery.of(context).size.height / 8,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
            return _allUserCollectionList(context, position);
          }),
    );
  }

  Widget _allUserCollectionList(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      // height: 100.0,
      child: Text("Chat App"),
    );
    // Container(
    //   margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/10),
    //   padding: EdgeInsets.only(top: 3.0),
    //   height: MediaQuery.of(context).size.height * (1.5/8),
    //   child: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           if(_allUserConnectionActivity.contains('[[[new_activity]]]'))
    //             Container(

    //               height: MediaQuery.of(context).orientation == Orientation.portrait ? (MediaQuery.of(context).size.height * (1.2/7.95)/2.5)*2 : (MediaQuery.of(context).size.height * (2.5/7.95)/2.5)*2,

    //               width: MediaQuery.of(context).orientation == Orientation.portrait ? (MediaQuery.of(context).size.height * (1.2/7.95)/2.5)*2 : (MediaQuery.of(context).size.height * (2.5/7.95)/2.5)*2,

    //               child: const CircularProgressIndicator(
    //                 color: Colors.deepPurple,
    //                 value: 1.0,
    //               ),
    //             ),
    //             OpenContainer(
    //               closedColor: Colors.deepPurple,
    //               openColor: Colors.deepPurple,
    //               middleColor: Colors.deepPurple,
    //               closedElevation: 0.0,
    //               closedShape: CircleBorder(),
    //               transitionDuration: Duration(milliseconds: 500),
    //               transitionType: ContainerTransitionType.fadeThrough,
    //               openBuilder: (context,openWidget){
    //                 return Center();
    //               },
    //               closedBuilder: (context,closeWidget){
    //                 return CircleAvatar(
    //                   backgroundImage: ExactAssetImage("assets/images/google.png"),
    //                   radius: MediaQuery.of(context).orientation == Orientation.portrait ? (MediaQuery.of(context).size.height * (1.2/8)/2.5) : (MediaQuery.of(context).size.height * (2.5/8)/2.5),
    //                 );
    //               },
    //               // closedBuilder: closedBuilder,
    //               // openBuilder: openBuilder
    //             ),
    //             index == 0
    //             ? Padding(
    //               padding: EdgeInsets.only(top: MediaQuery.of(context).orientation == Orientation.portrait ? (MediaQuery.of(context).size.height * (0.7/8) - 10) : (MediaQuery.of(context).size.height * (1.5/8) - 10),

    //               left: MediaQuery.of(context).orientation == Orientation.portrait ? (MediaQuery.of(context).size.width/3 - 65) : (MediaQuery.of(context).size.width /8 - 15),
    //               ),

    //               child: Container(
    //                 decoration: const BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: Colors.deepPurple,
    //                 ),
    //                 child: GestureDetector(
    //                   child: Icon(
    //                     Icons.add,
    //                     color: Colors.white,
    //                     size: 25.0,
    //                   ),
    //                 ),
    //               ),

    //             )
    //             : const SizedBox(),
    //         ],
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         margin: EdgeInsets.only(top: 7.0),
    //         child: Text('Chat App',style: TextStyle(fontSize: 12.0,color: Colors.black),),
    //       ),
    //     ],
    //   ),
    // );
  }
}
