import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ajout de Liens"),
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
  late String controllertypeLien;
  late TextEditingController controllerTitre;
  late TextEditingController controllerLien;
  late TextEditingController controllerDescription;
  var test = false;

  late String _myActivityResult;
  final formKey = GlobalKey<FormState>();
  List titrelien = [
    {
      "display": "Liens Web",
      "value": "Liens Web",
    },
    {
      "display": "Page Facebook",
      "value": "Page Facebook",
    },
    {
      "display": "Page Instagram",
      "value": "Page Instagram",
    },
    {
      "display": "Page tiktok",
      "value": "Page tiktok",
    },
    {
      "display": "Page Twitter",
      "value": "Page Twitter",
    },
  ];

  @override
  void initState() {
    super.initState();
    controllertypeLien = '';
    _myActivityResult = '';
    controllerDescription = TextEditingController();
    controllerLien = TextEditingController();
    controllerTitre = TextEditingController();
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        if (controllerTitre.text.isNotEmpty) {
          if (controllerLien.text.isNotEmpty) {
            if (controllerDescription.text.isNotEmpty) {
              if (controllertypeLien.isNotEmpty) {
                print(controllerTitre.text);
                print(controllerLien.text);
                print(controllerDescription.text);
                print(controllertypeLien);
                _myActivityResult = controllertypeLien;
                controllerTitre.text = '';
                controllerLien.text = '';
                controllerDescription.text = '';
                controllertypeLien = '';
              } else {
                test = true;
                debugPrint("Il y a un champ qui est vide");
              }
            } else {
              test = true;
              debugPrint("Il y a un champ qui est vide");
            }
          } else {
            test = true;
            debugPrint("Il y a un champ qui est vide");
          }
        } else {
          test = true;
          debugPrint("Il y a un champ qui est vide");
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
              Container(
                height: 150,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/2.png"))),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 0.0, bottom: 50, left: 15, right: 15),
                child: Text(
                  "Veuillez renseigner ces champs SVP !!!",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      Container(
                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          controller: controllerTitre,
                          keyboardType: TextInputType.text,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              // errorText: test ? "Veuillez repmlir ce champ" : null,
                              label: Text("Titre du lien"),
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
                              label: Text("Lien site"),
                              hintText: "Saississez ...",
                              contentPadding: EdgeInsets.only(left: 10)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty';
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
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text("Descriptions"),
                              hintText: "Saississez ...",
                              contentPadding: EdgeInsets.only(left: 10)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Text is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        // padding: EdgeInsets.only(left: 15, right: 15),
                        child: DropDownFormField(
                          titleText: 'Type de Liens',
                          value: controllertypeLien,
                          onSaved: (value) {
                            setState(() {
                              if (controllertypeLien.isNotEmpty) {
                                controllertypeLien = value;
                              } else {
                                print("controllertypeLien est vide");
                              }
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              controllertypeLien = value;
                            });
                          },
                          dataSource: titrelien,
                          textField: 'display',
                          valueField: 'value',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 200,
                padding: EdgeInsets.all(18),
                child: ElevatedButton(
                  child: Text(
                    'VALIDER',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onPressed: _saveForm,
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: Text(_myActivityResult),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
