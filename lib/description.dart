// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_if_null_operators, unnecessary_null_comparison

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchon;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(bannerurl, fit: BoxFit.cover))),
                  Positioned(
                      left: 5,
                      bottom: 10,
                      child: Text(
                        'Average Rating - ' + vote,
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                name,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Releasing on - ' + launchon,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
