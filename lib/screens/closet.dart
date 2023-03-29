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
    print(_futureClothingItems);
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
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Padding(
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

                      Color tagColor = Colors.grey;
                      if (clothingItem.type == "jacket")
                        tagColor = Colors.brown;
                      else if (clothingItem.type == "pants")
                        tagColor = Colors.green;
                      else if (clothingItem.type == "t-shirt")
                        tagColor = Colors.deepOrange;
                      else if (clothingItem.type == "skirt")
                        tagColor = Colors.purple;
                      else if (clothingItem.type == "shoes")
                        tagColor = Colors.red;
                      else if (clothingItem.type == "coat")
                        tagColor = Colors.blue;
                      else if (clothingItem.type == "sweatshirt")
                        tagColor = Colors.yellow;

                      return GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    clothingItem.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: tagColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(
                                      clothingItem.type,
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Image.asset(
                                        'lib/assets/images/image${clothingItem.id}.png',
                                        width: double
                                            .infinity, // set the width to the maximum available width
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
