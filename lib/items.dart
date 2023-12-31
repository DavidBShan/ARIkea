import 'package:cloud_firestore/cloud_firestore.dart';

class Items
{
  String? itemID;
  String? itemName;
  String? itemImage;
  Timestamp? publishedDate;

  Items({
    this.itemID,
    this.itemName,
    this.itemImage,
    this.publishedDate,
  });

  Items.fromJson(Map<String, dynamic> json)
  {
    itemID = json["itemID"];
    itemName = json["itemName"];
    itemImage = json["itemImage"];
    publishedDate = json["publishedDate"];
  }
}