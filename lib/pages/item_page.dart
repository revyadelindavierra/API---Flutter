import 'package:bab_4/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final List<Item> items;
  final Object? itemArgs;

  ItemPage({Key? key, this.itemArgs, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Item item =
        items.firstWhere((item) => item.name == (itemArgs as Item).name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 220, 217),
        title: Text('Item Detail'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 59, 55, 44),
          fontSize: 24,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  item.imagE,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 221, 144, 120),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Description:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 5),
          Text(
            item.description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Price: Rp${item.price.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 253, 117, 96),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () {
                print('Terklik');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 85),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 195, 190),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    color: Color.fromARGB(255, 127, 65, 65),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
