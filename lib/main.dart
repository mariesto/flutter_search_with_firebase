import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore/search_service.dart';
import 'package:flutter_firestore/search_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
      title: Text('Firestore search'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchState(),
                ));
          },
        ),
      ],
    )
//        body: StreamBuilder(
//          stream: Firestore.instance
//              .collection('article')
//              .where('title', isGreaterThanOrEqualTo: 'maxime')
//              .snapshots(),
//          builder: (BuildContext context, snapshot) {
//            if (!snapshot.hasData) return const Text("Loading....");
//
//            return ListView.builder(
//              itemExtent: 120.0,
//              itemCount: snapshot.data.documents.length,
//              itemBuilder: (context, index) =>
//                  _buildListItem(context, snapshot.data.documents[index]),
//            );
//          },
//        ));
        );
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return ListTile(
    title: Row(
      children: [
        Expanded(
          child: Text(
            document['title'],
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Color(0xffddddff)),
          padding: EdgeInsets.all(10.0),
          child: Text(
            document['userId'].toString(),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ],
    ),
    onTap: () {},
  );
}

Widget buildResultCard(data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          child: Center(
              child: Text(
        data['title'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ))));
}
