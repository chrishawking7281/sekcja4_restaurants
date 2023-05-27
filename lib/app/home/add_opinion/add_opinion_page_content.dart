import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatelessWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('restaurant').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Wystąpił nieoczekiwany błąd'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Text('Ładowanie danych trwa dłużej niż powinno'));
          }
          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name']),
                          Text(document['dish']),
                        ],
                      ),
                      Text(
                        document['rating'].toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
