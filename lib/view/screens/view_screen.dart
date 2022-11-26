import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/utils/styles.dart';
import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key, required this.doc});
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    final int colorId = doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
        title: Text(
          doc['title'],
          style: AppStyle.mainTitleStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: AppStyle.cardColor[colorId],
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyle.appHeight_5,
            Text(
              doc['date'],
              style: AppStyle.dateTitleStyle,
            ),
            AppStyle.appHeight_20,
            Text(
              doc['content'],
              style: AppStyle.contentStyle,
            ),
          ],
        ),
      ),
    );
  }
}
