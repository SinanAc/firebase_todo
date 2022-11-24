import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/utils/styles.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.onTap,
    required this.doc,
  }) : super(key: key);
  final VoidCallback onTap;
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppStyle.cardColor[doc['color_id']],
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc['title'],
              style: AppStyle.mainTitleStyle,
            ),
            Text(
              doc['date'],
              style: AppStyle.dateTitleStyle,
            ),
            AppStyle.appHeight_5,
            Text(
              doc['content'],
              style: AppStyle.contentStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
