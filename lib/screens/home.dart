import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';
import 'selectable_closet.dart';

class Home extends StatelessWidget {
  final List<String> selectedItems;

  const Home({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Today's outfit",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff865537)),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              'Today you have worn all of these items:',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 20.0),
          if (selectedItems != null && selectedItems is List)
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final itemId = selectedItems[index].toString();
                  return FutureBuilder<ClothingItem?>(
                    future: findClothingItemById(itemId),
                    builder: (BuildContext context,
                        AsyncSnapshot<ClothingItem?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      final itemInfo = snapshot.data!;
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              itemInfo != null
                                  ? Image.asset(
                                      'lib/assets/images/image${itemId}.png',
                                      width: 50,
                                      height: 50)
                                  : SizedBox(width: 50, height: 50),
                              const SizedBox(width: 8.0),
                              Text(itemInfo.name),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          const SizedBox(height: 16.0),
          // the plus sign here
          Center(
            child: GestureDetector(
              onTap: () {
                // navigate to selectable closet screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SelectableCloset(selectedItems: selectedItems)));
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 32.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
