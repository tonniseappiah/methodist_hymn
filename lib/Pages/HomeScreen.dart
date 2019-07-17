import 'package:flutter/material.dart';
import 'package:methodist_hymn/Pages/HymnTypes.dart';
import 'dart:ui';
import 'Authors.dart';
import 'HymnInput.dart';
import 'HymnSelection.dart';
import 'Languages.dart';

List<String> language = ['English', 'Twi'];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const TextStyle dropDownLabelStyle = TextStyle(fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

class _HomeScreenState extends State<HomeScreen> {

  var selectedOptionsIndex = 0;
  var selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/yamaha.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
              ),
            ),
          ),
          SingleChildScrollView(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Languages()));
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.book, color: Colors.white),
                                SizedBox(width: 10.0,),
                                Text(language[selectedLanguageIndex],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),// for spacing widgets
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HymnInput()));
                            },
                            child: Icon(
                                Icons.search,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Icon(Icons.settings, color: Colors.white,),
                        ],
                      ),
                    ),

                    Container( // container for the input
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HymnSelection()));
                        },
                        child: Material(
                          elevation: 10.0,
                          color: Colors.white.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.format_list_numbered,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 15.0,),
                                Text(
                                  'Select Hymn Number',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * .15),

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, bottom: 40.0),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('DID',
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )
                                  ),
                                  Text('YOU KNOW',
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )
                                  ),
                                  Text(
                                    'Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare'
                                        'adipiscing nunc adipiscing. Condimentum turpis massa',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color.fromRGBO(35, 223, 140, 1.0),
                                    style: BorderStyle.solid,
                                    width: 1.0
                                )
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Find More',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0, left: 10.0, bottom: 10.0),
                      height: 130.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(width: 20.0),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorPage() ));
                            },
                              child: _toAuthors()
                          ),
                          SizedBox(width: 20.0),
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HymnType() ));
                              },
                              child: _toHymnType()
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _toAuthors() {
    return Container(
      height: 125.0,
      width: 205.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Authors',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Container(
                    height: 1.0,
                    width: 75.0,
                    color: Color.fromRGBO(35, 223, 140, 1.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Get to know the writters of the hymns',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _toHymnType() {
    return Container(
      height: 125.0,
      width: 215.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hymnal Types',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Container(
                    height: 1.0,
                    width: 75.0,
                    color: Color.fromRGBO(35, 223, 140, 1.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Get to know the various hymnal types of the MHB',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

