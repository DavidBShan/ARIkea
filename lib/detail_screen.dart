import 'package:arikea/ar_view.dart';
import 'package:flutter/material.dart';

import 'items.dart';
class DetailScreen extends StatefulWidget{
  Items? clickedItemInfo;
  DetailScreen({this.clickedItemInfo});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            widget.clickedItemInfo!.itemName.toString()
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          //AR
          Navigator.push(context, MaterialPageRoute(builder: (c) => AugmentedRealityView(
            clickedItemImageLink: widget.clickedItemInfo!.itemImage.toString()
          )));
        },
        label: const Text(
          "AR Gang",

        ),
        icon: const Icon(
          Icons.camera_alt_rounded,
          color: Colors.black
        )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.clickedItemInfo!.itemImage.toString(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                widget.clickedItemInfo!.itemName.toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white70
                )
              )
            )
          ]
        )
      )
    );
  }
}