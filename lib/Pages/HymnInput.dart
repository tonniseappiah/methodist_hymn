import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:methodist_hymn/common/topBackgroundColour.dart';

import 'HomeScreen.dart';
import 'HymnSelection.dart';
import 'Languages.dart';

class HymnInput extends StatefulWidget {
  @override
  _HymnInputState createState() => _HymnInputState();
}

class _HymnInputState extends State<HymnInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 25.0,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      Spacer(),// for spacing widgets
                      Container( // container for the input
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Material(
                          elevation: 10.0,
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.clear, color: Colors.white),
                                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText: 'Search Hymn',
                                hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container( // container for the input
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 1.0,
                  alignment: Alignment.center,
                  color: Color.fromRGBO(35, 223, 140, 1.0),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
