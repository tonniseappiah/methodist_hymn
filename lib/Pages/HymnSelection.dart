import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:methodist_hymn/common/topBackgroundColour.dart';
import 'HomeScreen.dart';
import 'HymnInput.dart';
import 'Languages.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:methodist_hymn/models/Database/models.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:methodist_hymn/models/Database/databaseHelper.dart';



class HymnSelection extends StatefulWidget {
  @override
  _HymnSelectionState createState() => _HymnSelectionState();
}

List<String> language = ['English', 'Twi'];
List<String> book = ['Hymnals', 'Canticles'];

class Layout {
  String name;
  IconData icon;

  Layout(this.name, this.icon);
}
List<Layout> layout = [
  Layout('GridView', Icons.apps),
  Layout('ListView', Icons.format_list_bulleted),
];

const TextStyle dropDownLabelStyle = TextStyle(fontSize: 25.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.w600);


class _HymnSelectionState extends State<HymnSelection> {




  var selectedBookIndex = 0;
  var selectedLayoutIndex = 0;

  var selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      child: Column(
                        children: <Widget>[
                          /* Pop and Back navigation */
                          SizedBox(height: 25.0,),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()) );
                                    },
                                    child: Icon(Icons.close, color: Colors.white,)
                                ),
                                SizedBox(width: 30.0,),
                                Text('Choose Book',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      color: Color(getColorHexFromStr('#aaaaaa')),
                                    )
                                ),
                                Spacer(),// for spacing widgets
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Languages()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(language[selectedLanguageIndex],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                      SizedBox(width: 16.0,),
                                      Icon(Icons.language, color: Colors.white)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /* input container */
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height * .80,
                      child: _hymnalGrid(),
                    ),

                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .13, left: 7.0, right: 7.0),

                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.grey[850],
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0, bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.0),
                              child: Container(
                                height: 15.0,
                                padding: EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Color.fromRGBO(35, 223, 140, 1.0),
                                            style: BorderStyle.solid,
                                            width: 1.0
                                        )
                                    )
                                ),
                              ),
                            ),
                            PopupMenuButton(
                                onSelected: (index){
                                  setState(() {
                                    selectedBookIndex = index;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      book[selectedBookIndex],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.white)
                                  ],
                                ),
                                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Text(book[0], style: dropDownMenuItemStyle,),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Text(book[1], style: dropDownMenuItemStyle,),
                                    value: 1,
                                  ),
                                ]
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HymnInput()));
                              },
                              child: Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(35, 223, 140, 1.0)
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            PopupMenuButton(// Layout Popup menu
                                onSelected: (index){
                                  setState(() {
                                    selectedLayoutIndex = index;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(layout[selectedLayoutIndex].icon, color: Color.fromRGBO(35, 223, 140, 1.0))
                                  ],
                                ),
                                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.apps),
                                        SizedBox(width: 10.0,),
                                        Text('GridView', style: dropDownMenuItemStyle,),
                                      ],
                                    ),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.format_list_bulleted),
                                        SizedBox(width: 10.0,),
                                        Text('ListView', style: dropDownMenuItemStyle,),
                                      ],
                                    ),
                                    value: 1,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _hymnalGrid() {
    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(80, (index) {
        return Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          elevation: 3.0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(getColorHexFromStr('#4c4c4c')),
                ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: Color(getColorHexFromStr('#fff5ea')),
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
