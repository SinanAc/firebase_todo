import 'package:firebase_todo/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Fire notes',
          style: AppStyle.mainTitleStyle,
        ),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent notes', style: AppStyle.appTitleStyle),
            AppStyle.appHeight_20,
            // StreamBuilder<QuerySnapshot>(
            //   builder: (context, snapshot) {},
            // )
          ],
        ),
      ),
    );
  }
}
