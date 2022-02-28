import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_list/audiobook.dart';
import 'package:scroll_list/book.dart';
import 'package:scroll_list/product.dart';
import 'globals.dart' as globals;
import 'music.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  AddProductPageState createState() => AddProductPageState();
}

class AddProductPageState extends State<AddProductPage> {

  final tittleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final authorController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    globals.image = null;
    tittleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Clean up the controller when the widget is disposed.

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    File? test;
    _imgFromCamera() async {
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        globals.image = File(image!.path);
        test = File(image.path);
      });
    }

    _imgFromGallery() async {
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      setState(() {
        globals.image = File(image!.path);
        test = File(image.path);
      });
    }

    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          });
    }

    final List<String> _dropdownValues = [
      "Books",
      "Audiobooks",
      "Music",
    ];

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text('BoBa\'s shop',
              style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 40,
                  color: Color(0xff363636))),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: const Color(0xff92570B),
                  child: globals.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(54),
                          child: Image.file(
                            globals.image!,
                            width: 105,
                            height: 105,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(54)),
                          width: 105,
                          height: 105,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0xff363636),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tittle',
              ),
              controller: tittleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Author',
              ),
              controller: authorController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
              controller: priceController,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
              items: _dropdownValues
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {
                _selectedCategory = value as String;
              },
              isExpanded: true,
              value: _selectedCategory,
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 6,
              scrollController: ScrollController(),
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              controller: descriptionController,
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                if (tittleController.text != "" &&
                    authorController.text != "" &&
                    descriptionController.text != "" &&
                    priceController.text != "" &&
                    globals.image != null) {
                  switch (_selectedCategory) {
                    case "Books":
                      globals.books.add(Book(
                          tittleController.text,
                          authorController.text,
                          globals.image!.path,
                          descriptionController.text,
                          priceController.text));
                      break;
                    case "Music":
                      globals.musics.add(Music(
                          tittleController.text,
                          authorController.text,
                          globals.image!.path,
                          descriptionController.text,
                          priceController.text));
                      break;
                    case "Audiobooks":
                      globals.audiobooks.add(AudioBook(
                          tittleController.text,
                          authorController.text,
                          globals.image!.path,
                          descriptionController.text,
                          priceController.text));
                      break;
                    default:
                      break;
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Item added!"),
                      );
                    },
                  );
                  setState(() {
                    globals.image = null;
                    tittleController.clear();
                    descriptionController.clear();
                    priceController.clear();
                    authorController.clear();
                    _selectedCategory = null;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Please fill all fields"),
                      );
                    },
                  );
                }
              },
              backgroundColor: const Color(0xff92570B),
              tooltip: 'Add Product',
              child: const Icon(Icons.save),
            ),
          ]),
        ));
  }
}
