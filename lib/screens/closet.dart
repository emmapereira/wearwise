import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';

class Closet extends StatefulWidget {
  @override
  _ClosetState createState() => _ClosetState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _ClosetState extends State<Closet> {
  late Future<List<ClothingItem>> _futureClothingItems;

  @override
  void initState() {
    super.initState();
    _futureClothingItems = getClothingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "My closet",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff865537)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              IconButton(
                icon: Icon(Icons.tune),
                color: Color(0xff865537),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<ClothingItem>>(
            future: _futureClothingItems,
            builder: (BuildContext context,
                AsyncSnapshot<List<ClothingItem>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final clothingItem = snapshot.data![index];
                      return GridTile(
                        child: Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Text(clothingItem.name),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No clothing items found."),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
