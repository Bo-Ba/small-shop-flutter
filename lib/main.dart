import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addProduct.dart';
import 'editProduct.dart';
import 'globals.dart' as globals;
import 'package:scroll_list/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Default(),
    );
  }
}

class Default extends StatelessWidget {
  const Default({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: const Color(0xff363636),
        backgroundColor: const Color(0xff92570B),
        inactiveColor: const Color(0xffffffff),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'Visualisation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomePage(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: CategoriesPage(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: VisualisationPage(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AddProductPage(),
              );
            });
        }
      },
    );
  }
}
final List<String> imgList = [
  "assets/images/books.jpg",
  "assets/images/books1.jpg",
  "assets/images/books2.jpg",
];

final List<String> titles = [
  ' Sales ',
  ' New Books ',
  ' Upcoming ',
];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList.map((item) {
    return Builder(
      builder: (BuildContext context) {
        return Stack(children: [
          SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width - 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductsPage()));
                      }
                      )
              )
          ),
          Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Text(
                titles[imgList.indexOf(item)],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Honoka Maru-Gothic'),
              ))
        ]);
      },
    );
  }).toList();
  final List<Widget> recomendations = [
    const Text(
      'Visualisation',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ), const Text(
      'Manga',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ),
    const Text(
      'Crayons',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ),
    const Text(
      'Books',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ),
    const Text(
      'Bestsellers',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ),
    const Text(
      'Adventure',
      style: TextStyle(
          color: Color(0xff363636),
          fontSize: 20.0,
          fontFamily: 'Honoka Maru-Gothic'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text('BoBa\'s shop',
              style: TextStyle(
                  fontFamily: 'GreatVibes',
                  color: Color(0xff363636),
                  fontSize: 40,)
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 10),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our Recomendations',
              style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25.0,
                  fontFamily: 'MicrosoftJhengHei'),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color(0xff92570B),
            ),
            SizedBox(
                height: 25,
                width: MediaQuery.of(context).size.width - 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recomendations.length,
                  itemBuilder: (context, index) {
                    return recomendations[index];
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                )),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color(0xff92570B),
            ),
            const Align(
              alignment: Alignment(-0.8, 0),
              child: Text('Adiobooks',
                  style: TextStyle(
                      fontFamily: 'MicrosoftJhengHei',
                      fontSize: 25,
                      color: Color(0xff363636))),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                children: [Row(
                    children: List.generate(globals.audiobooks.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductPage(globals.audiobooks[index])));
                          },
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Card(
                                  elevation: 10,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                if(globals.audiobooks[index].img.contains("assets")) ... {
                                                  Image.asset(globals.audiobooks[index].img),
                                                } else ... {
                                                  Image.file(File(globals.audiobooks[index].img))
                                                },
                                                Text(globals.audiobooks[index].tittle,
                                                    style: const TextStyle(
                                                        fontFamily: 'MicrosoftJhengHei',
                                                        fontSize: 15,
                                                        color: Color(0xff363636),
                                                        fontWeight: FontWeight.bold),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3),
                                                const SizedBox(height: 5),
                                                Text(globals.audiobooks[index].author,
                                                    style: const TextStyle(
                                                        fontFamily: 'MicrosoftJhengHei',
                                                        fontSize: 15,
                                                        color: Color(0xff363636))),
                                                const SizedBox(height: 5),
                                                Align(
                                                  alignment: const Alignment(1, 1),
                                                  child: Text('\$' + globals.audiobooks[index].price,
                                                      style: const TextStyle(
                                                          fontFamily: 'MicrosoftJhengHei',
                                                          fontSize: 15,
                                                          color: Color(0xff363636))),
                                                )
                                              ]
                                          )
                                      )
                                  )
                              )
                          )
                      )
                  );
                }
                )
                ),
                const SizedBox(height: 6)]
            ),
            ),
            const Align(
              alignment: Alignment(-0.8, 0),
              child: Text('Books',
                  style: TextStyle(
                      fontFamily: 'MicrosoftJhengHei',
                      fontSize: 25,
                      color: Color(0xff363636))),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                  children: [Row(
                      children: List.generate(globals.books.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductPage(globals.books[index])));
                                },
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Card(
                                        elevation: 10,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Padding(
                                                padding: const EdgeInsets.all(12),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      if(globals.books[index].img.contains("assets")) ... {
                                                        Image.asset(globals.books[index].img),
                                                      } else ... {
                                                        Image.file(File(globals.books[index].img))
                                                      },
                                                      Text(globals.books[index].tittle,
                                                          style: const TextStyle(
                                                              fontFamily: 'MicrosoftJhengHei',
                                                              fontSize: 15,
                                                              color: Color(0xff363636),
                                                              fontWeight: FontWeight.bold),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 3),
                                                      const SizedBox(height: 5),
                                                      Text(globals.books[index].author,
                                                          style: const TextStyle(
                                                              fontFamily: 'MicrosoftJhengHei',
                                                              fontSize: 15,
                                                              color: Color(0xff363636))),
                                                      const SizedBox(height: 5),
                                                      Align(
                                                        alignment: const Alignment(1, 1),
                                                        child: Text('\$' + globals.books[index].price,
                                                            style: const TextStyle(
                                                                fontFamily: 'MicrosoftJhengHei',
                                                                fontSize: 15,
                                                                color: Color(0xff363636))),
                                                      )
                                                    ]
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        );
                      }
                      )
                  ),
                    const SizedBox(height: 6)]
              ),
            ),
            const Align(
              alignment: Alignment(-0.8, 0),
              child: Text('Music',
                  style: TextStyle(
                      fontFamily: 'MicrosoftJhengHei',
                      fontSize: 25,
                      color: Color(0xff363636))),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                  children: [Row(
                      children: List.generate(globals.musics.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductPage(globals.musics[index])));
                                },
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Card(
                                        elevation: 10,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Padding(
                                                padding: const EdgeInsets.all(12),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      if(globals.musics[index].img.contains("assets")) ... {
                                                        Image.asset(globals.musics[index].img),
                                                      } else ... {
                                                        Image.file(File(globals.musics[index].img))
                                                      },
                                                      Text(globals.musics[index].tittle,
                                                          style: const TextStyle(
                                                              fontFamily: 'MicrosoftJhengHei',
                                                              fontSize: 15,
                                                              color: Color(0xff363636),
                                                              fontWeight: FontWeight.bold),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 3),
                                                      const SizedBox(height: 5),
                                                      Text(globals.musics[index].author,
                                                          style: const TextStyle(
                                                              fontFamily: 'MicrosoftJhengHei',
                                                              fontSize: 15,
                                                              color: Color(0xff363636))),
                                                      const SizedBox(height: 5),
                                                      Align(
                                                        alignment: const Alignment(1, 1),
                                                        child: Text('\$' + globals.musics[index].price,
                                                            style: const TextStyle(
                                                                fontFamily: 'MicrosoftJhengHei',
                                                                fontSize: 15,
                                                                color: Color(0xff363636))),
                                                      )
                                                    ]
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        );
                      }
                      )
                  ),
                    const SizedBox(height: 6)]
              ),
            ),
          ]),
        ),
    );
  }
}

class ProductsPage extends StatefulWidget {
  ProductsPage({Key? key}) : super(key: key);

  List toUse = [];
  List widgetsKeys = [];

  ProductsPage.name(String toUse, {Key? key}) : super(key: key){
    switch (toUse) {
      case "books":
        this.toUse = globals.books;
        break;
      case "music":
        this.toUse = globals.musics;
        break;
      case "audiobooks":
        this.toUse = globals.audiobooks;
        break;
      default:
        this.toUse = globals.books;
        break;
    }
    widgetsKeys = this.toUse.map((e) => GlobalKey()).toList();
  }

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  RelativeRect _getRelativeRect(GlobalKey key){
    return RelativeRect.fromLTRB(
        _getWidgetGlobalRect(key).left,
        _getWidgetGlobalRect(key).bottom,
        _getWidgetGlobalRect(key).right,
        _getWidgetGlobalRect(key).bottom,
    );
  }

  Rect _getWidgetGlobalRect(GlobalKey key) {
    final RenderBox renderBox =
    key.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset(0, renderBox.size.height));
    debugPrint('Widget position: ${offset.dx} ${offset.dy}');
    return Rect.fromPoints(offset, offset);
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            top: true,
            child: Center(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Column(children: [
                          Wrap(
                              children: List.generate(widget.toUse.length, (index) {
                                return Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(25, 5, 25, 10),
                                    child: GestureDetector(
                                        onLongPress: () {
                                          showMenu(
                                            items: <PopupMenuEntry>[
                                              PopupMenuItem(
                                                //value: this._index,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: const Text("Edit"),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    EditProductPage.edit(widget.toUse[index], index)
                                                            ));
                                                      },
                                                    )
                                                ]),
                                              ),
                                              PopupMenuItem(
                                                //value: this._index,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: const Text("Delete"),
                                                      onTap: () {
                                                        setState(() {
                                                          widget.toUse.removeAt(index);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                ]),
                                              )
                                            ],
                                            context: context,
                                            position: _getRelativeRect(widget.widgetsKeys[index]),
                                          );
                                        },
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductPage(widget.toUse[index])
                                              ));
                                        },

                                        child: SizedBox(
                                            key: widget.widgetsKeys[index],
                                            width: MediaQuery.of(context).size.width / 3,
                                            child: SizedBox(
                                              height: 300,
                                              child: Card(
                                                  elevation: 10,
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      child: Padding(
                                                          padding: const EdgeInsets.all(12),
                                                          child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                if(widget.toUse[index].img.contains("assets")) ... {
                                                                  Image.asset(widget.toUse[index].img),
                                                                } else ... {
                                                                  Image.file(File(widget.toUse[index].img))
                                                                },
                                                                Text(widget.toUse[index].tittle,
                                                                    style:
                                                                    const TextStyle(
                                                                        fontFamily: 'MicrosoftJhengHei',
                                                                        fontSize: 15,
                                                                        color: Color(0xff363636),
                                                                        fontWeight: FontWeight.bold
                                                                    ),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    maxLines: 3
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Text(widget.toUse[index].author,
                                                                    style:
                                                                    const TextStyle(
                                                                        fontFamily: 'MicrosoftJhengHei',
                                                                        fontSize: 15,
                                                                        color: Color(0xff363636)
                                                                    )
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Align(
                                                                  alignment:
                                                                  const Alignment(1, 1),
                                                                  child: Text('\$ ' + widget.toUse[index].price,
                                                                      style:
                                                                      const TextStyle(
                                                                          fontFamily: 'MicrosoftJhengHei',
                                                                          fontSize: 15,
                                                                          color: Color(0xff363636)
                                                                      )
                                                                  ),
                                                                )
                                                              ]
                                                          )
                                                      )
                                                  )
                                              ),
                                            )
                                        )
                                    )
                                );

                              }))
                        ])
                    ))
            )
        )
    );
  }
}

class ProductPage extends StatelessWidget {

  late Product product;

  ProductPage.name(this.product, {Key? key}) : super(key: key);

  ProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            top: true,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: product.img.contains("assets")
                                  ? Image.asset(product.img)
                                  : Image.file(File(product.img)))),
                      Align(
                          alignment: const Alignment(-1, 1),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.tittle,
                                    style: const TextStyle(
                                      fontFamily: 'MicrosoftJhengHei',
                                      fontSize: 25,
                                      color: Color(0xff363636),
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                Text(product.author,
                                    style: const TextStyle(
                                      fontFamily: 'MicrosoftJhengHei',
                                      fontSize: 25,
                                      color: Color(0xff363636),
                                    )
                                ),
                              ])
                      ),
                      Align(
                        alignment: const Alignment(1, 1),
                        child: Column(
                          children: [
                            Text(product.price,
                                style: const TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  fontSize: 25,
                                  color: Color(0xff363636),
                                )
                            ),
                            ButtonTheme(
                                minWidth: 200.0,
                                height: 100.0,
                                child: OutlinedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0))),
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff92570B)),
                                      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xff363636)),
                                    ),
                                    child: const Text("Add to cart"))),
                          ],
                        ),
                      ),
                      Align(
                          alignment: const Alignment(1, 1),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Description",
                                    style: TextStyle(
                                      fontFamily: 'MicrosoftJhengHei',
                                      fontSize: 20,
                                      color: Color(0xff363636),
                                      fontWeight: FontWeight.bold
                                    )
                                ),
                                const SizedBox(height: 10),
                                Text(product.description,
                                    style: const TextStyle(
                                      fontFamily: 'MicrosoftJhengHei',
                                      fontSize: 20,
                                      color: Color(0xff363636),
                                    )
                                ),
                              ])
                      ),
                    ])
                )
            )
        )
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          decoration: myBoxDecoration(),
          child: Column(
            children:  [
              SizedBox(height: 20),
              const Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'MicrosoftJhengHei',
                        fontSize: 25,
                        color: Color(0xff363636))),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: const Alignment(-0.7, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: const Text(
                          '\u2022 Books',
                          style: TextStyle(
                              fontFamily: 'MicrosoftJhengHei',
                              fontSize: 20,
                              color: Color(0xff363636)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductsPage.name("books")));
                        }
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                        child: const Text(
                          '\u2022 Audiobooks',
                          style: TextStyle(
                              fontFamily: 'MicrosoftJhengHei',
                              fontSize: 20,
                              color: Color(0xff363636)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductsPage.name("audiobooks")));
                        }),
                    const SizedBox(height: 10),
                    GestureDetector(
                        child: const Text(
                          '\u2022 Music',
                          style: TextStyle(
                              fontFamily: 'MicrosoftJhengHei',
                              fontSize: 20,
                              color: Color(0xff363636)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductsPage.name("music")));
                        })
                  ],
                ),
              )

              ],
          )
        ));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: const Color(0xff363636)  // red as border color
      ),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      );
  }
}

class VisualisationPage extends StatefulWidget {
  const VisualisationPage({Key? key}) : super(key: key);

  @override
  _VisualisationState createState() => _VisualisationState();
}

class _VisualisationState extends State<VisualisationPage> {
  List images = [];

  Future _initImages() async {
    final Map<String, dynamic> assets =
    jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    List imagePaths = assets.keys
        .where((String key) => key.contains('/animation/'))
        .toList();

    setState(() {
      for (int i = 0; i < imagePaths.length; i++) {
        images.add(Image.asset(imagePaths[i], gaplessPlayback: true, fit: BoxFit.cover));
      }
    });
  }

  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _initImages();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Stack(
        children: <Widget>[
          Column(
              children: <Widget>[
                if(images.isNotEmpty) ... {
                  images[_currentSliderValue.round()]
                } else ... {
                  const CircularProgressIndicator()
                }
          ]
          ),
          if(_currentSliderValue > 40 && _currentSliderValue < 80) ... {
            Positioned(
              height: 190,
              width: 670,
              child: IconButton(
                icon: const Icon(Icons.new_releases_rounded, color: Colors.amber),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('TV',
                        style: TextStyle(
                          fontFamily: 'MicrosoftJhengHei',
                          color: Color(0xff363636),
                      )),
                      content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Display:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                              )
                          ),
                          Text('27.6 in, IPS, 2560 x 2880 pixels'),
                          SizedBox(height: 2),
                          Text('Viewing angles (H/V):',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                                fontWeight: FontWeight.bold
                              )
                          ),
                          Text('178 ° / 178 °'),
                          SizedBox(height: 2),
                          Text('Brightness:',
                            style: TextStyle(
                                fontFamily: 'MicrosoftJhengHei',
                                color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                            )
                          ),
                          Text('300 cd/m²'),
                          SizedBox(height: 2),
                          Text('Static contrast:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('1000 : 1'),
                        ],
                      ))
                      ,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'))
                      ],
                    ),
                  );
                },
              ),
            )
          }
          else if(_currentSliderValue > 113 && _currentSliderValue < 118) ... {
            Positioned(
              height: 220,
              width: 730,
              child: IconButton(
                icon: const Icon(Icons.new_releases_rounded, color: Colors.amber),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Wall shelf',
                        style: TextStyle(
                          fontFamily: 'MicrosoftJhengHei',
                          color: Color(0xff363636),
                      )),
                      content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Design:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                              )
                          ),
                          Text('Very nice'),
                          SizedBox(height: 2),
                          Text('Width',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                                fontWeight: FontWeight.bold
                              )
                          ),
                          SizedBox(height: 2),
                          Text('40 cm'),
                          SizedBox(height: 2),
                          Text('Height:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('40 cm'),
                          Text('Deep:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Text('300 cm'),
                        ],
                      ))
                      ,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'))
                      ],
                    ),
                  );
                },
              ),
            )
          }
          else if(_currentSliderValue > 154 && _currentSliderValue < 189) ... {
            Positioned(
              height: 120,
              width: 200,
              child: IconButton(
                icon: const Icon(Icons.new_releases_rounded, color: Colors.amber),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Book shelf',
                        style: TextStyle(
                          fontFamily: 'MicrosoftJhengHei',
                          color: Color(0xff363636),
                      )),
                      content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Design:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                              )
                          ),
                          Text('Wooden'),
                          SizedBox(height: 2),
                          Text('Height',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                                fontWeight: FontWeight.bold
                              )
                          ),
                          Text('250 cm'),
                          SizedBox(height: 2),
                          Text('Width: ',
                            style: TextStyle(
                                fontFamily: 'MicrosoftJhengHei',
                                color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                            )
                          ),
                          Text('150 cm'),
                          SizedBox(height: 2),
                          Text('Deep',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('70 cm'),
                        ],
                      ))
                      ,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'))
                      ],
                    ),
                  );
                },
              ),
            )
          }
          else if(_currentSliderValue >= 240) ... {
            Positioned(
              height: 185,
              width: 580,
              child: IconButton(
                icon: const Icon(Icons.new_releases_rounded, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Cupboard',
                        style: TextStyle(
                          fontFamily: 'MicrosoftJhengHei',
                          color: Color(0xff363636),
                      )),
                      content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Design:',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                              )
                          ),
                          Text('Modern'),
                          SizedBox(height: 2),
                          Text('Height',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                                fontWeight: FontWeight.bold
                              )
                          ),
                          Text('70 cm'),
                          SizedBox(height: 2),
                          Text('Width',
                            style: TextStyle(
                                fontFamily: 'MicrosoftJhengHei',
                                color: Color(0xff363636),
                            fontWeight: FontWeight.bold
                            )
                          ),
                          Text('70 cm'),
                          SizedBox(height: 2),
                          Text('Deep',
                              style: TextStyle(
                                  fontFamily: 'MicrosoftJhengHei',
                                  color: Color(0xff363636),
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('50 cm'),
                        ],
                      ))
                      ,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'))
                      ],
                    ),
                  );
                },
              ),
            )
          }
        ]
        ),
            Slider(
              value: _currentSliderValue,
              max: images.length.toDouble() - 1,
              label: _currentSliderValue.round().toString(),
              activeColor: const Color(0xff92570B),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            )
    ]));
  }
}
