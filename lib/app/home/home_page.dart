import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_opinion/add_opinion_page_content.dart';
import 'my_account/my_account_page_content.dart';
import 'restaurants/restaurants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('Restauracje i potrawy'),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('Dodaj swoją opinię'),
          );
        }
        return const Center(
          child: Text('Moje konto'),
        );
      })),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RestaurantPageContent();
        }
        if (currentIndex == 1) {
          return AddOpinionPageContent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'Krytyka',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Utwórz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Moje konto',
            ),
          ]),
    );
  }
}
