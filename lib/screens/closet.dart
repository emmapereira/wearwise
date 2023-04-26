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
  late bool _isVisible;
  late bool _showShoes;
  late bool _showSkirts;
  late bool _showJackets;
  late bool _showPants;
  late bool _showTShirts;
  late bool _showCoats;
  late bool _showSweatshirts;

  @override
  void initState() {
    super.initState();
    _futureClothingItems = getClothingItems();
    _isVisible = false;
    _showShoes = false;
    _showJackets = false;
    _showPants = false;
    _showCoats = false;
    _showTShirts = false;
    _showSweatshirts = false;
    _showSkirts = false;
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
                          _showShoes = false;
                          _showJackets = false;
                          _showPants = false;
                          _showCoats = false;
                          _showTShirts = false;
                          _showSweatshirts = false;
                          _showSkirts = false;
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
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const Text("Type",
                      //         style: TextStyle(
                      //           decoration: TextDecoration.underline,
                      //           color: Color(0xff865537),
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20.0,
                      //         )),
                      //     const SizedBox(height: 13),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("shoes");
                      //               _showShoes = true;
                      //               _showJackets = false;
                      //               _showPants = false;
                      //               _showCoats = false;
                      //               _showTShirts = false;
                      //               _showSweatshirts = false;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "shoes",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("skirt");
                      //               _showShoes = false;
                      //               _showJackets = false;
                      //               _showPants = false;
                      //               _showCoats = false;
                      //               _showTShirts = false;
                      //               _showSweatshirts = false;
                      //               _showSkirts = true;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "skirt",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("jacket");
                      //               _showShoes = false;
                      //               _showJackets = true;
                      //               _showPants = false;
                      //               _showCoats = false;
                      //               _showTShirts = false;
                      //               _showSweatshirts = false;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "jacket",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("pants");
                      //               _showShoes = false;
                      //               _showJackets = false;
                      //               _showPants = true;
                      //               _showCoats = false;
                      //               _showTShirts = false;
                      //               _showSweatshirts = false;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "pants",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("t-shirt");
                      //               _showShoes = false;
                      //               _showJackets = false;
                      //               _showPants = false;
                      //               _showCoats = false;
                      //               _showTShirts = true;
                      //               _showSweatshirts = false;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "t-shirt",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("coat");
                      //               _showShoes = false;
                      //               _showJackets = false;
                      //               _showPants = false;
                      //               _showCoats = true;
                      //               _showTShirts = false;
                      //               _showSweatshirts = false;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "coat",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           icon: const Icon(Icons.arrow_right, size: 25),
                      //           color: const Color(0xff865537),
                      //           onPressed: () {
                      //             setState(() {
                      //               _futureClothingItems =
                      //                   filterClothingItemsByType("sweatshirt");
                      //               _showShoes = false;
                      //               _showJackets = false;
                      //               _showPants = false;
                      //               _showCoats = false;
                      //               _showTShirts = false;
                      //               _showSweatshirts = true;
                      //               _showSkirts = false;
                      //             });
                      //           },
                      //         ),
                      //         Text(
                      //           "sweatshirt",
                      //           style: Theme.of(context).textTheme.bodyLarge,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 5),
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                      const SizedBox(height: 15),
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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
                                    _showShoes = false;
                                    _showJackets = false;
                                    _showPants = false;
                                    _showCoats = false;
                                    _showTShirts = false;
                                    _showSweatshirts = false;
                                    _showSkirts = false;
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

        const SizedBox(height: 10.0),
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // handle the "Shoes" button press
                    setState(() {
                      _showShoes = true;
                      _showJackets = false;
                      _showPants = false;
                      _showCoats = false;
                      _showTShirts = false;
                      _showSweatshirts = false;
                      _showSkirts = false;
                      _futureClothingItems = filterClothingItemsByType("shoes");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showShoes ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showShoes ? const Color(0xff865537) : Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 132.0),
                  ),
                  child: const Text("shoes", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "Skirts" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = false;
                      _showPants = false;
                      _showCoats = false;
                      _showTShirts = false;
                      _showSweatshirts = false;
                      _showSkirts = true;
                      _futureClothingItems = filterClothingItemsByType("skirt");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showSkirts ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showSkirts ? const Color(0xff865537) : Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child: const Text("skirts", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "Jackets" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = true;
                      _showPants = false;
                      _showCoats = false;
                      _showTShirts = false;
                      _showSweatshirts = false;
                      _showSkirts = false;
                      _futureClothingItems =
                          filterClothingItemsByType("jacket");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showJackets ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showJackets ? const Color(0xff865537) : Colors.white,
                    //padding: const EdgeInsets.symmetric(
                    // horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child:
                      const Text("jackets", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "Pants" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = false;
                      _showPants = true;
                      _showCoats = false;
                      _showTShirts = false;
                      _showSweatshirts = false;
                      _showSkirts = false;
                      _futureClothingItems = filterClothingItemsByType("pants");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showPants ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showPants ? const Color(0xff865537) : Colors.white,
                    //padding: const EdgeInsets.symmetric(
                    // horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child: const Text("pants", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "T-Shirts" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = false;
                      _showPants = false;
                      _showCoats = false;
                      _showTShirts = true;
                      _showSweatshirts = false;
                      _showSkirts = false;
                      _futureClothingItems =
                          filterClothingItemsByType("t-shirt");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showTShirts ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showTShirts ? const Color(0xff865537) : Colors.white,
                    //padding: const EdgeInsets.symmetric(
                    // horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child:
                      const Text("t-shirts", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "Coats" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = false;
                      _showPants = false;
                      _showCoats = true;
                      _showTShirts = false;
                      _showSweatshirts = false;
                      _showSkirts = false;
                      _futureClothingItems = filterClothingItemsByType("coat");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        _showCoats ? Colors.white : const Color(0xff865537),
                    backgroundColor:
                        _showCoats ? const Color(0xff865537) : Colors.white,
                    //padding: const EdgeInsets.symmetric(
                    // horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child: const Text("coats", style: TextStyle(fontSize: 13.0)),
                ),
              ),
              const SizedBox(width: 2.0),
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
                    // handle the "SweatShirts" button press
                    setState(() {
                      _showShoes = false;
                      _showJackets = false;
                      _showPants = false;
                      _showCoats = false;
                      _showTShirts = false;
                      _showSweatshirts = true;
                      _showSkirts = false;
                      _futureClothingItems =
                          filterClothingItemsByType("sweatshirt");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: _showSweatshirts
                        ? Colors.white
                        : const Color(0xff865537),
                    backgroundColor: _showSweatshirts
                        ? const Color(0xff865537)
                        : Colors.white,
                    //padding: const EdgeInsets.symmetric(
                    // horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(fontSize: 13.0),
                  ),
                  child: const Text("sweatshirts",
                      style: TextStyle(fontSize: 13.0)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),

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
