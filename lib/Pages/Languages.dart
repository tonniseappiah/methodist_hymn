import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:methodist_hymn/common/topBackgroundColour.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:methodist_hymn/models/Database/models.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:methodist_hymn/models/Database/databaseHelper.dart';

import 'HymnSelection.dart';

class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

List<String> languageIndex = ['English', 'Twi'];

class _LanguagesState extends State<Languages> {

  var selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
            'Hymn Languages',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(getColorHexFromStr('#aaaaaa')),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 330,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InkWell(
              onTap: (){
                onTap(0);
              },
              child: _languageGrid(0),
            ),
            InkWell(
              onTap: (){
                onTap(1);
              },
              child: _languageGrid(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageGrid(int index) {
    return SizedBox(
      width: 180.0,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 60.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        color: Color(getColorHexFromStr('#181818')),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(35, 223, 140, 1.0),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            children: <Widget>[
              Icon(Icons.book, size: 150.0, color: Color.fromRGBO(35, 223, 140, 1.0),),
              SizedBox(height: 5.0,),
              Text(
                languageIndex[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  shadows: [
                    Shadow(
                      blurRadius: 3.0,
                      color: Color(getColorHexFromStr('#aaaaaa')),
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onTap (int index){
    setState(() {
      selectedLanguageIndex = index;
    });

    if (selectedLanguageIndex == index){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HymnSelection()));
    }
  }

}
