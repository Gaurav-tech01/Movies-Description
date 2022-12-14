// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Tv Shows'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    // ignore: prefer_if_null_operators
                                    name: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'Not Loaded',
                                    description: tv[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    vote: tv[index]['vote_average'].toString(),
                                    launchon:
                                        tv[index]['release_date'].toString(),
                                  )));
                    },
                    child: tv[index]['original_name'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                    width: 250,
                                    height: 170,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500' +
                                                    tv[index]['poster_path']),
                                            fit: BoxFit.cover))),
                                Container(
                                  // ignore: prefer_if_null_operators
                                  child: Text(tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
                                      : 'Loading'),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
