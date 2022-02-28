import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:scroll_list/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_list/audiobook.dart';
import 'package:scroll_list/book.dart';
import 'music.dart';

class EditProductPage extends StatefulWidget {
  Product? product;
  EditProductPage({Key? key}) : super(key: key);

  EditProductPage.edit(this.product, int index, {Key? key}) : super(key: key) {
    globals.index = index;
    globals.productEdit = product;
  }

  @override
  EditProductPageState createState() => EditProductPageState();
}

class EditProductPageState extends State<EditProductPage> {

  final tittleController = TextEditingController(text: globals.productEdit!.tittle);
  final descriptionController = TextEditingController(text: globals.productEdit!.description);
  final priceController = TextEditingController(text: globals.productEdit!.price);
  final authorController = TextEditingController(text: globals.productEdit!.author);
  String? _selectedCategory;
  String? oldCategory;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    globals.imageEdit = null;
    tittleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if(globals.productEdit is Book) {
      _selectedCategory = "Books";
    } else if (globals.productEdit is Music) {
      _selectedCategory = "Music";
    } else if (globals.productEdit is AudioBook) {
      _selectedCategory = "Audiobooks";
    }

    if(widget.product!.img.contains("assets"))  {
      globals.imageEdit = Image.asset(widget.product!.img, width: 105, height: 105, fit: BoxFit.fitHeight,);
    } else {
      globals.imageEdit = Image.file(File(widget.product!.img), width: 105, height: 105, fit: BoxFit.fitHeight,);
    }
    globals.image = File(widget.product!.img);
    oldCategory = _selectedCategory;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _imgFromCamera() async {
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        globals.imageEdit = Image.file(File(image!.path), width: 105, height: 105, fit: BoxFit.fitHeight,);
        globals.image = File(image.path);
      });
    }

    _imgFromGallery() async {
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      setState(() {
        globals.imageEdit = Image.file(File(image!.path), width: 105, height: 105, fit: BoxFit.fitHeight);
        globals.image = File(image.path);
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
                  child: globals.imageEdit != null
                      ? ClipRRect(
                      borderRadius: BorderRadius.circular(54),
                      child: globals.imageEdit!

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
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text("Item edited!"),
                    );
                  },
                );
                globals.productEdit?.tittle = tittleController.text;

                if(_selectedCategory == oldCategory) {
                  switch (_selectedCategory) {
                    case "Books":
                      globals.books[globals.index!] = (Book(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    case "Music":
                      globals.musics[globals.index!] = (Music(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    case "Audiobooks":
                      globals.audiobooks[globals.index!] = (AudioBook(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    default:
                      break;
                  }
                } else {
                  switch (_selectedCategory) {
                    case "Books":
                      globals.books[globals.index!] = (Book(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    case "Music":
                      globals.musics[globals.index!] = (Music(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    case "Audiobooks":
                      globals.audiobooks[globals.index!] = (AudioBook(tittleController.text, authorController.text, globals.image!.path, descriptionController.text, priceController.text));
                      break;
                    default:
                      break;
                  }

                  switch (oldCategory) {
                    case "Books":
                      globals.books.removeAt(globals.index!);
                      break;
                    case "Music":
                      globals.musics.removeAt(globals.index!);
                      break;
                    case "Audiobooks":
                      globals.audiobooks.removeAt(globals.index!);
                      break;
                    default:
                      break;
                  }
                }
                setState(() {

                });
              },

              backgroundColor: const Color(0xff92570B),
              tooltip: 'Save',
              child: const Icon(Icons.save),
            ),
          ]),
        ));
  }
}