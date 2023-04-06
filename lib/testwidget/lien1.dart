import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';

const listlien = <Relationship, String>{
  Relationship.Liens_Web: "Liens Web",
  Relationship.Page_Facebook: "Page Facebook",
  Relationship.Page_Instagram: "Page Instagram",
  Relationship.Page_Tiktok: "Page Tiktok",
  Relationship.Page_Twitter: "Page Twitter",
};

class Lienstest extends StatefulWidget {
  const Lienstest({super.key});

  @override
  State<Lienstest> createState() => _LienstestState();
}

class _LienstestState extends State<Lienstest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts App with Hive'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Contact>(catalogueBoxName).listenable(),
        builder: (context, Box<Contact> box, _) {
          if (box.values.isEmpty)
            return Center(
              child: Text("No contacts"),
            );
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              Contact c = box.getAt(index)!;
              String relationship = listlien[c.typeLiens]!;
              return InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => AlertDialog(
                      content: Text(
                        "Do you want to delete ${c.title}?",
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          child: Text("Yes"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await box.deleteAt(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Divider(),
                        Text(c.title),
                        Divider(),
                        Text(c.description),
                        Divider(),
                        Text("Age: ${c.subtitle}"),
                        Divider(),
                        Text("Relationship: $relationship"),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddContact()),
              );
            },
          );
        },
      ),
    );
  }
}

class AddContact extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late String title;
  late String subtitle;
  late String description;
  Relationship? typelien;

  // void onFormSubmit() {
  //   if (widget.formKey.currentState!.validate()) {
  //     Box<Contact> contactsBox = Hive.box<Contact>(catalogueBoxName);
  //     contactsBox.add(Contact(title, subtitle, description, typelien!));
  //     Navigator.of(context).pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: widget.formKey,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              TextFormField(
                autofocus: true,
                initialValue: "",
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: "",
                maxLength: 3,
                // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: const InputDecoration(
                  labelText: "Age",
                ),
                onChanged: (value) {
                  setState(() {
                    subtitle = value;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                initialValue: "",
                decoration: const InputDecoration(
                  labelText: "description",
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              DropdownButtonFormField(
                items: typeLiens.keys.map((Relationship value) {
                  return DropdownMenuItem<Relationship>(
                    value: value,
                    child: Text(typeLiens[value]!),
                  );
                }).toList(),
                value: typelien,
                hint: Text("typeliens"),
                onChanged: (value) {
                  setState(() {
                    typelien = value!;
                  });
                },
              ),
              OutlinedButton(child: Text("valider"), onPressed: null
                  // onFormSubmit,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
