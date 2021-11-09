import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LogsCollection extends StatefulWidget {
  @override
  _LogsCollectionState createState() => _LogsCollectionState();
}

class _LogsCollectionState extends State<LogsCollection> {
  final bool _isLoading = false;

  final List<String> _callingHistory = ['Tahmid', 'Rahim', 'Karim'];

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
          child: Container(
            margin: const EdgeInsets.all(12.0),
            width: double.maxFinite,
            height: double.maxFinite,
            child: ListView.builder(
                itemCount: _callingHistory.length,
                itemBuilder: (upperContext, index) {
                  return _everyConnectionHistory(index);
                }),
          ),
        ),
      ),
    );
  }

  Widget _everyConnectionHistory(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            backgroundImage: ExactAssetImage('assets/images/google.png'),
          ),
          Text(
            _callingHistory[index],
            style: const TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 25.0,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
