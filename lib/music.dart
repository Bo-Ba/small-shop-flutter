import 'dart:core';
import 'package:scroll_list/product.dart';

class Music extends Product{
  late String tittle, author, img, description, price;

  Music(this.tittle, this.author, this.img, this.description, this.price);

  Music.name(this.tittle, this.author, this.img, this.description, this.price);
}