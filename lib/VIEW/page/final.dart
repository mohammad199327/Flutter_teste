import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/page/Pagination.dart';
import 'package:flutter_application_test/VIEW/page/home.dart';
import 'package:flutter_application_test/constant/colore.dart';

class Final extends StatefulWidget {
  const Final({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  List<Widget> page = [HomePage(), const Pagination_view()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color1,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        selectedFontSize: 20,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'pagenation'),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: page[selectedIndex],
      ),
    );
  }
}
