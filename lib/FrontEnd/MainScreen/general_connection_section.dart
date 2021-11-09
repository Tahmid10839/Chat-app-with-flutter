import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';

class GeneralMessagingSection extends StatefulWidget {
  @override
  _GeneralMessagingSectionState createState() =>
      _GeneralMessagingSectionState();
}

class _GeneralMessagingSectionState extends State<GeneralMessagingSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: CircleList(
              initialAngle: 55,
              outerRadius:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.width / 6
                      : MediaQuery.of(context).size.width / 2.2,
              innerRadius:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.width / 13
                      : MediaQuery.of(context).size.width / 4,
              showInitialAnimation: true,
              innerCircleColor: const Color.fromRGBO(34, 48, 60, 1),
              outerCircleColor: const Color.fromRGBO(0, 0, 0, 0.1),
              origin: const Offset(0, 0),
              rotateMode: RotateMode.allRotate,
              centerWidget: const Center(
                child: Text(
                  "C",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 65.0,
                  ),
                ),
              ),
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      //_imageOrVideoSend(imageSource: ImageSource.camera);
                    },
                    onLongPress: () async {
                      //_imageOrVideoSend(imageSource: ImageSource.gallery);
                    },
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      // _imageOrVideoSend(
                      //     imageSource: ImageSource.camera, type: 'video');
                    },
                    onLongPress: () async {
                      // _imageOrVideoSend(
                      //     imageSource: ImageSource.gallery, type: 'video');
                    },
                    child: const Icon(
                      Icons.video_collection,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      //_extraTextManagement(MediaTypes.Text);
                    },
                    child: const Icon(
                      Icons.text_fields_rounded,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      //await _documentSend();
                    },
                    child: const Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    onTap: () async {
                      // if (!await NativeCallback().callToCheckNetworkConnectivity())
                      //   _showDiaLog(titleText: 'No Internet Connection');
                      // else {
                      //   _showDiaLog(titleText: 'Wait for map');
                      //   await _locationSend();
                      // }
                    },
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      )),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.music_note_rounded,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ),
                    onTap: () async {
                      //await _voiceSend();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
