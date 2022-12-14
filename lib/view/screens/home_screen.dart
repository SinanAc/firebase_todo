import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/utils/styles.dart';
import 'package:firebase_todo/view/screens/add_screen.dart';
import 'package:firebase_todo/view/screens/view_screen.dart';
import 'package:firebase_todo/view/widgets/note_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.homeColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notes',
              style: AppStyle.appTitleStyle,
            ),
            AppStyle.appWidth_10,
            SizedBox(
              height: 50.0,
              child: Image.asset('assets/eggKoyi.png'),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppStyle.homeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('notes').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: snapshot.data!.docs
                    .map(
                      (note) => NoteCard(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ViewScreen(doc: note),
                              ),
                            );
                          },
                          doc: note),
                    )
                    .toList(),
              );
            } else {
              return Text(
                'No notes added',
                style: AppStyle.contentStyle,
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddScreen(),
            ),
          );
        },
        label: const Text('Add note'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
