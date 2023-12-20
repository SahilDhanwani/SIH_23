import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Sahil extends StatefulWidget {
  const Sahil({super.key});

  @override
  State<Sahil> createState() => _SahilState();
}

class _SahilState extends State<Sahil> {
  final ref = FirebaseDatabase.instance.ref('admin');
  final searchFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                final title = snapshot.child('class_code').value.toString();
                if (searchFilter.text.isEmpty ||
                    title
                        .toLowerCase()
                        .contains(searchFilter.text.toLowerCase())) {
                  return ListTile(
                    title: Text(snapshot.child('class_code').value.toString()),
                    subtitle: Text(snapshot.child('School').value.toString()),
                    trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                            child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit'),
                        )),
                        const PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ))
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}