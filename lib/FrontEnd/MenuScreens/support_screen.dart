import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import 'package:generation/FrontEnd/MenuScreen/Support/mail_content_maker.dart';

class SupportMenuMaker extends StatefulWidget {
  const SupportMenuMaker({Key? key}) : super(key: key);

  @override
  _SupportMenuMakerState createState() => _SupportMenuMakerState();
}

class _SupportMenuMakerState extends State<SupportMenuMaker> {
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
            'Support',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _getListOption(
                  icon: Icon(
                    Icons.report_gmailerrorred_outlined,
                    size: 30.0,
                    color: Colors.red,
                  ),
                  title: 'Report a Problem',
                  extraText: 'About App Crashing, Bugs Report'),
              _getListOption(
                icon: Icon(
                  Icons.request_page_outlined,
                  size: 30.0,
                  color: Colors.green,
                ),
                title: 'Request a Feature',
                extraText: 'Any New Feature in your Mind',
              ),
              _getListOption(
                icon: Icon(
                  Icons.featured_play_list_outlined,
                  size: 30.0,
                  color: Colors.amber,
                ),
                title: 'Send Feedback',
                extraText: 'Your Experience of that App',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getListOption(
      {required Icon icon, required String title, required String extraText}) {
    return OpenContainer(
      closedColor: Colors.white,
      middleColor: Colors.white,
      openColor: Colors.white,
      closedElevation: 0.0,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
      openBuilder: (_, __) {
        print(title);
        // if (title == 'Report a Problem')
        //   return SupportInputTaker(
        //     subject: 'Problem',
        //     appbarTitle: 'Describe Your Problem',
        //   );
        // else if (title == 'Request a Feature')
        //   return SupportInputTaker(
        //     subject: 'Feature',
        //     appbarTitle: 'Describe the Feature',
        //   );
        // else if (title == 'Send Feedback')
        //   return SupportInputTaker(
        //     subject: 'Feedback',
        //     appbarTitle: 'Write Your Feedback',
        //   );
        return Center();
      },
      closedBuilder: (_, __) {
        return Container(
          height: 80.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: icon,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        extraText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
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
