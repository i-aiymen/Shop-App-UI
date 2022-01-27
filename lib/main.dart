import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.grey[200],
            elevation: 0,
            leading: Image.asset("assets/images/hamburger.png"),
            actions: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  margin: EdgeInsets.all(10),
                  child: Image.asset("assets/images/SEARCH.png")),
            ],
          ),
          body: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Text("Shop ",
                      style: TextStyle(fontSize: 32, letterSpacing: 1)),
                  Text("Anthropologie",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1))
                ],
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildFlatButton("Home decor", isSelected: true),
                buildFlatButton("Bath & Body"),
                buildFlatButton("Beauty"),
              ]),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          spreadRadius: 1,
                          blurRadius: 20,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildColumn("Candles", isSelected: true),
                            buildColumn("Vases"),
                            buildColumn("Bins"),
                            buildColumn("Floral"),
                            buildColumn("Decor"),
                          ]),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 13),
                            buildColumn2("1", "Elemental Tin Candle", "29"),
                            buildColumn2("2", "Summer Candle", "23"),
                            buildColumn2("3", "Winter Candle", "40"),
                            buildColumn2("4", "Dummy Candle", "60"),
                          ],
                        ),
                      ),
                      LineBar(),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          children: [
                            Text(
                              "Holiday Special",
                              style: TextStyle(fontSize: 24),
                            ),
                            Spacer(),
                            Text(
                              "View All",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Padding buildColumn2(String img, String title, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              height: 220,
              width: 160,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/candel$img.jpg",
                    fit: BoxFit.cover,
                  ))),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "\$$price",
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }

  Column buildColumn(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey, fontSize: 18),
        ),
        SizedBox(height: 5),
        if (isSelected)
          Container(
            width: 5,
            height: 5,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          )
      ],
    );
  }

  FlatButton buildFlatButton(String text, {bool isSelected = false}) {
    return FlatButton(
      onPressed: () {
        print("Button pressed");
      },
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, fontSize: 18),
      ),
      shape: StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[300],
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
      ),
    );
  }
}
