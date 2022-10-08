// ignore_for_file: prefer_const_constructors

import 'package:coffeeshop/utility/coffee_tile.dart';
import 'package:coffeeshop/utility/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [Coffee type , isSelected]
    [
      'cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              // style: TextStyle(fontSize: 60),
              style: GoogleFonts.bebasNeue(
                fontSize: 50,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your Coffee',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),

          //horizontal listview of coffee tiles
          SizedBox(
            height: 25,
          ),

          Container(
            height: 20,
            child: ListView.builder(
              itemCount: coffeeType.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                COffeeTile(
                  coffeeImagePath: 'images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.00',
                ),
                COffeeTile(
                  coffeeImagePath: 'images/coffee.jpg',
                  coffeeName: 'Black Coffee',
                  coffeePrice: '1.99',
                ),
                COffeeTile(
                  coffeeImagePath: 'images/milk.jpg',
                  coffeeName: 'Milk',
                  coffeePrice: '2.99',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
