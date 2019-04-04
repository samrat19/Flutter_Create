import 'package:flutter/material.dart';import 'dart:convert';import 'dart:async';import 'package:http/http.dart' as http;
class ModelNews extends StatefulWidget {final String url;ModelNews(this.url);@override _ModelNewsState createState() => _ModelNewsState(this.url);
}class _ModelNewsState extends State<ModelNews> {int currentTab = 0;final String url;_ModelNewsState(this.url);final String url1 = "";List data;bool isdataloaed = false;
@override void initState() {super.initState();this.getJsonData();}Future<String> getJsonData() async {var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});setState(() {var convertDataToJson = json.decode(response.body);data = convertDataToJson['articles'];isdataloaed = true;});return "Success";} @override Widget build(BuildContext context) {return Container(color: Colors.blueGrey[900],child: isdataloaed ? ListView.builder(itemCount: data == null ? 0 : data.length,itemBuilder: (BuildContext context, int index) {return Column(children: <Widget>[Image.network(data[index]['urlToImage']),Divider(),ClipRRect(clipBehavior: Clip.hardEdge,borderRadius: BorderRadius.circular(20.0),child: Card(color: Colors.blueGrey[800],child: Text(data[index]['title'],style: TextStyle(fontSize: 20.0,color: Colors.white),),),),Divider(height: 20.0,),],);}, ) : Center(child: CircularProgressIndicator(backgroundColor: Colors.red,strokeWidth: 6.0,),),);;}}
