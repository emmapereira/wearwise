import 'package:flutter/material.dart';
import 'selectable_closet.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final Object? selectedItems = ModalRoute.of(context)?.settings.arguments;

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
              'You are wearing the following items:',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 20.0),
          if (selectedItems != null && selectedItems is List)
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = selectedItems[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.toString()),
                    ),
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
                        builder: (context) => SelectableCloset()));
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
