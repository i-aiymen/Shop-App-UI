import 'package:flutter/material.dart';

import 'DetailsPage.dart';

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
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: Container(
            height: 70,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.grey[300],
                        spreadRadius: 1)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer2icons(Icons.person),
                  buildContainer2icons(Icons.shopping_bag),
                  buildContainer2icons(Icons.home, isSelected: true),
                  buildContainer2icons(Icons.favorite),
                  buildContainer2icons(Icons.settings),
                ],
              ),
            ),
          ),
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
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
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
                        myCandlesList(),
                        SizedBox(height: 20),
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
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              buildContainer("3"),
                              buildContainer("2"),
                              buildContainer("1"),
                              buildContainer("4"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container buildContainer2icons(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.pink[100] : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : []),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Container buildContainer(String img) {
    return Container(
        height: 150,
        width: 255,
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.asset(
                      "assets/images/candel$img.jpg",
                      fit: BoxFit.cover,
                    ))),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coconut Milk Bath"),
                  Text(
                    "16 oz",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "\$28",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ));
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

class myCandlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 13),
          buildColumn2("1", "Elemental Tin Candle", "29",context),
          buildColumn2("2", "Summer Candle", "23",context),
          buildColumn2("3", "Winter Candle", "40",context),
          buildColumn2("4", "Dummy Candle", "60",context),
        ],
      ),
    );
  }

  GestureDetector buildColumn2(String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage();
        }));
      },
      child: Padding(
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
      ),
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
