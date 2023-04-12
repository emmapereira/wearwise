import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _TrackerState extends State<Tracker> {
  late Future<List<ClothingItem>> _futureClothingItems;
  // late bool _isVisible;

  List<String> clothesList = [
    'Shoes',
    'Skirts',
    'Jackets',
    'Pants',
    'T-shirts',
    'Coats',
    'Sweatshirts'
  ];
  late String dropDownValue = '';

  @override
  void initState() {
    super.initState();
    setFilters();
    _futureClothingItems = getClothingItems();
  }

  setFilters() {
    setState(() {
      dropDownValue = clothesList[4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Tracker",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff865537)),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 10.0),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Container(
        //             decoration: BoxDecoration(
        //               color: Colors.grey[200],
        //               borderRadius: BorderRadius.circular(25.0),
        //             ),
        //             child: TextField(
        //               onChanged: (text) async {
        //                 // setState(() {
        //                 //   _futureClothingItems =
        //                 //       filterClothingItemsByName(text);
        //                 // });
        //               },
        //               decoration: const InputDecoration(
        //                 hintText: 'Select Type',
        //                 contentPadding: EdgeInsets.symmetric(
        //                   horizontal: 20.0,
        //                   vertical: 15.0,
        //                 ),
        //                 border: InputBorder.none,
        //                 suffixIcon: Icon(Icons.arrow_drop_down),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "Name",
                    fillColor: Colors.grey[200]),
                value: dropDownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
                items: clothesList
                    .map((clothesTitle) => DropdownMenuItem(
                        value: clothesTitle, child: Text(clothesTitle)))
                    .toList(),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Times you wore each of your $dropDownValue:',
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff865537)),
              ),
              const SizedBox(height: 20.0),
              Text(
                '$dropDownValue you haven\'t worn in this time period:',
                style:
                    const TextStyle(fontSize: 18.0, color: Color(0xff865537)),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    ));
  }
}
