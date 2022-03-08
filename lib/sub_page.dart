import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubPage extends StatefulWidget {
  SubPage({Key? key, required this.map}) : super(key: key);

  Map map;

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.map['name'],
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.blueGrey.shade100,
            fontSize: 40,
            fontFamily: 'Garamond',
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              //SizedBox(height: 40),
              SizedBox(height: 25),
              Text(
                widget.map['summary'],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 21,
                  fontFamily: 'Garamond',
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Atomic Mass:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  Text(
                    widget.map['atomic_mass'].toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electron configuration:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  (widget.map['electron_configuration_semantic']
                              .toString()
                              .length <
                          20)
                      ? Text(
                          widget.map['electron_configuration_semantic']
                              .toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 20,
                            fontFamily: 'Garamond',
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  (widget.map['electron_configuration_semantic']
                              .toString()
                              .length >
                          20)
                      ? Text(
                          widget.map['electron_configuration_semantic']
                              .toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 20,
                            fontFamily: 'Garamond',
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  (widget.map['category'].toString().length < 20)
                      ? Text(
                          widget.map['category'].toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 20,
                            fontFamily: 'Garamond',
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  (widget.map['category'].toString().length > 20)
                      ? Text(
                          widget.map['category'].toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 20,
                            fontFamily: 'Garamond',
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Appearance: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  (widget.map['appearance'].toString().length < 30)
                      ? Text(
                          widget.map['appearance'].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 20,
                            fontFamily: 'Garamond',
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              (widget.map['appearance'].toString().length > 30)
                  ? Text(
                      widget.map['appearance'].toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.blueGrey.shade100,
                        fontSize: 20,
                        fontFamily: 'Garamond',
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Density:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  Text(
                    widget.map['density'].toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Period:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  Text(
                    widget.map['period'].toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shells:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  Text(
                    widget.map['shells'].toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electron Affinity:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                  Text(
                    widget.map['electron_affinity'].toString(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                      fontSize: 20,
                      fontFamily: 'Garamond',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
