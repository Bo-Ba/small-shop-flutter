import 'dart:core';
import 'package:scroll_list/product.dart';

class Book extends Product{
  late String tittle, author, img, description, price;

  Book(this.tittle, this.author, this.img, this.description, this.price);

  Book.name(this.tittle, this.author, this.img, this.description, this.price);
}