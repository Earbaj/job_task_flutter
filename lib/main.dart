import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_task/model/model.dart';
import 'package:job_task/utils/propartyList.dart';

Future<List<MarsModel>> fetchjson(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://mars.udacity.com/realestate'));
  return compute(parseJson, response.body);
}

// function that converts a response body into a List<Photo>.
List<MarsModel> parseJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MarsModel>((json) => MarsModel.fromJson(json)).toList();
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RealState On Mars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<MarsModel>>(
        future: fetchjson(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //if it something happens or no internet show this
            return Center(
              child: Text('Error or No Internet'),
            );
          } else if (snapshot.hasData) {
            //if it has data than it pass the data to propartylist class
            return PropartyList(snapshot.data!);
          } else {
            //load the loading indiator while parsing data
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
