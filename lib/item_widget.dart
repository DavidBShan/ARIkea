import 'package:arikea/items.dart';
import 'package:arikea/detail_screen.dart';
import 'package:flutter/material.dart';


class ItemWidget extends StatefulWidget
{
  Items? itemsInfo;
  BuildContext? context;

  ItemWidget({
    this.itemsInfo,
    this.context,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}




class _ItemWidgetState extends State<ItemWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: ()
      {
        //send user to the item detail screen
        Navigator.push(context, MaterialPageRoute(builder: (c)=> DetailScreen(
          clickedItemInfo: widget.itemsInfo,
        )));
      },
      splashColor: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              //image
              Image.network(
                widget.itemsInfo!.itemImage.toString(),
                width: 140,
                height: 140,
              ),

              const SizedBox(width: 4.0,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),

                    //item name
                    Expanded(
                      child: Text(
                        widget.itemsInfo!.itemName.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
