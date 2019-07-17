import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:methodist_hymn/common/topBackgroundColour.dart';

import 'AuthorInput.dart';

class AuthorPage extends StatefulWidget {
  @override
  _AuthorPageState createState() => new _AuthorPageState();
}

List<String> options = ['English Hymn', 'Twi Hymn'];
const TextStyle dropDownLabelStyle = TextStyle(fontSize: 25.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

class _AuthorPageState extends State<AuthorPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    /* Pop and Back navigation */
                    SizedBox(height: 25.0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios, color: Colors.white,)
                          ),
                          SizedBox(width: 30.0,),
                          Text('Authors',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  color: Color(getColorHexFromStr('#aaaaaa')),
                              )
                          ),
                          Spacer(), // for spacing widgets
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorInput()));
                            },
                            child: Icon(
                                Icons.search,
                                color: Color.fromRGBO(35, 223, 140, 1.0)
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          PopupMenuButton(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.more_vert, color: Color.fromRGBO(35, 223, 140, 1.0),)
                                ],
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(options[0], style: dropDownMenuItemStyle,),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(options[1], style: dropDownMenuItemStyle,),
                                  value: 1,
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 13.0),
                            child: Container(
                              height: 25.0,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Hymn Authors',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                              ),
                              Text(
                                'Order from A - Z',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Color(getColorHexFromStr('#aaaaaa')),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.only(top: 15.0,),
                      height: 125.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _foodCard(),
                          SizedBox(width: 10.0),
                          _foodCard(),
                          SizedBox(width: 10.0),
                          _foodCard(),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25.0,),
                  child: Text(
                    'September 7',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(getColorHexFromStr('#aaaaaa')),
                        fontSize: 14.0
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'AUTHOR OF THE TODAY',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10.0),
                      child: Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color.fromRGBO(35, 223, 140, 1.0),
                            ),
                            image: DecorationImage(image: AssetImage('assets/images/chris.jpg'), fit: BoxFit.cover)
                        ),
                        /*child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                    ),
                  ),*/
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 150.0, left: 60.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('100 HYMNALS',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                      color: Color(getColorHexFromStr('181818')),
                                      blurRadius: 3.0,
                                      offset: Offset(0.0, 0.0)
                                  )
                                ],
                              ),
                            ),
                            Text('CHARLSE WESLEY',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 26.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                      color: Color(getColorHexFromStr('181818')),
                                      blurRadius: 3.0,
                                      offset: Offset(0.0, 0.0)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 60.0),
                              child: Container(
                                height: 2.0,
                                width: 150.0,
                                color: Color.fromRGBO(35, 223, 140, 1.0),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodCard() {
    return SizedBox(
      height: 125.0,
      width: 200.0,
      child: Card(
        color: Colors.white.withOpacity(0.3),
        margin: const EdgeInsets.only(left: 15.0, bottom: 10.0),
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(35, 223, 140, 1.0),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Row(
            children: <Widget>[

              SizedBox(width: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Hymns Written: 100',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 65.0),
                    child: Container(
                      height: 1.0,
                      width: 75.0,
                      color: Color.fromRGBO(35, 223, 140, 1.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            image: DecorationImage(
                                image: AssetImage('assets/images/chris.jpg'))),
                      ),
                      SizedBox(width: 10.0),
                      Text('Charlse Wesley',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(getColorHexFromStr('#aaaaaa')),
                            fontWeight: FontWeight.bold,
                          ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}