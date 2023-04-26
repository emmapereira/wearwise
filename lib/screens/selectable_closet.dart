import 'package:flutter/material.dart';
import 'package:wearwise/models/models.dart';
import '../bottom_nav_bar.dart';
import 'home.dart';
import '../models/app_state.dart';

class SelectableCloset extends StatefulWidget {
  final List<String> selectedItems;
  const SelectableCloset({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  _SelectableClosetState createState() => _SelectableClosetState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _SelectableClosetState extends State<SelectableCloset> {
  late Future<List<ClothingItem>> _futureClothingItems;
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _futureClothingItems = getClothingItems();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          //here the search bar and the filter icon are displayed
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextField(
                        onChanged: (text) async {
                          setState(() {
                            _futureClothingItems =
                                filterClothingItemsByName(text);
                          });
                        },
                        decoration: const InputDecoration(
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
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(Icons.tune),
                    color: const Color(0xff865537),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Expanded(
              child: AnimatedContainer(
                //width: _width,
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff865537))),
                // define how long the animation should take.
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // types options
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Type",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff865537),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("shoes");
                                    });
                                  },
                                ),
                                Text(
                                  "shoes",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("skirt");
                                    });
                                  },
                                ),
                                Text(
                                  "skirt",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("jacket");
                                    });
                                  },
                                ),
                                Text(
                                  "jacket",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("pants");
                                    });
                                  },
                                ),
                                Text(
                                  "pants",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("t-shirt");
                                    });
                                  },
                                ),
                                Text(
                                  "t-shirt",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType("coat");
                                    });
                                  },
                                ),
                                Text(
                                  "coat",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByType(
                                              "sweatshirt");
                                    });
                                  },
                                ),
                                Text(
                                  "sweatshirt",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // colours options
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Colour",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff865537),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour("white");
                                    });
                                  },
                                ),
                                Text(
                                  "white",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour("black");
                                    });
                                  },
                                ),
                                Text(
                                  "black",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour("grey");
                                    });
                                  },
                                ),
                                Text(
                                  "grey",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour("yellow");
                                    });
                                  },
                                ),
                                Text(
                                  "yellow",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour("beige");
                                    });
                                  },
                                ),
                                Text(
                                  "beige",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour(
                                              "light blue");
                                    });
                                  },
                                ),
                                Text(
                                  "light blue",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour(
                                              "dark blue");
                                    });
                                  },
                                ),
                                Text(
                                  "dark blue",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsByColour(
                                              "dark green");
                                    });
                                  },
                                ),
                                Text(
                                  "dark green",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // seasons options
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Season",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff865537),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                )),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsBySeason("spring");
                                    });
                                  },
                                ),
                                Text(
                                  "spring",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsBySeason("summer");
                                    });
                                  },
                                ),
                                Text(
                                  "summer",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsBySeason("fall");
                                    });
                                  },
                                ),
                                Text(
                                  "fall",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 25),
                                  color: const Color(0xff865537),
                                  onPressed: () {
                                    setState(() {
                                      _futureClothingItems =
                                          filterClothingItemsBySeason("winter");
                                    });
                                  },
                                ),
                                Text(
                                  "winter",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                //here we display the grid with the closet items
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
                              if (clothingItem.type == "jacket") {
                                tagColor = Colors.brown;
                              } else if (clothingItem.type == "pants") {
                                tagColor = Colors.green;
                              } else if (clothingItem.type == "t-shirt") {
                                tagColor = Colors.deepOrange;
                              } else if (clothingItem.type == "skirt") {
                                tagColor = Colors.purple;
                              } else if (clothingItem.type == "shoes") {
                                tagColor = Colors.red;
                              } else if (clothingItem.type == "coat") {
                                tagColor = Colors.blue;
                              } else if (clothingItem.type == "sweatshirt") {
                                tagColor = Colors.yellow;
                              }

                              return Stack(
                                children: [
                                  GridTile(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                clothingItem.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                decoration: BoxDecoration(
                                                  color: tagColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Checkbox(
                                      value: widget.selectedItems
                                          .contains(clothingItem.id),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value == true) {
                                            widget.selectedItems
                                                .add(clothingItem.id);
                                          } else {
                                            widget.selectedItems
                                                .remove(clothingItem.id);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
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
                Positioned(
                  bottom: 16.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // handle the "Cancel" button press
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        selectedItems: [], currentIndex: 0)));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            textStyle: const TextStyle(fontSize: 18.0),
                          ),
                          child: const Text("Cancel",
                              style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // handle the "Save" button press
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        selectedItems: widget.selectedItems,
                                        currentIndex: 0),
                                    settings: RouteSettings(
                                        arguments: widget.selectedItems)));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            textStyle: TextStyle(fontSize: 18.0),
                          ),
                          child: Text("Save", style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTabTapped: (index) {},
      ),
    );
  }
}
