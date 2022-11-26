import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/utils/styles.dart';
import 'package:firebase_todo/view/widgets/pop_up.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _titleCotroller = TextEditingController();
  final _contentCotroller = TextEditingController();
  final String _date = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  @override
  Widget build(BuildContext context) {
    final int colorId = Random().nextInt(AppStyle.cardColor.length);
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
        title: const Text('Add new note'),
        titleTextStyle: AppStyle.mainTitleStyle,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleCotroller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
                style: AppStyle.mainTitleStyle,
                maxLength: 25,
              ),
              AppStyle.appHeight_10,
              TextField(
                controller: _contentCotroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Content',
                ),
                style: AppStyle.contentStyle,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20.0),
        child: FloatingActionButton.extended(
          onPressed: () async{
            if(_titleCotroller.text.isEmpty||_contentCotroller.text.isEmpty){
              SnackBarPopUp.popUp('Please fill both fields', context);
              return;
            }
            FirebaseFirestore.instance.collection('notes').add({
              'title':_titleCotroller.text.trim(),
              'date':'$_date ${DateTime.now().hour}:${DateTime.now().minute}',
              'content':_contentCotroller.text.trim(),
              'color_id':colorId,
            }).then((value){
              Navigator.pop(context);
            }).catchError(
              (_){            
                SnackBarPopUp.popUp('Something went wrong, Please try again later', context);
              }
            ).onError((_, __){
              SnackBarPopUp.popUp('Something went wrong, Please try again later', context);
            }).timeout(const Duration(milliseconds: 3000));
          },
          label: const Text('Submit'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
