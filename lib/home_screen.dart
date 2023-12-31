// home_screen.dart
import 'package:arikea/item_widget.dart';
import 'package:arikea/items.dart';
import 'package:arikea/items_upload_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "AR Test",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => ItemsUploadScreen()),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> dataSnapshot) {
          if (dataSnapshot.hasData) {
            return ListView.builder(
              itemCount: dataSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Items eachItemInfo = Items.fromJson(
                  dataSnapshot.data!.docs[index].data() as Map<String, dynamic>,
                );

                return ItemWidget(itemsInfo: eachItemInfo);
              },
            );
          } else {
            return Center(
              child: Text(
                "Data is not available.",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}