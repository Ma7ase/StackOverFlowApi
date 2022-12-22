import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/DetailsPage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  List images = [];
  late Timer _timer;
  String car_id = '';
  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse("https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow"));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
   /*  print('responsebody');
    print(responsebody['items'][0]['owner']['link'].toString()); */
    print(responsebody.length);

    return responsebody;
  }



  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Question'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
      children: <Widget>[ 
        const Text('Stack exchange APIS', 
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        ),
        textAlign: TextAlign.left,
        ),
        const SizedBox(
        height: 20,
        ),
         Row(
          children: <Widget>[
            Expanded(
              //padding: EdgeInsets.only(top: 300),
              child: SizedBox(
              height: MediaQuery.of(context).size.height > 900 ? MediaQuery.of(context).size.height/2 -110: 500,

                //height: 300,
                child: FutureBuilder(
                    future: getData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollController,
                          child: ListView.builder(
                              controller: _scrollController,
                              itemCount: 30,
                              //itemCount: 1,
                              itemBuilder: (context, i) {
                                return Container(
 
                                                height: MediaQuery.of(context).size.height > 950 ? 166: 84,

                       
                                  child: InkWell(onTap: ()  {
                                    Navigator.push(context,MaterialPageRoute(builder: ((context) => DetailPage(Accoud_id:snapshot.data['items'][i]['owner']['account_id'].toString() ,
                                    Create_Data: snapshot.data['items'][i]['creation_date'].toString(),
                                    Link: snapshot.data['items'][i]['link'],
                                    Name: snapshot.data['items'][i]['owner']['account_id'].toString(),
                                    question_id: snapshot.data['items'][i]['question_id'].toString(),))));
/*                                     print('Link'+snapshot.data['items'][i]['link']);
                                    print('Accoud_id'+snapshot.data['items'][i]['owner']['account_id'].toString());
                                    print('Name:'+snapshot.data['items'][i]['owner']['display_name']); 
                                    print('Create_Data'+snapshot.data['items'][i]['creation_date'].toString());
                                    print('question_id'+snapshot.data['items'][i]['question_id'].toString()); */
/*                                        await launch(snapshot.data['items'][i]['link']);
 */ 
                                  },
                                    child: Row(
                                      children: [
                               Expanded(child:  Text(
                                    snapshot.data['items'][i]['title'].toString(), 
                                          style: const TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),)
                                        
                                      ],
                                    ),
                                    
                                  ),
                                );
                              }),
                        );
                      }
                      return const Center(
                        child: Text(
                          "Stack Question",
                     
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
