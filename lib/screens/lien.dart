import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';
import '../widget/dropdown.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';

class Liens extends StatefulWidget {
  const Liens({super.key});

  @override
  State<Liens> createState() => _LiensState();
}

class _LiensState extends State<Liens> {
  List typelien = [
    "Liens Web",
    "Page Facebook",
    "Page Instagram",
    "Page tiktok",
    "Page Twitter"
  ];

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[300],
          title: const Text(
            "Ajout de Liens",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.grey[300],
          child: ListView(
            children: [const Textfield()],
          ),
        ));
  }
}

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  late TextEditingController controllerTitre;
  late TextEditingController controllerLien;
  late TextEditingController controllerDescription;
  StatutLien? controllerstatut;
  Relationship? typelien;
  var test = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    controllerDescription = TextEditingController();
    controllerLien = TextEditingController();
    controllerTitre = TextEditingController();
  }

  void onFormSubmit() {
    if (formKey.currentState!.validate()) {
      Box<Contact> contactsBox = Hive.box<Contact>(catalogueBoxName);
      contactsBox.add(Contact(controllerTitre.text, controllerLien.text,
          controllerDescription.text, typelien!, controllerstatut!));
      Navigator.of(context).pop();
    }
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        if (controllerTitre.text.isNotEmpty) {
          if (controllerLien.text.isNotEmpty) {
            if (controllerDescription.text.isNotEmpty) {
              print(controllerTitre.text);
              print(controllerLien.text);
              print(controllerDescription.text);
              print(typelien);

              controllerTitre.text = '';
              controllerLien.text = '';
              controllerDescription.text = '';
            } else {
              test = true;
              debugPrint("Il y a un champ description qui est vide");
            }
          } else {
            test = true;
            debugPrint("Il y a un champ lien qui est vide");
          }
        } else {
          test = true;
          debugPrint("Il y a un champ titre qui est vide");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Form(
        key: formKey,
        child: Container(
          // height: size.height,
          width: size.width,
          // color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50.0),
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/Group1.png"))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, right: 0),

                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          controller: controllerTitre,
                          keyboardType: TextInputType.text,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              // errorText: test ? "Veuillez repmlir ce champ" : null,
                              label: Text("Titre"),
                              border: InputBorder.none,
                              hintText: "Saississez ...",
                              contentPadding: EdgeInsets.only(left: 10)),
                        ),
                      ),
                      const Divider(),
                      Container(
                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          controller: controllerLien,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text("Lien du site"),
                              hintText: "Saississez ...",
                              contentPadding: EdgeInsets.only(left: 10)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          controller: controllerDescription,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text("Descriptions"),
                              hintText: "Saississez ...",
                              contentPadding: EdgeInsets.only(left: 10)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                          items: typeLiens.keys.map((Relationship value) {
                            return DropdownMenuItem<Relationship>(
                              value: value,
                              child: Text(typeLiens[value]!),
                            );
                          }).toList(),
                          value: typelien,
                          hint: const Text(
                            "Type du Lien",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (value) {
                            setState(() {
                              typelien = value!;
                            });
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                          items: statutLiens.keys.map((StatutLien value) {
                            return DropdownMenuItem<StatutLien>(
                              value: value,
                              child: Text(statutLiens[value]!),
                            );
                          }).toList(),
                          value: controllerstatut,
                          hint: const Text(
                            "Statut du Lien",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (value) {
                            setState(() {
                              controllerstatut = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: size.width,
                padding: const EdgeInsets.all(18),
                child: ElevatedButton(
                  onPressed: onFormSubmit,
                  child: const Text(
                    'VALIDER',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
