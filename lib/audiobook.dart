import 'dart:core';
import 'package:scroll_list/product.dart';

class AudioBook extends Product{
  late String tittle, author, img, description, price;

  AudioBook(this.tittle, this.author, this.img, this.description, this.price);

  AudioBook.name(this.tittle, this.author, this.img, this.description, this.price);
}