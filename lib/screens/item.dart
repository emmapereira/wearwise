import 'package:flutter/material.dart';
import 'package:wearwise/screens/closet.dart';

import '../models/models.dart';

class Item extends StatelessWidget {
  final String itemId;
  const Item({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ClothingItem?>(
        future: findClothingItemById(itemId),
        builder: (BuildContext context, AsyncSnapshot<ClothingItem?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final ClothingItem itemInfo = snapshot.data!;

          Color tagColor = Colors.grey;
          if (itemInfo.type == "jacket") {
            tagColor = Colors.brown;
          } else if (itemInfo.type == "pants") {
            tagColor = Colors.green;
          } else if (itemInfo.type == "t-shirt") {
            tagColor = Colors.deepOrange;
          } else if (itemInfo.type == "skirt") {
            tagColor = Colors.purple;
          } else if (itemInfo.type == "shoes") {
            tagColor = Colors.red;
          } else if (itemInfo.type == "coat") {
            tagColor = Colors.blue;
          } else if (itemInfo.type == "sweatshirt") {
            tagColor = Colors.yellow;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: const Color(0xff865537),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Closet(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      itemInfo.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff865537)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    itemInfo.type,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Image.asset(
                        'lib/assets/images/image${itemInfo.id}.png',
                        height: 150,
                        width: double
                            .infinity, // set the width to the maximum available width
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
