import 'package:flutter/material.dart';

class Details extends StatelessWidget {

  String url;
  String type;
  int price;

  Details(this.url, this.type, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RealState On Mars"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10.0),
                height: 300.0,
                width: 400.0,
                child: Image.network(url,fit: BoxFit.cover,)
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(type,style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("$price/month",style: TextStyle(fontSize: 20.0,),),
            )
          ],
        ),
      ),
    );
  }
}
