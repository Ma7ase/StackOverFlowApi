

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Link;
  final Accoud_id;
  final Name;
  final Create_Data;
  final question_id;
  DetailPage({
    this.Accoud_id,
    this.Link,
    this.Create_Data,
    this.Name,
    this.question_id
   });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
 
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
        backgroundColor: Colors.blueGrey,
          title:         const Text('Stack exchange APIS', 
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        ),),
        ),
        body: Container(
          //margin: EdgeInsets.only(left: 15),
          child: ListView(
            children: [Column(

              children:  [
              // ignore: prefer_interpolation_to_compose_strings
              Row(
                children: [
                  Expanded(child:  Text('Question Id: '+widget.question_id
                  , 
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 15.0,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,),),),
                ],
              ),
               // ignore: prefer_interpolation_to_compose_strings
               Row(
                 children: [
                   Expanded(child:  Text('Creation Date: '+widget.Create_Data
              , 
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 15.0,
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,),),),
                 ],
               ),
              Row(
                 children: [
                   Expanded(child:  Text('Account Id: '+widget.Accoud_id
              , 
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 15.0,
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,),),),
                 ],
               ),  
               Row(
                 children: [
                   Expanded(child:  InkWell(onTap: (() async =>  await launch(widget.Link)), 
                   child: Text('Link: '+widget.Link, 
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 15.0,
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,),)),),
                 ],
               ),                          
              ],
              ),],
              ),
              ),
        
      );
    }
  }
}