import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sub_page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final res = await json.decode(response);
    List data = res['elements'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: 55),
            Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "Tabla Periodica",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Garamond',
                    color: Colors.blueGrey.shade100,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Image - - - - //
                              Container(
                                child: Image.asset("assets/image.jpg"),
                              ),
                              // - - - //
                              Text(
                                "Adriana Abad Santana",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Garamond',
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "adrianaabad2014@gmail.com",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Garamond',
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: readJson(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  } else {
                    return GridView.builder(
                      padding: EdgeInsets.only(top: 20),
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => SubPage(
                                  map: snapshot.data![i],
                                ),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(13),
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 0.0),
                                    color: Colors.grey,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  snapshot.data![i]['symbol'],
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Garamond',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
