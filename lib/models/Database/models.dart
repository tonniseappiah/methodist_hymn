

class LangIndexDB {
  int _id;
  int _index;


  LangIndexDB.withID(this._id, this._index);

  LangIndexDB(this._index);

  // getters
  int get id => _id;
  int get index => _index;

// setters
  set index(int newIndex) {
    this._index = newIndex;
  }

  // Converting the LangIndexDB object into map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }

    map['index'] = _index;

    return map;
  }

  // function for extracting a LangIndexDB object from a map object
  LangIndexDB.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._index = map['index'];
  }
}

class HymnsDB {

  int _hymnsID;
  String _title;
  String _author;


  HymnsDB.withID(this._hymnsID, this._title, this._author);

  HymnsDB(this._title, this._author);

  // getters
  int get hymnsID => _hymnsID;
  String get title => _title;
  String get author  => _author;

// setters
  set title(String newTitle) {
    this._title = newTitle;
  }

  set author(String newAuthor) {
    this._author = newAuthor;
  }

  // Converting the LangIndexDB object into map object for database
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (hymnsID != null) {
      map['hymnsID'] = _hymnsID;
    }

    map['title'] = _title;
    map['author'] = _author;

    return map;
  }

  // function for extracting a LangIndexDB object from a map object
  HymnsDB.fromMapObject(Map<String, dynamic> map) {
    this._hymnsID = map['hymnsID'];
    this._title = map['title'];
    this._author = map['author'];
  }

}