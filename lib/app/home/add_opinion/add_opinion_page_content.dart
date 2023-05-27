import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var dishName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Nazwa Restauracji'),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Nazwa Dania'),
            onChanged: (newValue) {
              setState(() {
                dishName = newValue;
              });
            },
          ),
          Slider(
              min: 0.0,
              max: 10.0,
              divisions: 20,
              label: rating.toString(),
              value: rating,
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              }),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'dish': dishName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
